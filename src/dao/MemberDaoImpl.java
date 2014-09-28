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

		logger.debug("MemberDaoImple클래스의 isExist메서드의  result = " + result);

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

	// 회원 가입 메서드
	public int insert(JoinRequest jr) throws SQLException {
		logger.debug("jr : " + jr.toString());
		logger.debug("result 전");
		logger.debug("MemberDaoImpl의  insert메서드 실행 : ");
		int result = sqlMapClient.update("user.join", jr);

		logger.debug("user.join의 리턴값:  " + result);
		return result;
	}

	// 회원 정보 수정 메서드
	public int modified(JoinRequest jr) throws SQLException {
		logger.debug("jr : " + jr.toString());
		logger.debug("result 전");
		logger.debug("MemberDaoImpl의  modified메서드 실행 : ");
		int result = sqlMapClient.update("user.modified", jr);

		logger.debug("user.modified의 리턴값:  " + result);
		return result;
	}

	// 회원 아이디 검색 메서드
	public List<SearchMember> IdSearch(String name, String preResidentNum,
			String tailResidentNum) throws SQLException {
		logger.debug("MemberDaoImple클래스의 IdSearch:  name : " + name
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
		logger.debug("MemberDaoImple클래스의 IdSearch:  name : " + name);

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

	// 회원 비밀번호 검색 메서드
	public List<SearchMember> PwSearch(String name, String preResidentNum,
			String tailResidentNum, String id) throws SQLException {
		logger.debug("MemberDaoImple클래스의 IdSearch:  name : " + name
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

	// 이름과 주번이 존재하는지 확인
	public boolean isNameResidentExist(String name, String preResidentNum,
			String tailResidentNum) throws SQLException {
		boolean rtn = false;

		Map<String, String> params = new HashMap<String, String>();
		params.put("id", name);
		params.put("name", preResidentNum);
		params.put("name", tailResidentNum);
		String result = (String) sqlMapClient.queryForObject(
				"user.isNameResidentExist", params);
		logger.debug("MemberDaoImple클래스의 isNameResidentExist메서드의  result name = "
				+ result);
		if (result != null && result.equals(name)) { // 이름과 주번이 있을 때
			rtn = true;
			logger.debug("이름과 주민등록번호가 등록되어있다");
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
				// 즐겨 찾는 스토어 리스트를 받아온다.
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
