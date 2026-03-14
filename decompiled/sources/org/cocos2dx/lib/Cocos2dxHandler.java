package org.cocos2dx.lib;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Handler;
import android.os.Message;
import android.view.WindowManager;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxHandler extends Handler {
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformAccountManage = 9;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformBBS = 13;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformFeedback = 11;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformInit = 6;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformLogin = 7;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformLogout = 8;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformPayRecharge = 10;
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallPlatformThirdShare = 12;
    public static final int HANDLER_MSG_TO_MAINTHREAD_ChangeToCocos2dx = 5;
    public static final int HANDLER_MSG_TO_MAINTHREAD_OnActivityPause = 15;
    public static final int HANDLER_MSG_TO_MAINTHREAD_OnActivityResume = 16;
    public static final int HANDLER_MSG_TO_MAINTHREAD_OnLowMemory = 18;
    public static final int HANDLER_MSG_TO_MAINTHREAD_ShowCocos2dx = 0;
    public static final int HANDLER_MSG_TO_MAINTHREAD_ShowToastMsg = 17;
    public static final int HANDLER_MSG_TO_MAINTHREAD_ShowWaitingView = 14;
    public static final int HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResProgress = 4;
    public static final int HANDLER_SHOW_DIALOG = 1;
    public static final int HANDLER_SHOW_EDITBOX_DIALOG = 2;
    public static final int HANDLER_SHOW_QUESTION_DIALOG = 3;
    public static final int bsDialogMsgId_Cocos2dxActivity_ExternalStorageNotOK = 3;
    public static final int bsDialogMsgId_Cocos2dxActivity_NetworkNotOK = 2;
    public static final int bsDialogMsgId_Cocos2dxActivity_OnLowMemory = 4;
    public static final int bsDialogNegativeButtonId = 2;
    public static final int bsDialogPositiveButtonId = 1;
    public static final int bsQuestionDialogMsgId_Cocos2dxActivity_BackKeyPressed = 1;
    private WeakReference<Cocos2dxActivity> mActivity;

    public Cocos2dxHandler(Cocos2dxActivity activity) {
        this.mActivity = new WeakReference<>(activity);
    }

    @Override // android.os.Handler
    public void handleMessage(Message msg) {
        switch (msg.what) {
            case 1:
                showDialog(msg);
                break;
            case 2:
                showEditBoxDialog(msg);
                break;
            case 3:
                showQuestionDialog(msg);
                break;
            case 17:
                this.mActivity.get().showToastMsgImp((String) msg.obj);
                break;
            case 18:
                this.mActivity.get().onLowMemoryImp();
                break;
        }
    }

    private void showDialog(Message msg) {
        Cocos2dxActivity theActivity = this.mActivity.get();
        DialogMessage dialogMessage = (DialogMessage) msg.obj;
        final int tag = dialogMessage.msgId;
        AlertDialog dlg = new AlertDialog.Builder(theActivity).setTitle(dialogMessage.titile).setMessage(dialogMessage.message).setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (tag >= 0) {
                    Cocos2dxHelper.nativeDialogOkCallback(tag);
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.2
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                if (tag == 110 || tag == 100) {
                    ((Cocos2dxActivity) Cocos2dxHandler.this.mActivity.get()).showToastMsgImp("您取消了更新确认");
                    ((Cocos2dxActivity) Cocos2dxHandler.this.mActivity.get()).showWaitingView(true, -1, "游戏需要更新，您取消了更新确认，请重启！");
                }
            }
        }).create();
        dlg.setCanceledOnTouchOutside(false);
        WindowManager.LayoutParams lp = dlg.getWindow().getAttributes();
        dlg.getWindow().setAttributes(lp);
        dlg.show();
    }

    private void showQuestionDialog(Message msg) {
        final Cocos2dxActivity theActivity = this.mActivity.get();
        final DialogMessage dialogMessage = (DialogMessage) msg.obj;
        AlertDialog dlg = new AlertDialog.Builder(theActivity).setTitle(dialogMessage.titile).setMessage(dialogMessage.message).setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (dialogMessage.msgId == 1) {
                    theActivity.destroy();
                }
            }
        }).setNegativeButton("取消", new DialogInterface.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: org.cocos2dx.lib.Cocos2dxHandler.5
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
            }
        }).create();
        dlg.setCanceledOnTouchOutside(false);
        WindowManager.LayoutParams lp = dlg.getWindow().getAttributes();
        dlg.getWindow().setAttributes(lp);
        dlg.show();
    }

    private void showEditBoxDialog(Message msg) {
        EditBoxMessage editBoxMessage = (EditBoxMessage) msg.obj;
        new Cocos2dxEditBoxDialog(this.mActivity.get(), editBoxMessage.title, editBoxMessage.content, editBoxMessage.inputMode, editBoxMessage.inputFlag, editBoxMessage.returnType, editBoxMessage.maxLength).show();
    }

    public static class DialogMessage {
        public String message;
        public int msgId;
        public String negativeCallback;
        public String positiveCallback;
        public String titile;

        public DialogMessage(String title, String message, int msgId, String positiveCallback, String negativeCallback) {
            this.titile = title;
            this.message = message;
            this.msgId = msgId;
            this.positiveCallback = positiveCallback;
            this.negativeCallback = negativeCallback;
        }
    }

    public static class EditBoxMessage {
        public String content;
        public int inputFlag;
        public int inputMode;
        public int maxLength;
        public int returnType;
        public String title;

        public EditBoxMessage(String title, String content, int inputMode, int inputFlag, int returnType, int maxLength) {
            this.content = content;
            this.title = title;
            this.inputMode = inputMode;
            this.inputFlag = inputFlag;
            this.returnType = returnType;
            this.maxLength = maxLength;
        }
    }

    public static class ProgressMessage {
        public int progress;
        public String text;

        public ProgressMessage(int progress, String text) {
            this.progress = progress;
            this.text = text;
        }
    }

    public static class ShareMessage {
        public String content;
        public String imgPath;

        public ShareMessage(String content, String imgPath) {
            this.content = content;
            this.imgPath = imgPath;
        }
    }

    public static class PayRechargeMessage {
        public int count;
        public String description;
        public float orignalPrice;
        public float price;
        public String productId;
        public String productName;
        public String serial;

        public PayRechargeMessage(String serial, String productId, String productName, float price, float orignalPrice, int count, String description) {
            this.serial = serial;
            this.productId = productId;
            this.productName = productName;
            this.price = price;
            this.orignalPrice = orignalPrice;
            this.count = count;
            this.description = description;
        }
    }

    public static class ShowWaitingViewMessage {
        public int progress;
        public boolean show;
        public String text;

        public ShowWaitingViewMessage(boolean show, int progress, String text) {
            this.show = show;
            this.progress = progress;
            this.text = text;
        }
    }
}
