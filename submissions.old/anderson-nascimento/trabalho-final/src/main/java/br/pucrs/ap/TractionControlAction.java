package br.pucrs.ap;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import aima.core.agent.Action;


public enum TractionControlAction implements Action{
	A(0), B(1), C(2), D(3), None(-1);

	private static final Set<TractionControlAction> _actions = new LinkedHashSet<TractionControlAction>();
	public static double[][][] M = new double[3][3][4];
	static {
		_actions.add(A);
		_actions.add(B);
		_actions.add(C);
		_actions.add(D);
		_actions.add(None);
		initializeMatrixPropability();
	}
	private int value;
	TractionControlAction(int code){
		this.value = code;
	}
	
	public static final Set<TractionControlAction> actions() {
		return _actions;
	}

	public boolean isNoOp() {
		if (None == this) {
			return true;
		}
		return false;
	}
	public int getValue() {
		return value;
	}


	public Set<TractionControlAction> getPossibleActions(){
		Set<TractionControlAction> p = new HashSet<TractionControlAction>();
 		for (TractionControlAction a: _actions) {
 			if (!a.equals(None)) {
 				p.add(a);
 			}
		}
 		return p;
	}

	private static void initializeMatrixPropability(){
		//slipping -> slipping
		M[0][0][0] = 0.2f;
		M[0][0][1] = 0.2f;
		M[0][0][2] = 0.3f;
		M[0][0][3] = 0.3f;
		
		//slipping -> rolling
		M[0][1][0] = 0.7f;
		M[0][1][1] = 0.7f;
		M[0][1][2] = 0.6f;
		M[0][1][3] = 0.6f;

		//slipping -> sliding
		M[0][2][0] = 0.1f;
		M[0][2][1] = 0.1f;
		M[0][2][2] = 0.1f;
		M[0][2][3] = 0.1f;
		
		//rolling -> sliping
		M[1][0][0] = 0.1f;
		M[1][0][1] = 0.1f;
		M[1][0][2] = 0.3f;
		M[1][0][3] = 0.3f;

		//rolling -> roling
		M[1][1][0] = 0.7f;
		M[1][1][1] = 0.7f;
		M[1][1][2] = 0.6f;
		M[1][1][3] = 0.6f;
		
		//rolling -> sliding
		M[1][2][0] = 0.2f;
		M[1][2][1] = 0.2f;
		M[1][2][2] = 0.1f;
		M[1][2][3] = 0.1f;
		
		//sliding -> sliping
		M[2][0][0] = 0.1f;
		M[2][0][1] = 0.1f;
		M[2][0][2] = 0.1f;
		M[2][0][3] = 0.1f;

		//sliding -> rolling
		M[2][1][0] = 0.7f;
		M[2][1][1] = 0.7f;
		M[2][1][2] = 0.6f;
		M[2][1][3] = 0.6f;

		//sliding -> sliding
		M[2][2][0] = 0.3f;
		M[2][2][1] = 0.3f;
		M[2][2][2] = 0.2f;
		M[2][2][3] = 0.2f;
	}

}
