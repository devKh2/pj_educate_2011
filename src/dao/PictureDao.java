package dao;

import java.sql.SQLException;

import model.PictureModel;

public interface PictureDao {
	//그림 파일의 정보를 DB에 등록 한다.
	int insertOne(PictureModel picModel) throws SQLException;
	int pictureUpdate(PictureModel picModel) throws SQLException;
}
