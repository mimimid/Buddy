package web.dto;

public class HospbPaging {

	private int curPage; // 현재 페이지 번호
	
	private int totalCount; //총 게시글 수
	private int listCount; //한 페이지에 보여질 게시글의 수
	private int totalPage; //총 페이지 수
	
	private int pageCount; //한 화면에 출력될 페이지네이션의 개수
	private int startPage; //화면에 보이는 시작 페이지네이션 번호
	private int endPage; //화면에 보이는 끝 페이지네이션 번호
	
	private int startNo; //화면에 보이는 게시글의 시작 번호
	private int endNo; //화면에 보이는 게시글의 끝 번호
	
	private String animal;
	private String category;
	private String searchType;
	private String keyWord;
	
	//디폴트 생성자 - 페이징 로직이 처리되지 않는다
	public HospbPaging() {}
	
	public HospbPaging(int totalCount, int curPage) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		
		makePaging();
	}
	
	public HospbPaging(int totalCount) {
		setTotalCount(totalCount);
		
		makePaging();
	}
	
	public HospbPaging(int totalCount, int curPage, int listCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);	//화면에 보여질 게시글 개수 지정하기
		
		makePaging();
	}
	
	public HospbPaging(int totalCount, int curPage, int listCount, int pageCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);	//화면에 보여질 게시글 개수 지정하기
		setPageCount(pageCount);	//화면에 보여질 페이징 개수 지정하기
		
		makePaging();
	}
	
	
	
	
	//페이지 정보를 생성(계산)하는 메소드
	private void makePaging() {
		if(totalCount == 0)	return; //게시글이 없는 경우 중단
		
		//기본값 설정
		if(curPage == 0)	this.curPage = 1; //첫 페이지를 기본 페이지로 설정한다
		if(listCount == 0)	this.listCount = 10; //화면에 보여질 게시글 수를 10개로 설정
		if(pageCount == 0)	this.pageCount = 10; //화면에 보여질 페이징 수를 10개로 설정
		
		//------------------------------------
		
		//총 페이지 수 계산
		totalPage = totalCount / listCount; // 총 게시글 수 / 한 페이지 게시글 수
		if( totalCount % listCount > 0 )	totalPage++;
		
		//총 페이지 수 보정
		//	-> 존재하는 페이지보다 큰 값의 페이지를 요청할 때
		//	-> 요청 페이지를 마지막 페이지로 변경한다
		if( curPage > totalPage )	curPage = totalPage;
		
		//------------------------------------
		
		//화면에 보이는 페이지네이션의 시작 번호, 끝 번호 계산
		startPage = ( (curPage-1)/pageCount ) * pageCount + 1;
		endPage = startPage + pageCount - 1;
	
		//총 페이지 수 보다 페이지네이션 끝번호가 클 때
		//	-> 마지막 페이지까지만 보이도록 설정한다
		if( endPage > totalPage )	endPage = totalPage;
		
		//------------------------------------
		
		//화면에 보이는 게시글의 시작 번호, 끝 번호 계산
		startNo = ( curPage-1 ) * listCount + 1;
		endNo = curPage * listCount;
		
	}

	public HospbPaging(int curPage, int totalCount, int listCount, int totalPage, int pageCount, int startPage,
			int endPage, int startNo, int endNo, String animal, String category, String searchType, String keyWord) {
		super();
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.listCount = listCount;
		this.totalPage = totalPage;
		this.pageCount = pageCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startNo = startNo;
		this.endNo = endNo;
		this.animal = animal;
		this.category = category;
		this.searchType = searchType;
		this.keyWord = keyWord;
	}

	@Override
	public String toString() {
		return "HospbPaging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount
				+ ", totalPage=" + totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", startNo=" + startNo + ", endNo=" + endNo + ", animal=" + animal + ", category="
				+ category + ", searchType=" + searchType + ", keyWord=" + keyWord + "]";
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getAnimal() {
		return animal;
	}

	public void setAnimal(String animal) {
		this.animal = animal;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
	
	

}
