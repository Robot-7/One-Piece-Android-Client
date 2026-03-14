----------------------------------------------------------------------------------
--[[
	FILE:			CSBattleListPage.lua
	ENCODING:		UTF-8, no-bomb
	DESCRIPTION:	跨服战:我的比赛、比赛回放
	AUTHOR:			hgs
	CREATED:		2013-12-28
--]]
----------------------------------------------------------------------------------
require "CsBattle_pb"
require "UserBattle_pb"

local CSTools = require("CSTools")
local thisPageName = "CSBattleListPage"

local opcodes = {
	OPCODE_CS_WARPLAYBACK_LISTSTATE_C = 2019,
	OPCODE_CS_WARPLAYBACK_LISTSTATE_S = 2020,
	OPCODE_CS_WARPLAYBACK_C = 2021,
	OPCODE_CS_WARPLAYBACK_S = 2022,
	OPCODE_CS_MYPLAYBACK_C = 2023,
	OPCODE_CS_MYPLAYBACK_S = 2024,
	OPCODE_USER_BATTLERET_S = 108
}

local option = {
	ccbiFile = "CrossServerWarPopUp.ccbi",
	handlerMap = {
		onClose	= "onClose"
	},
	opcode = opcodes
}

local GroupId = {
	Winner	= 1,
	Loser	= 2
}

local CSBattleList = {}

BattleList = {
	Type_MyBattle = 1,
	Type_Playback = 2
}

local battleInfo = {
	battleId   = 1,
	battleType = BattleList.Type_MyBattle,
	battleList = {},
	result = {},
	vsInfo = {}
}

function BattleList.setType(battleId, bType)
	battleInfo.battleId	  = battleId
	battleInfo.battleType = bType
	battleInfo.battleList = {}
	battleInfo.vsInfo = {}
end

function BattleList.setVSInfo(vsInfo, playerId)
	BattleList.setType(vsInfo.battleId, BattleList.Type_Playback)
	local needChangePos = (not vsInfo.hasChangePos) and playerId and (vsInfo.player2.playerIdentify == playerId);
	battleInfo.vsInfo = {
		id = vsInfo.vsIdentify,
		leftPlayer = CSTools.getPlayerInfo(needChangePos and vsInfo.player2 or vsInfo.player1),
		rightPlayer = CSTools.getPlayerInfo(needChangePos and vsInfo.player1 or vsInfo.player2),
		stage = vsInfo.battleStage,
		hasChangePos = vsInfo.hasChangePos or needChangePos
	}
end

local BattleResult = {
	Lose	= 0,
	WIN		= 1
}

local WinnerType = {
	Left = 1,
	Right = 2
}

local function sortMyGame(battle1, battle2)
	if not battle1.groupId or not battle2.groupId then
		return false
	end
	
	if battle1.battleId ~= battle2.battleId then
		return battle1.battleId > battle2.battleId
	end

	if battle1.stage ~= battle2.stage then
		return battle1.stage > battle2.stage
	end

	if battle1.groupId ~= battle2.groupId then
		return battle1.groupId > battle2.groupId
	end

	return battle1.id > battle2.id
end
----------------------------------------------------------------------------------
--scrollview 中的单个item
--------------------------------------------
local CSBattleListItem = {
	ccbiFile = "CrossServerWarPopUpContent.ccbi"
}

function CSBattleListItem.onFunction(eventName, container)
	if eventName == "luaRefreshItemView" then
		CSBattleListItem.onRefreshItemView(container)
	elseif eventName == "onView" then
		CSBattleListItem.onViewBattle(container)
	end
end

