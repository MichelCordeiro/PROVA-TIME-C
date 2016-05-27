package br.com.timec.ceuma;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        WebServiceExecute ws = new WebServiceExecute("Agendamento");
        ws.setId(1);
        ws.setContext(this);
        ws.setTitulo("titulo");
        ws.setMensagem("msg");
        ws.execute();

    }
}
