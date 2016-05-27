package br.com.timec.ceuma;

import java.io.Serializable;

/**
 * Created by Felipe on 27/05/16.
 */
public class Aluno implements Serializable{

    private static final long serialVersionUID = 1L;
    private String id;
    private String nome;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Aluno{" +
                "nome='" + nome + '\'' +
                '}';
    }
}
