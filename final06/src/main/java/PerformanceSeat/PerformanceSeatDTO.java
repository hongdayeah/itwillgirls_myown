package PerformanceSeat;

public class PerformanceSeatDTO {	
	
		private int row;
		private int col;
		private boolean isReserved;
		
		public PerformanceSeatDTO() {}

		public int getRow() {
			return row;
		}

		public void setRow(int row) {
			this.row = row;
		}

		public int getCol() {
			return col;
		}

		public void setCol(int col) {
			this.col = col;
		}

		public boolean isReserved() {
			return isReserved;
		}

		public void setReserved(boolean isReserved) {
			this.isReserved = isReserved;
		}

		@Override
		public String toString() {
			return "PerformanceSeatDTO [row=" + row + ", col=" + col + ", isReserved=" + isReserved + "]";
		}						
		
	
}
