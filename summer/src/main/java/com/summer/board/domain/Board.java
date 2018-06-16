package com.summer.board.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import com.summer.comm.DTO;

public class Board extends DTO {
	private int	   num;
	private String category;
	private String title;
	private String id;
	private String content;
	private String dateReg;
	private int	   clickCnt;
	private int    likeCnt;

	public Board() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDateReg() {
		return dateReg;
	}

	public void setDateReg(String dateReg) {
		this.dateReg = dateReg;
	}

	public int getClickCnt() {
		return clickCnt;
	}

	public void setClickCnt(int clickCnt) {
		this.clickCnt = clickCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", category=" + category + ", title=" + title + ", id=" + id + ", content="
				+ content + ", dateReg=" + dateReg + ", clickCnt=" + clickCnt + ", likeCnt=" + likeCnt + "]";
	}

	public Board(int num, String category, String title, String id, String content, String dateReg, int clickCnt,
			int likeCnt) {
		super();
		this.num = num;
		this.category = category;
		this.title = title;
		this.id = id;
		this.content = content;
		this.dateReg = dateReg;
		this.clickCnt = clickCnt;
		this.likeCnt = likeCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + clickCnt;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((dateReg == null) ? 0 : dateReg.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + likeCnt;
		result = prime * result + num;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Board other = (Board) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (clickCnt != other.clickCnt)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (dateReg == null) {
			if (other.dateReg != null)
				return false;
		} else if (!dateReg.equals(other.dateReg))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (likeCnt != other.likeCnt)
			return false;
		if (num != other.num)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
	
}