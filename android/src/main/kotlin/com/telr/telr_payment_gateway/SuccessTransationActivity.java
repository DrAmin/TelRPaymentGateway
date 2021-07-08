package com.telr.telr_payment_gateway;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.telr.mobile.sdk.activity.WebviewActivity;
import com.telr.mobile.sdk.entity.response.status.StatusResponse;

public class SuccessTransationActivity extends AppCompatActivity {

    private TextView mTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_successtransaction);
    }

    @Override
    protected void onStart() {
        super.onStart();
        Log.e("SuccessTransationActivity = ","Is Called");
        Intent intent = getIntent();
        StatusResponse status = (StatusResponse) intent.getParcelableExtra(WebviewActivity.PAYMENT_RESPONSE);

        TextView textView = (TextView)findViewById(R.id.text_payment_result);
        TextView txt_code=(TextView)findViewById(R.id.txt_code);
        txt_code.setText("Code : "+intent.getStringExtra("Code"));
        textView.setText(textView.getText() +" : " + status.getTrace());
      //  Log.e("CODEZZZ",":"+ TelrSharedPreference.getInstance(this).getDataFromPreference("Code"));

        if(status.getAuth()!= null) {
            status.getAuth().getStatus();   // Authorisation status. A indicates an authorised transaction. H also indicates an authorised transaction, but where the transaction has been placed on hold. Any other value indicates that the request could not be processed.
            status.getAuth().getAvs();      /* Result of the AVS check:
                                            Y = AVS matched OK
                                            P = Partial match (for example, post-code only)
                                            N = AVS not matched
                                            X = AVS not checked
                                            E = Error, unable to check AVS */
            status.getAuth().getCode();     // If the transaction was authorised, this contains the authorisation code from the card issuer. Otherwise it contains a code indicating why the transaction could not be processed.
            status.getAuth().getMessage();  // The authorisation or processing error message.
            status.getAuth().getCa_valid();
            status.getAuth().getCardcode(); // Code to indicate the card type used in the transaction. See the code list at the end of the document for a list of card codes.
            status.getAuth().getCardlast4();// The last 4 digits of the card number used in the transaction. This is supplied for all payment types (including the Hosted Payment Page method) except for PayPal.
            status.getAuth().getCvv();      /* Result of the CVV check:
                                           Y = CVV matched OK
                                           N = CVV not matched
                                           X = CVV not checked
                                           E = Error, unable to check CVV */
            status.getAuth().getTranref(); //The payment gateway transaction reference allocated to this request.
            status.getAuth().getCard().getFirst6(); // The first 6 digits of the card number used in the transaction, only for version 2 is submitted in Tran -> Version
            status.getAuth().getCard().getCountry();

            status.getAuth().getCard().getExpiry().getMonth();
            status.getAuth().getCard().getExpiry().getYear();
        }
    }

    public void closeWindow(View view){
        this.finish();
    }
}
