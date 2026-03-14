package com.youai.sdks.beans;

/* JADX INFO: loaded from: classes.dex */
public class GameInfo {
    public int app_id;
    public String app_id_str;
    public String app_key;
    public String app_secret;
    public int cp_id;
    public int debug_mode;
    public int gameid;
    public String pay_addr;
    public String pay_id_str;
    public int platform_type;
    public String platform_type_str;
    public String private_str;
    public String public_str;
    public int screen_orientation;
    public int svr_id;
    public int use_platform_sdk_type;

    public String toString() {
        return "gameInfo = [ platform_type: " + this.platform_type + "  platform_type_str: " + this.platform_type_str + " use_platform_sdk_type: " + this.use_platform_sdk_type + " app_id: " + this.app_id + " app_id_str: " + this.app_id_str + " gameid: " + this.gameid + " app_key: " + this.app_key + " app_secret: " + this.app_secret + " cp_id: " + this.cp_id + " svr_id: " + this.svr_id + " pay_addr: " + this.pay_addr + " pay_id_str: " + this.pay_id_str + " private_str: " + this.private_str + " public_str: " + this.public_str + " screen_orientation: " + this.screen_orientation + " debug_mode: " + this.debug_mode + " ]";
    }
}
