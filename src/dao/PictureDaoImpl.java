package dao;

import java.sql.SQLException;

import model.DesignModel;
import model.PictureModel;

import com.ibatis.sqlmap.client.SqlMapClient;

public class PictureDaoImpl implements PictureDao{
	SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	@Override
	public int insertOne(PictureModel picModel)
			throws SQLException {
		sqlMapClient.insert("master.insertPic", picModel);
		return (Integer)sqlMapClient.queryForObject("master.getMaxseq");
	}
	@Override
	public int pictureUpdate(PictureModel picModel) throws SQLException {
		//String str=(String)sqlMapClient.queryForObject("master.pictureExist",picModel.getSeq());
		picModel.setSeq((Integer)sqlMapClient.queryForObject("master.getMaxseq"));
		sqlMapClient.update("master.insertPic", picModel);
		return 0;
	}

}
