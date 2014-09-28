package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.StoreModel;
import model.FavoriteSiteModel;
import model.JoinRequest;
import model.Member;
import model.SearchMember;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import controller.JoinController;

public class MemberDaoImpl implements MemberDao {

	static Logger logger = Logger.getLogger(JoinController.class);
	private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public int deleteMember(String id) throws SQLException {
		sqlMapClient.delete("user.delete", id);
		return 1;
	}

	public boolean isExist(String id) throws SQLException {

		boolean rtn = true;

		String result = (String) sqlMapClient
				.queryForObject("user.isExist", id);

		logger.debug("MemberDaoImpleŬ������ isExist�޼�����  result = " + result);

		if (result != null && result.equals(id)) {
			rtn = false;
			return rtn;
		}
		logger.debug(rtn);
		return rtn;
	}

	public Member login(String id, String pw) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("pw", pw);
		Member member = (Member) sqlMapClient.queryForObject("user.login",
				params);
		return getFavoriteSite(member);
	}

	public int insertFavoriteSite(String st_num, String id) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("st_num", st_num);
		if (sqlMapClient.queryForObject("user.isExistingFavoriteSite", params) == null) {
			sqlMapClient.insert("user.setFavoriteSite", params);
			return 1;
		} else {
			return 0;
		}
	}

	// ȸ�� ���� �޼���
	public int insert(JoinRequest jr) throws SQLException {
		logger.debug("jr : " + jr.toString());
		logger.debug("result ��");
		logger.debug("MemberDaoImpl��  insert�޼��� ���� : ");
		int result = sqlMapClient.update("user.join", jr);

		logger.debug("user.join�� ���ϰ�:  " + result);
		return result;
	}

	// ȸ�� ���� ���� �޼���
	public int modified(JoinRequest jr) throws SQLException {
		logger.debug("jr : " + jr.toString());
		logger.debug("result ��");
		logger.debug("MemberDaoImpl��  modified�޼��� ���� : ");
		int result = sqlMapClient.update("user.modified", jr);

		logger.debug("user.modified�� ���ϰ�:  " + result);
		return result;
	}

	// ȸ�� ���̵� �˻� �޼���
	public List<SearchMember> IdSearch(String name, String preResidentNum,
			String tailResidentNum) throws SQLException {
		logger.debug("MemberDaoImpleŬ������ IdSearch:  name : " + name
				+ ",    preResidentNum:" + preResidentNum
				+ "tailResidentNum:  " + tailResidentNum);

		Map<String, String> params = new HashMap<String, String>();
		params.put("name", name);
		params.put("preResidentNum", preResidentNum);
		params.put("tailResidentNum", tailResidentNum);
		return (List<SearchMember>) sqlMapClient.queryForList("user.idsearch",
				params);
	}

	public List<SearchMember> IdSearch(String name) throws SQLException {
		logger.debug("MemberDaoImpleŬ������ IdSearch:  name : " + name);

		Map<String, String> params = new HashMap<String, String>();
		params.put("name", name);
		return (List<SearchMember>) sqlMapClient.queryForList(
				"user.idsearchlist", params);
	}

	public List<Member> getMemberList(int firstRow, int endRow, String keyWord)
			throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("firstRow", Integer.toString(firstRow));
		params.put("endRow", Integer.toString(endRow));
		params.put("keyWord", keyWord);
		return (List<Member>) sqlMapClient.queryForList("user.getMemberList",
				params);
	}

	public int getMemberCount(String keyWord) throws SQLException {
		return (Integer) sqlMapClient.queryForObject("user.getMemberCount",
				keyWord);
	}

	// ȸ�� ��й�ȣ �˻� �޼���
	public List<SearchMember> PwSearch(String name, String preResidentNum,
			String tailResidentNum, String id) throws SQLException {
		logger.debug("MemberDaoImpleŬ������ IdSearch:  name : " + name
				+ ",    preResidentNum:" + preResidentNum
				+ "tailResidentNum:  " + tailResidentNum + "id: " + id);

		Map<String, String> params = new HashMap<String, String>();
		params.put("name", name);
		params.put("name", preResidentNum);
		params.put("name", tailResidentNum);
		params.put("id", id);
		return (List<SearchMember>) sqlMapClient.queryForList("user.pwsearch",
				params);
	}

	// �̸��� �ֹ��� �����ϴ��� Ȯ��
	public boolean isNameResidentExist(String name, String preResidentNum,
			String tailResidentNum) throws SQLException {
		boolean rtn = false;

		Map<String, String> params = new HashMap<String, String>();
		params.put("id", name);
		params.put("name", preResidentNum);
		params.put("name", tailResidentNum);
		String result = (String) sqlMapClient.queryForObject(
				"user.isNameResidentExist", params);
		logger.debug("MemberDaoImpleŬ������ isNameResidentExist�޼�����  result name = "
				+ result);
		if (result != null && result.equals(name)) { // �̸��� �ֹ��� ���� ��
			rtn = true;
			logger.debug("�̸��� �ֹε�Ϲ�ȣ�� ��ϵǾ��ִ�");
			return rtn;
		}
		logger.debug(rtn);
		return rtn;
	}

	public Member admin_login(String id, String pw) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("pw", pw);
		Member member = (Member) sqlMapClient.queryForObject(
				"user.admin_login", params);
		return member;
	}

	public Member store_login(String id, String pw) throws SQLException {

		Member member = null;

		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("pw", pw);
		member = (Member) sqlMapClient.queryForObject(
				"user.store_login_search", params);

		try {
			if (member.getId() == null) {
				return null;
			}
		} catch (NullPointerException e) {
			return null;
		}
		int storeMember_st_num = member.getSt_num();

		member = (Member) sqlMapClient.queryForObject("user.login", params);
		member.setSt_num(storeMember_st_num);
		return getFavoriteSite(member);
	}

	public Member getFavoriteSite(Member member) throws SQLException {
		if(member!=null){
				// ��� ã�� ����� ����Ʈ�� �޾ƿ´�.
			ArrayList<String> stnums = (ArrayList<String>) sqlMapClient.queryForList("user.getFavoriteSite", member.getId());
				if (stnums != null) {
					ArrayList<StoreModel> storemodels = new ArrayList<StoreModel>();
					for (String stnu : stnums) {
						StoreModel st = (StoreModel) sqlMapClient.queryForObject(
								"store.getStoreOne", stnu);
						if (st != null)
							storemodels.add(st);
					}
					if (storemodels != null) 
						member.setFavoritesite(new FavoriteSiteModel(storemodels));
				}
		}
		return member;
	}
}
