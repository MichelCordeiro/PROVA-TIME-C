package br.com.timec.ceuma;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Intent intent = getIntent();
        final int id = intent.getIntExtra("id", 0);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Util util = new Util();
                    String url = util.genereteUrl(id);
                    final String json =  util.WebService(url);

                    if(json.equals("null")){
                        throw new Exception(getString(R.string.error));
                    }

                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {

                        }
                    });
                } catch (Exception e){
                    e.printStackTrace();
                }
            }
        }).start();
    }

    /*private void getAgendamento(String json) {

        List<Agendamento> agendamentos = new ArrayList<Agendamento>();

        try {
            JSONArray agendmentosJson = new JSONArray(json);
            JSONObject agendmento;

            for (int i = 0; i < agendmentosJson.length(); i++) {
                agendmento = new JSONObject(agendmentosJson.getString(i));

                Agendamento objAgendamento = new Agendamento();

                objAgendamento.setAluno(agendmento.getString("Aluno"));
                objAgendamento.setData(agendmento.getString("Data"));
                objAgendamento.setHora(agendmento.getString("Hora"));
                objAgendamento.setSetor(agendmento.getString("Setor"));

                agendamentos.add(objAgendamento);
            }

            this.setAgendamentos(agendamentos);

        } catch (JSONException e) {
            Log.e("Erro", "Erro no parsing do JSON", e);
        }
        return;
    }*/
}
