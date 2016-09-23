package br.pucrs.ap;

import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;


public class TractionControlWorld<C> {
	private Set<TractionControlState<C>> states = new LinkedHashSet<TractionControlState<C>>();
	private Map<Integer, Map<Integer, TractionControlState<C>>> stateLookup = new HashMap<Integer, Map<Integer, TractionControlState<C>>>();
	

	/**
	 * Construct a Cell World with size xDimension * y Dimension cells, all with
	 * their values set to a default content value.
	 * 
	 * @param xDimension
	 *            the size of the x dimension.
	 * @param yDimension
	 *            the size of the y dimension.
	 * 
	 * @param defaultCellContent
	 *            the default content to assign to each cell created.
	 */
	public TractionControlWorld(int xDimension, int yDimension, C defaultCellContent) {
		for (int x = 0; x < xDimension; x++) {
			Map<Integer, TractionControlState<C>> xCol = new HashMap<Integer, TractionControlState<C>>();
			for (int y = 0; y < yDimension; y++) {
				TractionControlState<C> s = new TractionControlState<C>(x, y, defaultCellContent);
				states.add(s);
				xCol.put(y, s);
			}
			stateLookup.put(x, xCol);
		}
	}

	/**
	 * 
	 * @return all the cells in this world.
	 */
	public Set<TractionControlState<C>> getStates() {
		return states;
	}

	/**
	 * Determine what cell would be moved into if the specified action is
	 * performed in the specified cell. Normally, this will be the cell adjacent
	 * in the appropriate direction. However, if there is no cell in the
	 * adjacent direction of the action then the outcome of the action is to
	 * stay in the same cell as the action was performed in.
	 * 
	 * @param s
	 *            the cell location from which the action is to be performed.
	 * @param a
	 *            the action to perform (Up, Down, Left, or Right).
	 * @return the Cell an agent would end up in if they performed the specified
	 *         action from the specified cell location.
	 */
	public TractionControlState<C> result(TractionControlState<C> s, TractionControlAction a) {
		int newY = -1;
		int newX = s.getY();
		double maxP = 0.0;
		
			for(int y=0; y<3;y++){
				if (TractionControlAction.M[newX][y][a.getValue()] > maxP){
					newY = y;
					maxP = TractionControlAction.M[newX][y][a.getValue()];
				}
			}

		TractionControlState<C> sDelta = getStateAt(newX, newY);
		if (null == sDelta) {
			// Default to no effect
			// (i.e. bumps back in place as no adjoining cell).
			sDelta = s;
		}

		return sDelta;
	}

	/**
	 * Remove the cell at the specified location from this Cell World. This
	 * allows you to introduce barriers into different location.
	 * 
	 * @param x
	 *            the x dimension of the cell to be removed.
	 * @param y
	 *            the y dimension of the cell to be removed.
	 */
	public void removeState(int x, int y) {
		Map<Integer, TractionControlState<C>> xCol = stateLookup.get(x);
		if (null != xCol) {
			states.remove(xCol.remove(y));
		}
	}

	/**
	 * Get the cell at the specified x and y locations.
	 * 
	 * @param x
	 *            the x dimension of the cell to be retrieved.
	 * @param y
	 *            the y dimension of the cell to be retrieved.
	 * @return the cell at the specified x,y location, null if no cell exists at
	 *         this location.
	 */
	public TractionControlState<C> getStateAt(int x, int y) {
		TractionControlState<C> s = null;
		Map<Integer, TractionControlState<C>> xCol = stateLookup.get(x);
		if (null != xCol) {
			s = xCol.get(y);
		}

		return s;
	}

}