package br.com.timec.ceuma;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Felipe on 26/05/16.
 */
public class Agendamento implements Serializable {

    private static final long serialVersionUID = 1L;

    public String aluno;
    public String data;
    public String hora;
    public String setor;

    public Agendamento(String aluno, String data, String hora, String setor) {
        this.aluno = aluno;
        this.data = data;
        this.hora = hora;
        this.setor = setor;
    }
}
