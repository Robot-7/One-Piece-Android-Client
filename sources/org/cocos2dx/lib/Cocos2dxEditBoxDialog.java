package org.cocos2dx.lib;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.text.InputFilter;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxEditBoxDialog extends Dialog {
    private final int kEditBoxInputFlagInitialCapsAllCharacters;
    private final int kEditBoxInputFlagInitialCapsSentence;
    private final int kEditBoxInputFlagInitialCapsWord;
    private final int kEditBoxInputFlagPassword;
    private final int kEditBoxInputFlagSensitive;
    private final int kEditBoxInputModeAny;
    private final int kEditBoxInputModeDecimal;
    private final int kEditBoxInputModeEmailAddr;
    private final int kEditBoxInputModeNumeric;
    private final int kEditBoxInputModePhoneNumber;
    private final int kEditBoxInputModeSingleLine;
    private final int kEditBoxInputModeUrl;
    private final int kKeyboardReturnTypeDefault;
    private final int kKeyboardReturnTypeDone;
    private final int kKeyboardReturnTypeGo;
    private final int kKeyboardReturnTypeSearch;
    private final int kKeyboardReturnTypeSend;
    private Button mCancelBtn;
    private EditText mInputEditText;
    private final int mInputFlag;
    private int mInputFlagConstraints;
    private final int mInputMode;
    private int mInputModeContraints;
    private boolean mIsMultiline;
    private final int mMaxLength;
    private final String mMessage;
    private Button mOkBtn;
    private final int mReturnType;
    private TextView mTextViewTitle;
    private final String mTitle;

    public Cocos2dxEditBoxDialog(Context pContext, String pTitle, String pMessage, int pInputMode, int pInputFlag, int pReturnType, int pMaxLength) {
        super(pContext, R.style.Theme.Translucent.NoTitleBar.Fullscreen);
        this.kEditBoxInputModeAny = 0;
        this.kEditBoxInputModeEmailAddr = 1;
        this.kEditBoxInputModeNumeric = 2;
        this.kEditBoxInputModePhoneNumber = 3;
        this.kEditBoxInputModeUrl = 4;
        this.kEditBoxInputModeDecimal = 5;
        this.kEditBoxInputModeSingleLine = 6;
        this.kEditBoxInputFlagPassword = 0;
        this.kEditBoxInputFlagSensitive = 1;
        this.kEditBoxInputFlagInitialCapsWord = 2;
        this.kEditBoxInputFlagInitialCapsSentence = 3;
        this.kEditBoxInputFlagInitialCapsAllCharacters = 4;
        this.kKeyboardReturnTypeDefault = 0;
        this.kKeyboardReturnTypeDone = 1;
        this.kKeyboardReturnTypeSend = 2;
        this.kKeyboardReturnTypeSearch = 3;
        this.kKeyboardReturnTypeGo = 4;
        this.mTitle = pTitle;
        this.mMessage = pMessage;
        this.mInputMode = pInputMode;
        this.mInputFlag = pInputFlag;
        this.mReturnType = pReturnType;
        this.mMaxLength = pMaxLength;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle pSavedInstanceState) {
        super.onCreate(pSavedInstanceState);
        getWindow().setBackgroundDrawable(new ColorDrawable(Integer.MIN_VALUE));
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(1);
        ViewGroup.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -1);
        this.mTextViewTitle = new TextView(getContext());
        LinearLayout.LayoutParams textviewParams = new LinearLayout.LayoutParams(-2, -2);
        textviewParams.topMargin = 80;
        int iConvertDipsToPixels = convertDipsToPixels(10.0f);
        textviewParams.rightMargin = iConvertDipsToPixels;
        textviewParams.leftMargin = iConvertDipsToPixels;
        this.mTextViewTitle.setTextSize(1, 20.0f);
        linearLayout.addView(this.mTextViewTitle, textviewParams);
        this.mInputEditText = new EditText(getContext());
        LinearLayout.LayoutParams editTextParams = new LinearLayout.LayoutParams(-1, -2);
        int iConvertDipsToPixels2 = convertDipsToPixels(10.0f);
        editTextParams.rightMargin = iConvertDipsToPixels2;
        editTextParams.leftMargin = iConvertDipsToPixels2;
        linearLayout.addView(this.mInputEditText, editTextParams);
        LinearLayout layout1 = new LinearLayout(getContext());
        layout1.setOrientation(0);
        LinearLayout.LayoutParams ltParams = new LinearLayout.LayoutParams(-1, -2);
        linearLayout.addView(layout1, ltParams);
        LinearLayout.LayoutParams btnParams = new LinearLayout.LayoutParams(-2, -1);
        btnParams.leftMargin = convertDipsToPixels(10.0f);
        int iOne = (int) (((double) (getContext().getResources().getDisplayMetrics().widthPixels - (btnParams.leftMargin * 2))) * 0.1d);
        btnParams.rightMargin = iOne / 2;
        int iConvertDipsToPixels3 = convertDipsToPixels(10.0f);
        btnParams.bottomMargin = iConvertDipsToPixels3;
        btnParams.topMargin = iConvertDipsToPixels3;
        this.mOkBtn = new Button(getContext());
        this.mOkBtn.setText("确定");
        this.mOkBtn.setWidth((int) (((double) iOne) * 4.5d));
        layout1.addView(this.mOkBtn, btnParams);
        LinearLayout.LayoutParams btnParams1 = new LinearLayout.LayoutParams(-2, -1);
        btnParams1.leftMargin = iOne / 2;
        btnParams1.rightMargin = btnParams.leftMargin;
        int iConvertDipsToPixels4 = convertDipsToPixels(10.0f);
        btnParams1.bottomMargin = iConvertDipsToPixels4;
        btnParams1.topMargin = iConvertDipsToPixels4;
        this.mCancelBtn = new Button(getContext());
        this.mCancelBtn.setText("取消");
        this.mCancelBtn.setWidth((int) (((double) iOne) * 4.5d));
        layout1.addView(this.mCancelBtn, btnParams1);
        this.mOkBtn.setOnClickListener(new View.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxEditBoxDialog.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                String txt = Cocos2dxEditBoxDialog.this.mInputEditText.getText().toString();
                if (!txt.isEmpty()) {
                    Cocos2dxHelper.setEditTextDialogResult(txt);
                }
                Cocos2dxEditBoxDialog.this.closeKeyboard();
                Cocos2dxEditBoxDialog.this.dismiss();
            }
        });
        this.mCancelBtn.setOnClickListener(new View.OnClickListener() { // from class: org.cocos2dx.lib.Cocos2dxEditBoxDialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                String txt = Cocos2dxEditBoxDialog.this.mInputEditText.getText().toString();
                if (!txt.isEmpty()) {
                    Cocos2dxHelper.setEditTextDialogCancelResult(txt);
                }
                Cocos2dxEditBoxDialog.this.closeKeyboard();
                Cocos2dxEditBoxDialog.this.dismiss();
            }
        });
        setContentView(linearLayout, layoutParams);
        getWindow().addFlags(1024);
        this.mTextViewTitle.setText(this.mTitle);
        this.mInputEditText.setText(this.mMessage);
        this.mInputEditText.setImeOptions(268435456 | this.mInputEditText.getImeOptions());
        int oldImeOptions = this.mInputEditText.getImeOptions();
        switch (this.mInputMode) {
            case 0:
                this.mInputModeContraints = 131073;
                break;
            case 1:
                this.mInputModeContraints = 33;
                break;
            case 2:
                this.mInputModeContraints = 4098;
                break;
            case 3:
                this.mInputModeContraints = 3;
                break;
            case 4:
                this.mInputModeContraints = 17;
                break;
            case 5:
                this.mInputModeContraints = 12290;
                break;
            case 6:
                this.mInputModeContraints = 1;
                break;
        }
        if (this.mIsMultiline) {
            this.mInputModeContraints |= 131072;
        }
        this.mInputEditText.setInputType(this.mInputModeContraints | this.mInputFlagConstraints);
        switch (this.mInputFlag) {
            case 0:
                this.mInputFlagConstraints = Opcodes.LOR;
                break;
            case 1:
                this.mInputFlagConstraints = AccessibilityEventCompat.TYPE_GESTURE_DETECTION_END;
                break;
            case 2:
                this.mInputFlagConstraints = 8192;
                break;
            case 3:
                this.mInputFlagConstraints = 16384;
                break;
            case 4:
                this.mInputFlagConstraints = 4096;
                break;
        }
        this.mInputEditText.setInputType(this.mInputFlagConstraints | this.mInputModeContraints);
        switch (this.mReturnType) {
            case 0:
                this.mInputEditText.setImeOptions(oldImeOptions | 1);
                break;
            case 1:
                this.mInputEditText.setImeOptions(oldImeOptions | 6);
                break;
            case 2:
                this.mInputEditText.setImeOptions(oldImeOptions | 4);
                break;
            case 3:
                this.mInputEditText.setImeOptions(oldImeOptions | 3);
                break;
            case 4:
                this.mInputEditText.setImeOptions(oldImeOptions | 2);
                break;
            default:
                this.mInputEditText.setImeOptions(oldImeOptions | 1);
                break;
        }
        if (this.mMaxLength > 0) {
            this.mInputEditText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(this.mMaxLength)});
        }
        Handler initHandler = new Handler();
        initHandler.postDelayed(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxEditBoxDialog.3
            @Override // java.lang.Runnable
            public void run() {
                Cocos2dxEditBoxDialog.this.mInputEditText.requestFocus();
                Cocos2dxEditBoxDialog.this.mInputEditText.setSelection(Cocos2dxEditBoxDialog.this.mInputEditText.length());
                Cocos2dxEditBoxDialog.this.openKeyboard();
            }
        }, 200L);
        this.mInputEditText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: org.cocos2dx.lib.Cocos2dxEditBoxDialog.4
            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == 0 && (actionId != 0 || event == null || event.getAction() != 0)) {
                    return false;
                }
                Cocos2dxHelper.setEditTextDialogResult(Cocos2dxEditBoxDialog.this.mInputEditText.getText().toString());
                Cocos2dxEditBoxDialog.this.closeKeyboard();
                Cocos2dxEditBoxDialog.this.dismiss();
                return true;
            }
        });
    }

    private int convertDipsToPixels(float pDIPs) {
        float scale = getContext().getResources().getDisplayMetrics().density;
        return Math.round(pDIPs * scale);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openKeyboard() {
        InputMethodManager imm = (InputMethodManager) getContext().getSystemService("input_method");
        imm.showSoftInput(this.mInputEditText, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeKeyboard() {
        InputMethodManager imm = (InputMethodManager) getContext().getSystemService("input_method");
        imm.hideSoftInputFromWindow(this.mInputEditText.getWindowToken(), 0);
    }
}
