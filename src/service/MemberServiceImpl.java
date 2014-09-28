package service;

import java.sql.SQLException;
import java.util.List;

import model.Member;
import model.MemberModelList;
import model.MenuListModel;
import model.MenuModel;
import model.SearchParam;
import dao.MemberDao;

public class MemberServiceImpl implements MemberService{
	MemberDao memberDao;
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public MemberModelList getMemberList(SearchParam searParam) throws SQLException{
		int totalMenuModelCount = memberDao.getMemberCount(searParam.getKw());

		if (totalMenuModelCount == 0) {
			return new MemberModelList();
		}
		
		//�˻��� row ���� ��ü ��� ������ �� ����.
		int totalPageCount;
		
		int firstRow;
		int endRow;
		
		//�˻��� row ���� ��ü ��� ������ �� ����.(�� �������� 5�� row) 
		totalPageCount = calculateTotalPageCount(totalMenuModelCount, 10);
		//���հ˻� �� section �� �ο� ����(5 ��)�� ���۰� �� �ο� ����. 
		firstRow = calculateFirstRow(searParam.getP(), 10);
		endRow = calculateEndRow(firstRow, 5, totalMenuModelCount);

		List<Member> memberModelList = memberDao.getMemberList(firstRow, endRow, searParam.getKw());

		MemberModelList memberListView = new MemberModelList(
				memberModelList, searParam.getP(), totalPageCount, firstRow,
				endRow, totalMenuModelCount, 10);
		
		return memberListView;
	}
	
	public int deleteMember(String id) throws SQLException{
		memberDao.deleteMember(id);
		return 1;
	}
	

	/**
	 * �˻� ������� ù��° row ���ϱ�.
	 * @param requestPageNumber
	 * @param count_per_page
	 * @return
	 */
	private int calculateFirstRow(int requestPageNumber, int count_per_page) {
		int firstRow = (requestPageNumber - 1) * count_per_page + 1;
		return firstRow;
	}
	
	/**
	 * �˻� �������  ������ row ���ϱ�.
	 * @param firstRow
	 * @param count_per_page
	 * @param totalStoreModelCount
	 * @return
	 */
	private int calculateEndRow(int firstRow, int count_per_page, int totalStoreModelCount) {
		int endRow = firstRow + count_per_page - 1;
		
		if (endRow > totalStoreModelCount) {
			endRow = totalStoreModelCount;
		}
		return endRow;
	}
	
	/**
	 * ���������� row ������ ��ü ������ �� ���ϱ�.
	 * @param totalMenuCount
	 * @param count_per_page
	 * @return
	 */
	private int calculateTotalPageCount(int totalMenuCount, int count_per_page) {
		if (totalMenuCount == 0) {
			return 0;
		}
		int pageCount = totalMenuCount / count_per_page;
		if (totalMenuCount % count_per_page > 0) {
			pageCount++;
		}
		return pageCount;
	}
}
