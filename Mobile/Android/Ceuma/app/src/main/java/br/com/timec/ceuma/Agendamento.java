package br.com.timec.ceuma;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Felipe on 26/05/16.
 */
public class Agendamento implements Serializable {

    private static final long serialVersionUID = 1L;

    private String aluno;
    private String data;
    private String hora;
    private String setor;

    public String getAluno() {
        return aluno;
    }

    public void setAluno(String aluno) {
        this.aluno = aluno;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

    @Override
    public String toString() {
        return "Agendamento{" +
                "aluno='" + aluno + '\'' +
                ", data='" + data + '\'' +
                ", hora='" + hora + '\'' +
                ", setor='" + setor + '\'' +
                '}';
    }
}
