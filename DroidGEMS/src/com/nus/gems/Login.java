package com.nus.gems;

import java.io.*;

import org.apache.http.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import org.json.JSONObject;

import android.os.Bundle;
import android.os.StrictMode;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.*;

public class Login extends Activity {

	
	//http://fszlin.dymetis.com/post/2010/05/10/Comsuming-WCF-Services-With-Android.aspx
	
	//http://developer.android.com/training/basics/firstapp/starting-activity.html
	
	//http://developer.android.com/guide/topics/ui/declaring-layout.html
	
	private EditText txtLogin;
    private EditText txtPwd;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
       
        txtLogin = (EditText)findViewById(R.id.txtUserID);
        txtPwd = (EditText)findViewById(R.id.txtPwd);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_login, menu);
        return true;
    }
    
    /** Called when the user clicks the Send button */
    public void sendMessage(View view) {
        // Do something in response to button
    	HelloWorldFromWeb();
    }
    
    private void HelloWorldFromWeb() {
        try {
     
        	ServiceController svc = new ServiceController();
     
            TextView x = (TextView)findViewById(R.id.textView3);
            svc.execute("");
            x.setText(svc.get());
             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
