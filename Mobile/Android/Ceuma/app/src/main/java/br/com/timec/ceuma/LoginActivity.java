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
        tvEmail = (MultiAutoCompleteTextView) findViewById(R.id.email);
        edSenha = (EditText) findViewById(R.id.password);

        WebServiceExecute ws = new WebServiceExecute("login");
        ws.setEmail(tvEmail.getText().toString());
        ws.setSenha(edSenha.getText().toString());

        ws.execute();

        if(!ws.getAlunos().isEmpty()){
           Aluno aluno = ws.getAlunos().get(0);
            Intent intent = new Intent(LoginActivity.this, MainActivity.class);
            intent.putExtra("Aluno", aluno);
            startActivity(intent);

        } else{
            edSenha.setText("");
            Log.i("Erro no Login", "exibir uma mensagem de erro");
        }

    }
}
