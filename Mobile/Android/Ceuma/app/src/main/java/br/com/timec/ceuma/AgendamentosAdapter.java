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
        // Get the data item for this position
        Agendamento agendamento = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.activity_itens, parent, false);
        }
        // Lookup view for data population
        TextView tvSetor = (TextView) convertView.findViewById(R.id.setor);
        TextView tvData = (TextView) convertView.findViewById(R.id.data);
        TextView tvHora = (TextView) convertView.findViewById(R.id.hora);

        // Populate the data into the template view using the data object
        tvSetor.setText(agendamento.setor);
        tvData.setText(agendamento.data);
        tvHora.setText(agendamento.hora);
        // Return the completed view to render on screen
        return convertView;
    }
}