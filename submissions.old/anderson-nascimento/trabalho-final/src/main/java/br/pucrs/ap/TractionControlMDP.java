package br.pucrs.ap;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import aima.core.probability.mdp.ActionsFunction;
import aima.core.probability.mdp.RewardFunction;
import aima.core.probability.mdp.TransitionProbabilityFunction;
import aima.core.probability.mdp.impl.MDP;
import aima.core.probability.mdp.search.ValueIteration;

public class TractionControlMDP {
	private static MDP<TractionControlState<Double>, TractionControlAction> mdp;
	private static int times = 0;
	
	public static void main(String args[]){
		long x = System.currentTimeMillis();
		TractionControlWorld<Double> tw = new TractionControlWorld<Double>(3, 3, -0.04);
		createWorldStates(tw);
		
		mdp = new MDP<TractionControlState<Double>, TractionControlAction>(tw.getStates(), 
				tw.getStateAt(2, 2), createActionsFunction(), createTransitionProbabilityFunction(tw), createRewardFunction());
		
		ValueIteration<TractionControlState<Double>, TractionControlAction> vi = new ValueIteration<TractionControlState<Double>, TractionControlAction>(0.1);

		Map<TractionControlState<Double>, Double> U = vi.valueIteration(mdp, 0.00001);

		System.out.println("(1,1) = " + U.get(tw.getStateAt(0, 0)));
		System.out.println("(1,2) = " + U.get(tw.getStateAt(0, 1)));
		System.out.println("(1,3) = " + U.get(tw.getStateAt(0, 2)));

		System.out.println("(2,1) = " + U.get(tw.getStateAt(1, 0)));
		System.out.println("(2,2) = " + U.get(tw.getStateAt(1, 1)));
		System.out.println("(2,3) = " + U.get(tw.getStateAt(1, 2)));

		System.out.println("(3,1) = " + U.get(tw.getStateAt(2, 0)));
		System.out.println("(3,2) = " + U.get(tw.getStateAt(2, 1)));
		System.out.println("(3,3) = " + U.get(tw.getStateAt(2, 2)));

		System.out.println("Times: "+times + " Time:" + (System.currentTimeMillis() - x));
	}
	
	public static void  createWorldStates(TractionControlWorld<Double> tw){
		tw.getStateAt(0, 2).setContent(-2.0);
		tw.getStateAt(1, 0).setContent(-2.0);
		tw.getStateAt(1, 2).setContent(-2.0);
		tw.getStateAt(2, 0).setContent(-2.0);
		tw.getStateAt(2, 1).setContent(-2.0);
				
		tw.getStateAt(0, 1).setContent(2.0);
		tw.getStateAt(2, 1).setContent(2.0);
		
		tw.getStateAt(2, 2).setContent(-5.0);
		tw.getStateAt(1, 1).setContent(5.0);
		tw.getStateAt(0, 0).setContent(-5.0);
	}
	
	public static ActionsFunction<TractionControlState<Double>, TractionControlAction> createActionsFunction() {
		ActionsFunction<TractionControlState<Double>, TractionControlAction> af = new ActionsFunction<TractionControlState<Double>, TractionControlAction>() {
			public Set<TractionControlAction> actions(TractionControlState<Double> s) {
				return TractionControlAction.actions();
			}
		};
		return af;
	}
	
	public static TransitionProbabilityFunction<TractionControlState<Double>, TractionControlAction> createTransitionProbabilityFunction(final TractionControlWorld<Double> w) {
		TransitionProbabilityFunction<TractionControlState<Double>, TractionControlAction> tf = new TransitionProbabilityFunction<TractionControlState<Double>, TractionControlAction>() {
			
			public double probability(TractionControlState<Double> sDelta, TractionControlState<Double> s, TractionControlAction a) {
				double prob = 0;
				times++;
				if (a.getValue() >= 0){
					
					List<TractionControlState<Double>> outcomes = possibleOutcomes(s, a);
					for (int i = 0; i < outcomes.size(); i++) {
						if (sDelta.equals(outcomes.get(i))) {
							prob += TractionControlAction.M[sDelta.getX()][sDelta.getY()][a.getValue()];
						}
					}
				}
				else{
					//System.out.println(sDelta + " | " + s + " = " + a);
				}
				return prob;
			}

			private List<TractionControlState<Double>> possibleOutcomes(TractionControlState<Double> c, TractionControlAction a) {
				List<TractionControlState<Double>> outcomes = new ArrayList<TractionControlState<Double>>();

				outcomes.add(w.getStateAt(c.getY(), 0));
				outcomes.add(w.getStateAt(c.getY(), 1));
				outcomes.add(w.getStateAt(c.getY(), 2));
				
				return outcomes;
			}
			
		};

		return tf;
	}


	public static RewardFunction<TractionControlState<Double>> createRewardFunction() {
		RewardFunction<TractionControlState<Double>> rf = new RewardFunction<TractionControlState<Double>>() {
			public double reward(TractionControlState<Double> s) {
				return s.getContent();
			}
		};
		return rf;
	}

}
