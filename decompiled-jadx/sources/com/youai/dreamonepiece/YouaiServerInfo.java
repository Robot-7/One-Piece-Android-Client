package com.youai.dreamonepiece;

import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class YouaiServerInfo {
    private String puid = StatConstants.MTA_COOPERATION_TAG;
    private int serverId = 0;
    private String playerName = StatConstants.MTA_COOPERATION_TAG;
    private String gameId = StatConstants.MTA_COOPERATION_TAG;
    private String platform = StatConstants.MTA_COOPERATION_TAG;
    private int playerId = 0;
    private int gameCoin1 = 0;
    private long gameCoin2 = 0;
    private int vipLv1 = 0;
    private int playerLv1 = 0;
    private Long lastLoginTime = 0L;

    public String getPuid() {
        return this.puid;
    }

    public void setPuid(String puid) {
        this.puid = puid;
    }

    public String getPlayerName() {
        return this.playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public Long getLastLoginTime() {
        return this.lastLoginTime;
    }

    public void setLastLoginTime(Long lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getServerId() {
        return this.serverId;
    }

    public void setServerId(int serverId) {
        this.serverId = serverId;
    }

    public String getGameId() {
        return this.gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public int getGameCoin1() {
        return this.gameCoin1;
    }

    public void setGameCoin1(int gameCoin1) {
        this.gameCoin1 = gameCoin1;
    }

    public long getGameCoin2() {
        return this.gameCoin2;
    }

    public void setGameCoin2(long gameCoin2) {
        this.gameCoin2 = gameCoin2;
    }

    public int getVipLv1() {
        return this.vipLv1;
    }

    public void setVipLv1(int vipLv1) {
        this.vipLv1 = vipLv1;
    }

    public int getPlayerLv1() {
        return this.playerLv1;
    }

    public void setPlayerLv1(int playerLv1) {
        this.playerLv1 = playerLv1;
    }

    public String getPlatform() {
        return this.platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String toString() {
        return this.gameId;
    }

    public int getPlayerId() {
        return this.playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
