package kr.co.iwill.performanceSeat;

import org.springframework.stereotype.Component;

@Component
public class PerformanceSeatDTO {	
	
		private int row;
		private int col;
		private int isReserved;
		private String per_code;
		
	
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

		public int getIsReserved() {
			return isReserved;
		}

		public void setIsReserved(int isReserved) {
			this.isReserved = isReserved;
		}
		
		public String getPer_code() {
			return per_code;
		}

		public void setPer_code(String per_code) {
			this.per_code = per_code;
		}

		@Override
		public String toString() {
			return "PerformanceSeatDTO [row=" + row + ", col=" + col + ", isReserved=" + isReserved + ", per_code="
					+ per_code + "]";
		}



	
}
