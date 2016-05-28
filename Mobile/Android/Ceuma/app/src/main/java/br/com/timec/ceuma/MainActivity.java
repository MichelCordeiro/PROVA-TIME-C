package br.com.timec.ceuma;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    TextView nomeLogin;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Intent intent = getIntent();
        final int id = intent.getIntExtra("id", 0);
        String wsNome = intent.getStringExtra("nome");

        nomeLogin = (TextView) findViewById(R.id.tvNomeLogin);
        nomeLogin.setText("Olá "+wsNome);
        //final int id = 1;

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Util util = new Util();
                    String url = util.genereteUrl(id);
                    final String json = util.WebService(url);

                    if (json.equals("null")) {
                        throw new Exception(getString(R.string.error));
                    }
                    ArrayList<Agendamento> arrayOfAgendamento = getAgendamentos(json);
                    final AgendamentosAdapter adapter = new AgendamentosAdapter(MainActivity.this, arrayOfAgendamento);

                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            ListView listView = (ListView) findViewById(R.id.listView);
                            listView.setAdapter(adapter);
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    private ArrayList<Agendamento> getAgendamentos(String json) {
        try {
            ArrayList<Agendamento> agendamentos = new ArrayList<Agendamento>();
            JSONArray agendmentosJson = new JSONArray(json);
            JSONObject agendmento;

            for (int i = 0; i < agendmentosJson.length(); i++) {
                agendmento = new JSONObject(agendmentosJson.getString(i));
                agendamentos.add(new Agendamento(agendmento.getString("Aluno"),
                        agendmento.getString("Data"),
                        agendmento.getString("Hora"),
                        agendmento.getString("Setor")));
            }

            return agendamentos;

        } catch (JSONException e) {
            Log.e("Erro", "Erro no parsing do JSON", e);
            return null;
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = new MenuInflater(MainActivity.this);
        menuInflater.inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuSair:
                logout();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private void logout(){
        Intent intent = new Intent(MainActivity.this,LoginActivity.class);
        startActivity(intent);
    }
}
