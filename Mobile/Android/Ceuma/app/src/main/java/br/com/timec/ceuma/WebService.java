package br.com.timec.ceuma;

import android.app.ProgressDialog;
import android.content.Context;
import android.text.Editable;

import java.util.List;

/**
 * Created by Felipe on 26/05/16.
 */
public class WebService {


    private Integer id;
    private String email;
    private String senha;
    private List<Agendamento> agendamentos;
    private List<Aluno> alunos;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public List<Agendamento> getAgendamentos() {
        return agendamentos;
    }

    public void setAgendamentos(List<Agendamento> agendamentos) {
        this.agendamentos = agendamentos;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }
}