function CSBattleListItem.onRefreshItemView(container)
	local contentId = container:getItemDate().mID
	local item = battleInfo.battleList[contentId]

	local isMyBattle = battleInfo.battleType == BattleList.Type_MyBattle
	common:setNodeVisible(container:getVarNode("mMyGameNode"), false)

	local leftPlayer = item.leftPlayer
	local rightPlayer = item.rightPlayer or {}

	local lb2Str = {
		mLeftServer		 = leftPlayer.serverName or "",
		mRightServer	 = rightPlayer.serverName or ""
	}
	
	--local groupId = item.groupId
	--if groupId == GroupId.Winner or groupId == GroupId.Loser then
	--	lb2Str["mPUCTitle"] = common:getLanguageString(string.format("@CSBattleName_%d_%d", item.stage, groupId))
	--else
		lb2Str["mPUCTitle"] = common:getLanguageString("@CSBattleName_" .. item.stage)
	--end

	common:setStringForLabel(container, lb2Str)
  container:getVarLabelTTF('mLeftPlayerName'):setFontSize(20)
  container:getVarLabelTTF('mRightPlayerName'):setFontSize(20)
	common:setStringForTTFLabel(container, {
		mLeftPlayerName	 = leftPlayer.name or "",
		mRightPlayerName = rightPlayer.name or ""
	})

	CSBattleListItem.showPlayerIcon(container, leftPlayer.discipleId, rightPlayer.discipleId)
	CSBattleListItem.showPlayerState(container, true, leftPlayer.id == item.winner)
	CSBattleListItem.showPlayerState(container, false, rightPlayer.id == item.winner)
end

function CSBattleListItem.showPlayerState(container, isLeftPos, isWinner)
	local pos = isLeftPos and "Left" or "Right"
	local state = isWinner and "Win" or "Lose"
	local bgPic = common:getSettingVar(string.format("CSBattlePlayerBg_%s_%s", pos, state))
	container:getVarSprite(string.format("m%sbg", pos)):setTexture(bgPic)
	local statePic = common:getSettingVar(string.format("CSBattle_%s_Icon", state))
	container:getVarSprite(string.format("m%sPic", pos)):setTexture(statePic)
end

function CSBattleListItem.showPlayerIcon(container, leftDiscipleId, rightDiscipleId)
	if leftDiscipleId then
		local leftDisciple = DiscipleTableManager:getInstance():getDiscipleItemByID(leftDiscipleId)
		container:getVarSprite("mLeftMemPic"):setTexture(leftDisciple.iconPic)
		common:setFrameQuality(container:getVarMenuItemImage("mLeftFrame"), leftDisciple.quality)
	end
	if rightDiscipleId then
		local rightDisciple = DiscipleTableManager:getInstance():getDiscipleItemByID(rightDiscipleId)
		container:getVarSprite("mRightMemPic"):setTexture(rightDisciple.iconPic)
		common:setFrameQuality(container:getVarMenuItemImage("mRightFrame"), rightDisciple.quality)
	else
		container:getVarSprite("mRightMemPic"):setTexture(common:getSettingVar("CSBattleEmpty_Icon"))
		common:setFrameQuality(container:getVarMenuItemImage("mRightFrame"))
	end
end


--点击领奖事件处理
function CSBattleListItem.onViewBattle(container)
	local contentId = container:getItemDate().mID
	local item = battleInfo.battleList[contentId]
	if battleInfo.battleType == BattleList.Type_MyBattle and not item.isKnockout then
		battleInfo.battleType = BattleList.Type_Playback
		battleInfo.vsInfo = common:deepCopy(item)
		battleInfo.battleList = {}
		PageManager.refreshPage(thisPageName)
	else
		local fp = FightPage:getInstance()
		fp:setFightType(FT_Playback)
		CSBattleListItem.sendPacketForReward(container)
	end
end

