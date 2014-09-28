package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import model.DesignModel;
import model.PictureModel;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import dao.PictureDao;

public class FileServiceImpl implements FileService {
	
	static Logger logger = Logger.getLogger(FileServiceImpl.class);

	PictureDao pictureDao;

	public void setPictureDao(PictureDao pictureDao) {
		this.pictureDao = pictureDao;
	}

	@Override
	public int fileUpload(MultipartFile pic, String table_num, String realPath)
			throws IOException, SQLException {
		InputStream inputStream;
		OutputStream outputStream;
		String ranID = getRandomID() + pic.getOriginalFilename();
		String path = realPath + "/" + table_num + "/"
				+ ranID;
		logger.debug(path);
		System.out.println(path);
		logger.debug(ranID);
		
		inputStream = pic.getInputStream();
		outputStream = new FileOutputStream(path);
		int readBytes = 0;
		byte[] buffer = new byte[8192];

		while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
			outputStream.write(buffer, 0, readBytes);
		}

		PictureModel picModel = new PictureModel("/peach/images/" + table_num + "/" 
				+ ranID, table_num,
				pic.getOriginalFilename(), ranID);
		return pictureDao.insertOne(picModel);
	}
	
	public int fileUpload(ArrayList<MultipartFile> pic, String table_num, String realPath,DesignModel desModel)
			throws IOException, SQLException {
		InputStream inputStream;
		OutputStream outputStream;
		int cnt=0;
		for(MultipartFile pi:pic){
			String ranID = getRandomID() + pi.getOriginalFilename();
			String path = realPath + "/" + table_num + "/"
					+ ranID;
	
			logger.debug(path);
			logger.debug(ranID);
			System.out.println(path);
			inputStream = pi.getInputStream();
			outputStream = new FileOutputStream(path);
			int seq=0;
			int readBytes = 0;
			byte[] buffer = new byte[8192];
	
			while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
				outputStream.write(buffer, 0, readBytes);
			}
			if(cnt==0){
				seq=desModel.getMain_top_logo();
			}
			if(cnt==1){
				seq=desModel.getLeft_top_logo();
			}if(cnt==2){
				seq=desModel.getIntroduction_img();
			}
			PictureModel picModel = new PictureModel(seq,"/peach/images/" + table_num + "/" 
					+ ranID, table_num,
					pi.getOriginalFilename(), ranID);
			 pictureDao.pictureUpdate(picModel);
			 cnt++;
		}
		return 0;
	}

	private String getRandomID() {
		Random ran = new Random();
		String path = "";
		for (int i = 0; i < 10; i++) {
			path += Integer.toString(ran.nextInt(10));
		}
		path += "_";
		return path;
	}

}
