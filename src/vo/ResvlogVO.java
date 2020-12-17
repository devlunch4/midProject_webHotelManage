package vo;

public class ResvlogVO {
	private int resev_no;
	private String room_in;
	private String room_out;
	private String mem_id;
	private int  room_no;
	private String room_pl;
	private String room_type;
	private int room_num;
	private String resev_state;
	private String resev_date;
	private int sales; // 추가된거
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getResev_no() {
		return resev_no;
	}
	public void setResev_no(int resev_no) {
		this.resev_no = resev_no;
	}
	public String getRoom_in() {
		return room_in;
	}
	public void setRoom_in(String room_in) {
		this.room_in = room_in;
	}
	public String getRoom_out() {
		return room_out;
	}
	public void setRoom_out(String room_out) {
		this.room_out = room_out;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_pl() {
		return room_pl;
	}
	public void setRoom_pl(String room_pl) {
		this.room_pl = room_pl;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getResev_state() {
		return resev_state;
	}
	public void setResev_state(String resev_state) {
		this.resev_state = resev_state;
	}
	public String getResev_date() {
		return resev_date;
	}
	public void setResev_date(String resev_date) {
		this.resev_date = resev_date;
	}


}
