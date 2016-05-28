package br.com.timec.ceuma;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.MultiAutoCompleteTextView;

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

            WebServiceExecute ws = new WebServiceExecute("login");

            ws.setEmail(tvEmail.getText().toString());
            ws.setSenha(edSenha.getText().toString());

            ws.setTitulo("Busca no Servidor Remoto");
            ws.setMensagem("Aguarde...");
            ws.setContext(this);
            ws.execute();

            if (ws.getId() == null) {
                Intent intent = new Intent(this, MainActivity.class);
                intent.putExtra("id", ws.getId());
                startActivity(intent);
            } else {
                edSenha.setText("");
                Log.i("ERRO-LOGIN", "Exibir uma mensagem de erro");
            }
        } catch (Exception e) {
            Log.i("ERROR", e.getMessage());
        }


    }
}
