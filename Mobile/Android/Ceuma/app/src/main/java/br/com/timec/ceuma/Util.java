package br.com.timec.ceuma;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;


/**
 * Created by Felipe on 26/05/16.
 */
public class Util {

    private String tipo;
    String url = "http://192.168.1.102/";

    public String genereteUrl(Integer id) {
        url += "ws-agendamento.php?id=" + id;
        return url;
    }

    public String genereteUrl(String email, String senha) {
        url += "ws-login.php?email=" + email;
        url += "&senha=" + senha;
        return url;
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

    public String WebService(String url) {

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
                throw new Exception();
            }

            return json;
        } catch (Exception e) {
            return null;
        }
    }
}