package valeria;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Valéria
 */
public class Horario {

    public Date date;
    public Time time;
    public String aluno;
    public String setor;
    public String id;
    
    // método para formatar a data
    public String getDataFormatada() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(date);
    }
}
