package br.com.timec.ceuma;

import android.app.ProgressDialog;
import android.util.Log;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by Felipe on 26/05/16.
 */
public class WebServiceExecute extends WebService {

    private String tipo;

    public WebServiceExecute(String ws) {
        tipo = ws;
    }

    private String genereteUrl() {
        String url = "http://192.168.1.104/";

        if (tipo.equals("login")) {
            url += "ws-login.php?email=" + this.getEmail();
            url += "&senha=" + this.getSenha();
        } else {
            url += "ws-agendamento.php?id=" + this.getId();
        }

        return url;
    }

    private void getAgendamento(String json) {

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
    }

    private void getLogin(String json) {

        try {
                JSONObject obj = new JSONObject(json);
                this.setId(obj.getInt("Id"));

        } catch (JSONException e) {
            Log.e("Erro", "Erro no parsing do JSON", e);
        }

        return;
    }

    private String getStringFromInputStream(InputStream instream) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();

        String line;
        try {

            br = new BufferedReader(new InputStreamReader(instream));
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sb.toString();

    }

    public void execute() {

        final String url = genereteUrl();
        final ProgressDialog progress = ProgressDialog.show(this.getContext(), this.getTitulo(), this.getMensagem());

        new Thread(new Runnable() {
            @Override
            public void run() {

                try {
                    HttpClient httpclient = new DefaultHttpClient();
                    HttpGet request = new HttpGet();
                    request.setURI(new URI(url));

                    HttpResponse response = httpclient.execute(request);

                    HttpEntity entity = response.getEntity();

                    InputStream instream = entity.getContent();
                    String json = getStringFromInputStream(instream);
                    instream.close();

                    if (json.equals("null")) {
                        throw new Exception(String.valueOf(R.string.ErroWebService));
                    } else if (tipo.equals("login")) {
                        getLogin(json);
                    } else {
                        getAgendamento(json);
                    }
                } catch (Exception e) {
                    Log.i("Erro", "Falha ao acessar Web service", e);
                } finally {
                    progress.dismiss();
                }
            }
        }).start();
    }
}
