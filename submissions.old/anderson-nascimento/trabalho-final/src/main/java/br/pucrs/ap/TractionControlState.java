package br.pucrs.ap;

public class TractionControlState<C> {
	private int x = 1;
	private int y = 1;
	private C content = null;

	public TractionControlState(int x, int y, C content) {
		this.x = x;
		this.y = y;
		this.content = content;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public C getContent() {
		return content;
	}

	public void setContent(C content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "<x=" + x + ", y=" + y + ", content=" + content + ">";
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof TractionControlState<?>) {
			TractionControlState<?> c = (TractionControlState<?>) o;
			return x == c.getX() && y == c.getY() && content.equals(c.getContent());
		}
		return false;
	}

	@Override
	public int hashCode() {
		return x + 23 + y + 31 * content.hashCode();
	}

}
