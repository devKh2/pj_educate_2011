package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DesignModel;

import org.springframework.web.multipart.MultipartFile;


public interface FileService {
	/*
	 * table_num = 그림 파일이 쓰이는 곳의 table 명
	 * realPath = 서버에 그림이 저장되는 진짜 주소
	 * 그림 파일을 서버에 upload 하고 db에 그 그림 정보를 등록 한다.
	 */
	int fileUpload(MultipartFile pic, String table_num, String realPath) throws IOException, SQLException;
	int fileUpload(ArrayList<MultipartFile> pic, String table_num, String realPath,DesignModel desModel) throws IOException, SQLException;
}
