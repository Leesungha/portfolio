package com.myebook.homepage.book.db;

public class BooklikeDTO {
	
	/*create table booklikey(
	booklikeid int auto_increment primary key,
	id int(11) null,
	bkid int(11) null,
	constraint fk_blk1 foreign key(id) references member(id),
	constraint fk_blk2 foreign key(bkid) references book(bkid));*/
	
	private int booklikeid;
	private int id;
	private int bkid;
	
	public int getBooklikeid() {
		return booklikeid;
	}
	public void setBooklikeid(int booklikeid) {
		this.booklikeid = booklikeid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBkid() {
		return bkid;
	}
	public void setBkid(int bkid) {
		this.bkid = bkid;
	}
	

}
