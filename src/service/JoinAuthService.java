package service;

import model.AuthNumModel;

public interface JoinAuthService {

	public int joinAuth(AuthNumModel authNumModel);
	public boolean isExist(AuthNumModel authNumModel);
	public boolean isEmailExist(String email);  // ������ �̸��ּҰ� �ִ��� Ȯ��
	public int emailDelete(String email); // ������ �̸� ����
}
