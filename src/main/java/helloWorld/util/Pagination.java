package helloWorld.util;

import java.io.Serializable;

public class Pagination<T> implements Serializable{
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int DEFAULT_PAGE_NO = 1;
    public static final String DEFAULT_PAGE_SIZE_STRING = "10";
    public static final String DEFAULT_PAGE_NO_STRING = "1";
    private int pageSize;
    private int currentPage;
    private int totalPage;
    private int totalCount;
    public Pagination() {
        this.currentPage = 1;
        this.pageSize = DEFAULT_PAGE_SIZE;
    }

    /**
     *
     * @param currentPage
     * @param pageSize
     */
    public Pagination(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    /**
    *
    * getter of currentpage
    *
    **/
    public int getCurrentPage() {
        return currentPage;
    }

    /**
    *
    * setter of currentpage
    * @param currentPage
    *
    **/
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
    *
    * getter of pagesize
    *
    **/
    public int getPageSize() {
        return pageSize;
    }

    /**
    *
    * setter of pagesize
    * @param pageSize
    *
    **/
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
    *
    * getter of totalpage
    *
    **/
    public int getTotalPage() {
        return totalPage;
    }

    /**
    *
    * setter of totalpage
    * @param totalPage
    *
    **/
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    /**
    *
    * getter of totalcount
    *
    **/
    public int getTotalCount() {
        return totalCount;
    }

    /**
    *
    * setter of totalcount
    * @param totalCount
    *
    **/
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.totalPage = totalCount % this.pageSize == 0 ? totalCount / this.pageSize : totalCount / this.pageSize + 1;
        if(totalPage<this.currentPage){
            this.currentPage = totalPage==0?1:totalPage;
        }
    }

}