function CSBattleListItem.sendPacketForReward(container)
	local contentId = container:getItemDate().mID
	local item = battleInfo.battleList[contentId]

	local msg = CsBattle_pb.OPCSBattleViewBattle()
	msg.vsIdentify = item.id
	msg.turnIndex = contentId - 1

	local pb_data = msg:SerializeToString()
	PacketManager:getInstance():sendPakcet(opcodes.OPCODE_CS_WARPLAYBACK_C, pb_data, #pb_data, true)
end

----------------------------------------------------------------------------------
--CSBattleList页面中的事件处理
----------------------------------------------
function CSBattleList:onEnter(container)
	self:registerPacket(container)
	container:registerMessage(MSG_MAINFRAME_REFRESH)

	container:getVarNode("mPopUpTexNode"):setVisible(false)
	self:getBattleList(container)
end

function CSBattleList:getBattleList(container)
	if battleInfo.battleType == BattleList.Type_MyBattle then
		local msg = CsBattle_pb.OPCSBattleFetchMyBattle()
		msg.battleId = battleInfo.battleId
		local pb_data = msg:SerializeToString()
		PacketManager:getInstance():sendPakcet(opcodes.OPCODE_CS_MYPLAYBACK_C, pb_data, #pb_data, true)
	elseif battleInfo.battleType == BattleList.Type_Playback then
		local msg = CsBattle_pb.OPCSBattleRequestVsInfo()
		msg.vsIdentify = battleInfo.vsInfo.id
		local pb_data = msg:SerializeToString()
		PacketManager:getInstance():sendPakcet(opcodes.OPCODE_CS_WARPLAYBACK_LISTSTATE_C, pb_data, #pb_data, true)
	end
end

--回包处理
function CSBattleList:onReceivePacket(container)
	local opcode = container:getRecPacketOpcode()
	local msgBuff = container:getRecPacketBuffer()

    if opcode == opcodes.OPCODE_CS_MYPLAYBACK_S then
		local msg = CsBattle_pb.OPCSBattleFetchMyBattleRet()
		msg:ParseFromString(msgBuff)
		self:onReceiveMyBattle(container, msg)
		return
	end

	if opcode == opcodes.OPCODE_CS_WARPLAYBACK_LISTSTATE_S then
		local msg = CsBattle_pb.OPCSBattleRequestVsInfoRet()
		msg:ParseFromString(msgBuff)
		self:onReceiveListState(container, msg)
		return
	end

    if opcode == opcodes.OPCODE_CS_WARPLAYBACK_S then
		local msg = CsBattle_pb.OPCSBattleViewBattleRet()
		msg:ParseFromString(msgBuff)
		self:onReceivePlaybackInfo(container, msg)
		return
	end

	if opcode == opcodes.OPCODE_USER_BATTLERET_S then
		common:setBlackBoardVariable("BattleHideUpgradeEquip", true)
		PageManager.showFight(msgBuff, container:getRecPacketBufferLength(), true)
		return
	end
end

function CSBattleList:getPlayerInfo(csPlayerInfo)
	local playerInfo = {
		discipleId = csPlayerInfo.playerItemId,
		name = csPlayerInfo.playerName,
		id = csPlayerInfo.playerIdentify
	}
	if csPlayerInfo:HasField("serverName") then
		playerInfo.serverName = csPlayerInfo.serverName
	end
	return playerInfo
end

function CSBattleList:onReceiveMyBattle(container, msg)
	local battles = {}
	for _, vsInfo in ipairs(msg.myBattleVs) do
		local battle = {
			id = vsInfo.vsIdentify,
			battleId = vsInfo.battleId,
			leftPlayer = CSTools.getPlayerInfo(vsInfo.player1),
			stage = vsInfo.battleStage,
			hasChangePos = false
		}
		if vsInfo:HasField("player2") then
			battle.rightPlayer = CSTools.getPlayerInfo(vsInfo.player2)

			if battle.rightPlayer.id == msg.playerIdentify then
				local tmp = battle.rightPlayer;
				battle.rightPlayer = battle.leftPlayer;
				battle.leftPlayer = tmp;
				battle.hasChangePos = true;
			end
		end
		if vsInfo:HasField("winnerPlayer") then
			battle.winner = vsInfo.winnerPlayer
		end
		table.insert(battles, battle)
	end

	local isCsKnockout = msg.csGoingStage > 0 and CSTools.isCrossBattleBegin(battleInfo.battleId)
	local loseCount = 0
	for _, vsInfo in ipairs(msg.konckoutVs) do
		local battle = {
			isKnockout = true,
			id = vsInfo.vsIdentify,
			battleId = vsInfo.battleId,
			leftPlayer = CSTools.getPlayerInfo(vsInfo.player1),
			stage = vsInfo.battleStage,
			groupId = vsInfo.battleGroup,
			hasChangePos = false
		}
		if vsInfo:HasField("player2") then
			battle.rightPlayer = CSTools.getPlayerInfo(vsInfo.player2)
			
		    if battle.rightPlayer.id == msg.playerIdentify then
				local tmp = battle.rightPlayer;
				battle.rightPlayer = battle.leftPlayer;
				battle.leftPlayer = tmp;
				battle.hasChangePos = true;
			end
		end
		if vsInfo:HasField("winnerPlayer") then
			battle.winner = vsInfo.winnerPlayer
		end
		table.insert(battles, battle)
		if not (isCsKnockout and battle.stage <= msg.lsGoingStage) then
			loseCount = loseCount + 1
		end
	end

	table.sort(battles, sortMyGame)
	battleInfo.battleList = battles
	battleInfo.result = {
		isCsKnockout = isCsKnockout,
		isInWinnerGroup = (isCsKnockout and msg.csGoingGroup or msg.lsGoingGroup) == GroupId.Winner,
		loseCount = loseCount,
		winCount = (isCsKnockout and msg.totalCsKonckout or msg.totalLsKonckout) - loseCount,
		rankStage = isCsKnockout and msg.csGoingStage or msg.lsGoingStage
	}
	self:rebuildAllItem(container)
end

function CSBattleList:onReceiveListState(container, msg)
	if not msg.resultOK then
		MessageBoxPage:Msg_Box("@GetBattleListStateFailed")
		self:rebuildAllItem(container)
		return
	end

	local vsInfo = battleInfo.vsInfo
	for _, winner in ipairs(msg.winnerId) do
		local battle = common:deepCopy(vsInfo)
		if battle.hasChangePos then
		    battle.winner = winner == WinnerType.Left and vsInfo.rightPlayer.id or vsInfo.leftPlayer.id
		else
		    battle.winner = winner == WinnerType.Right and vsInfo.rightPlayer.id or vsInfo.leftPlayer.id
		end
		table.insert(battleInfo.battleList, battle)
	end
	self:rebuildAllItem(container)
end

function CSBattleList:onReceivePlaybackInfo(container, msg)
	if not msg.resultOK then
		MessageBoxPage:Msg_Box("@CSWarPlaybackNotGot")
	end
end

function CSBattleList:onReceiveMessage(container)
    local message = container:getMessage()
	local typeId = message:getTypeId()
	if typeId == MSG_MAINFRAME_REFRESH then
		local pageName = MsgMainFrameRefreshPage:getTrueType(message).pageName
		if pageName == thisPageName then
			self:getBattleList(container)
		end
	end
end

function CSBattleList:rebuildAllItem(container)
	self:clearAllItem(container);
	self:buildItem(container);
end

function CSBattleList:buildItem(container)
	local isMyGame = battleInfo.battleType == BattleList.Type_MyBattle
	local titleKey = isMyGame and "@CSMyBattle" or "@CSBattlePlayback"
	local lb2Str = {
		mPopUpTitle = common:getLanguageString(titleKey)
	}
	if isMyGame then
		local isCsKnockout = battleInfo.result.isCsKnockout
		local battleName = CSTools.getKnockoutBattleName(isCsKnockout)
		local winCount = battleInfo.result.winCount
		local loseCount = battleInfo.result.loseCount
		local rank = CSTools.stageToRank(battleInfo.result.rankStage, not isCsKnockout)
		--2强 还是 亚军
		if rank == 2 and CSTools.isBeforeTheFinal(battleInfo.battleId, isCsKnockout) then
			rank = 3
		end
		local rankStr = common:getLanguageString("@CSBattleRank_" .. rank)
		if rank ~= 0 then
			local groupStr = battleInfo.result.isInWinnerGroup and "@FourEmperor" or "@TheSupernova"
			rankStr = common:getLanguageString(groupStr) .. rankStr
		end
		lb2Str["mTheWarTimesTex"] = common:getLanguageString("@CSKnockoutCount", battleName, winCount, loseCount, rankStr)
	end

	common:setStringForLabel(container, lb2Str)

	self:switchScrollView(container)
	self:initScrollView(container)
end

function CSBattleList:switchScrollView(container)
	local isMyGame = battleInfo.battleType == BattleList.Type_MyBattle
	local svName = isMyGame and "mPopUpSV2" or "mPopUpSV"
	container:getVarNode("mPopUpTexNode"):setVisible(isMyGame)
	container:getVarNode("mPopUPSV2"):setVisible(isMyGame)
	container:getVarScrollView("mPopUpSV"):setVisible(not isMyGame)
	container.mScrollView = container:getVarScrollView(svName)
	container.mScrollViewRootNode = container.mScrollView:getContainer()
	container.m_pScrollViewFacade = CCReViScrollViewFacade:new(container.mScrollView)
	container.m_pScrollViewFacade:init(6,6)
end

function CSBattleList:initScrollView(container)
	local iMaxNode = container.m_pScrollViewFacade:getMaxDynamicControledItemViewsNum();
	local iCount = 0;
	local fOneItemHeight = 0;
	local fOneItemWidth = 0;

	local contentItem = CSBattleListItem
	for k = #battleInfo.battleList, 1, -1 do
		local pItemData = CCReViSvItemData:new()
		pItemData.mID = k
		pItemData.m_iIdx = k
		pItemData.m_ptPosition = ccp(0, fOneItemHeight * iCount)

		if iCount < iMaxNode then
			local pItem = ScriptContentBase:create(contentItem.ccbiFile)
			pItem.id = iCount
			pItem:registerFunctionHandler(contentItem.onFunction)
			if  fOneItemHeight < pItem:getContentSize().height then
				fOneItemHeight = pItem:getContentSize().height
			end
			if fOneItemWidth < pItem:getContentSize().width then
				fOneItemWidth = pItem:getContentSize().width
			end
			container.m_pScrollViewFacade:addItem(pItemData, pItem.__CCReViSvItemNodeFacade__)
		else
			container.m_pScrollViewFacade:addItem(pItemData)
		end
		iCount = iCount+1
	end
	local size = CCSizeMake(fOneItemWidth, fOneItemHeight * iCount)
	container.mScrollView:setContentSize(size);
	container.mScrollView:setContentOffset(ccp(0, container.mScrollView:getViewSize().height - container.mScrollView:getContentSize().height*container.mScrollView:getScaleY()));
	container.m_pScrollViewFacade:setDynamicItemsStartPosition(iCount-1);
	container.mScrollView:forceRecaculateChildren()
	ScriptMathToLua:setSwallowsTouches(container.mScrollView)
end

function CSBattleList:clearAllItem(container)
	if container.m_pScrollViewFacade then
		container.m_pScrollViewFacade:clearAllItems()
		container.mScrollViewRootNode:removeAllChildren()
	end
end

function CSBattleList:onClose(container)
	PageManager.popPage(thisPageName)
end

function CSBattleList:onExit(container)
	self:clearAllItem(container)
	if container.m_pScrollViewFacade then
		container.m_pScrollViewFacade:delete()
		container.m_pScrollViewFacade = nil
	end
	self:removePacket(container)
	container:removeMessage(MSG_MAINFRAME_REFRESH)
end

function CSBattleList:registerPacket(container)
	for key, opcode in pairs(opcodes) do
		if string.sub(key, -1) == "S" then
			container:registerPacket(opcode)
		end
	end
end

function CSBattleList:removePacket(container)
	for key, opcode in pairs(opcodes) do
		if string.sub(key, -1) == "S" then
			container:removePacket(opcode)
		end
	end
end

--------------------------------------------------------------------------------
local CSBattleListPage = CommonPage.newSub(CSBattleList, thisPageName, option)
