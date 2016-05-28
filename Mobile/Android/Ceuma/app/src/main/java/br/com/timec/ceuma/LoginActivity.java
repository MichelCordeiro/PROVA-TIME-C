package br.com.timec.ceuma;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.MultiAutoCompleteTextView;

import org.json.JSONException;
import org.json.JSONObject;

public class LoginActivity extends AppCompatActivity {

    private MultiAutoCompleteTextView tvEmail;
    private EditText edSenha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void submit(View view) {
        try {
            tvEmail = (MultiAutoCompleteTextView) findViewById(R.id.email);
            edSenha = (EditText) findViewById(R.id.password);

            final Util util = new Util();

            final String url = util.genereteUrl(tvEmail.getText().toString(), edSenha.getText().toString());
            final ProgressDialog progress = ProgressDialog.show(this, "Busca no Servidor Remoto", "Aguarde...");

            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                     final String json =  util.WebService(url);

                        if(json.equals("null")){
                            throw new Exception("Não foi possovel realizar o login");
                        }

                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                try {
                                    JSONObject obj = new JSONObject(json);
                                    Intent intent = new Intent(LoginActivity.this, MainActivity.class);
                                    intent.putExtra("id", obj.getInt("Id"));
                                    intent.putExtra("nome", obj.getString("Nome"));
                                    startActivity(intent);

                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }
                            }
                        });

                    } catch (Exception e){
                        e.printStackTrace();
                    }finally {
                        progress.dismiss();
                    }
                }
            }).start();

        } catch (Exception e) {
            Log.i("ERROR", e.getMessage());
        }


    }
}
