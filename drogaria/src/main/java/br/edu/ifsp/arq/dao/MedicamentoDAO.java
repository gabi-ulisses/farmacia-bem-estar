package br.edu.ifsp.arq.dao;

import java.util.ArrayList;
import br.edu.ifsp.arq.model.Medicamento;

public class MedicamentoDAO {
	private static MedicamentoDAO instance;
	private ArrayList<Medicamento> listaDeMedicamentos;
	
	private MedicamentoDAO() {
		this.listaDeMedicamentos = new ArrayList<Medicamento>();
	}
	
	public static MedicamentoDAO getInstance() {
		if(instance==null) {
			instance = new MedicamentoDAO();
		}
		return instance;
	}
	
	public boolean adicionarMedicamento(Medicamento m) {
		return this.listaDeMedicamentos.add(m);
	}
	
	public ArrayList<Medicamento> getMedicamentos(){
		return this.listaDeMedicamentos;
	}	
	
	public Medicamento getMedicamentoPorId(int id) {
	    for (Medicamento m : listaDeMedicamentos) {
	        if (m.getId() == id) return m;
	    }
	    return null;
	}

	public boolean atualizarMedicamento(int id, Medicamento novo) {
	    for (int i = 0; i < listaDeMedicamentos.size(); i++) {
	        Medicamento atual = listaDeMedicamentos.get(i);
	        if (atual.getId() == id) {
	            novo.setId(id);
	            listaDeMedicamentos.set(i, novo);
	            return true;
	        }
	    }
	    return false;
	}
	
	public boolean removerMedicamentoPorId(int id) {
	    return this.listaDeMedicamentos.removeIf(m -> m.getId() == id);
	}
	
	public ArrayList<Medicamento> buscarPorNome(String nomeBuscado) {
	    ArrayList<Medicamento> resultados = new ArrayList<>();
	    for (Medicamento m : listaDeMedicamentos) {
	        if (m.getNome().toLowerCase().contains(nomeBuscado.toLowerCase())) {
	            resultados.add(m);
	        }
	    }
	    return resultados;
	}

}