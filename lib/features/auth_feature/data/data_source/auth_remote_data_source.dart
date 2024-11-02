import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sindbad_store/core/api_service.dart';
import 'package:sindbad_store/features/auth_features/data/model/reset_password_model/reset_password_model.dart';
import 'package:sindbad_store/features/auth_features/data/model/sign_in_model/sgin_in_model.dart';
import 'package:sindbad_store/features/auth_features/data/model/sign_up_model/sgin_up_model.dart';
import 'package:sindbad_store/features/auth_features/domain/entity/reset_password_entity.dart';
import 'package:sindbad_store/features/auth_features/domain/entity/sign_in_entity.dart';
import 'package:sindbad_store/features/auth_features/domain/entity/sign_up_entity.dart';

abstract class AuthRemoteDataSource {
  Future<SignInEntity> signIn(String email, String password);

  Future<SignUpEntity> signUP(String username, String password, String email,
      String phone, String confirmPassword, String roleName);

  Future<ResetPasswordEntity> resetPassword(
      String currentPassword, String newPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;
  AuthRemoteDataSourceImpl(this.apiService, this.secureStorage);

  // get Token Function
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  @override
  Future<SignInEntity> signIn(String phoneNumber, String password) async {
    var data = await apiService.post(
      endPoint: "Auth/loginAsync",
      data: {
        'password': password,
        'phoneNumber': phoneNumber,
      },
    );

    SignInEntity userVerification = SignInModel.fromJson(data);

    if (userVerification.isSuccess == true && userVerification.token != null) {
      await secureStorage.write(key: 'token', value: userVerification.token);
    }

    print(userVerification);
    return userVerification;
  }

  @override
  Future<SignUpEntity> signUP(String username, String password, String email,
      String phone, String confirmPassword, String roleName) async {
    String? token = await getToken();
    var data = await apiService.post(endPoint: "Auth/RegisterUserAsync", data: {
      'email': email,
      'password': password,
      'name': username,
      'phoneNumber': phone,
      'roleName': roleName,
      'confirmPassword': confirmPassword,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    SignUpEntity userVerification = SignUpModel.fromJson(data);

    if (userVerification.isSuccess == true && userVerification.token != null) {
      await secureStorage.write(key: 'token', value: userVerification.token);
    }

    print(userVerification);
    return userVerification;
  }

  @override
  Future<ResetPasswordEntity> resetPassword(
      String currentPassword, String newPassword) async {
    String? token = await getToken();

    var data =
        await apiService.put(endPoint: "Auth/change-passwordAsync", data: {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    ResetPasswordEntity userPassword = ResetPasswordModel.fromJson(data);
    print(userPassword);
    return userPassword;
  }
}
