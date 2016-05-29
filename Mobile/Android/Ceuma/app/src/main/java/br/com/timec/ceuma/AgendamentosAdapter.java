package br.com.timec.ceuma;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by Felipe on 28/05/16.
 */
public class AgendamentosAdapter extends ArrayAdapter<Agendamento> {
    public AgendamentosAdapter(Context context, ArrayList<Agendamento> agendamentos) {
        super(context, 0, agendamentos);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        Agendamento agendamento = getItem(position);

        if (convertView == null)
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.activity_itens, parent, false);

        TextView tvSetor = (TextView) convertView.findViewById(R.id.setor);
        TextView tvData = (TextView) convertView.findViewById(R.id.data);
        TextView tvHora = (TextView) convertView.findViewById(R.id.hora);

        tvSetor.setText("Setor: "+ agendamento.setor);
        tvData.setText("Data: " + agendamento.data);
        tvHora.setText("Horário: "+ agendamento.hora);

        return convertView;
    }
}