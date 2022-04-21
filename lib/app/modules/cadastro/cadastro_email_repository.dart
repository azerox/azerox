import 'package:azerox/app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CadastroEmailRepository extends GetConnect {
  final Dio dio;
  CadastroEmailRepository(this.dio);

  Future<List<String>> validCreateAccount({
    required String email,
    required String profile,
  }) async {
    var result = <String>[];
    var res = await dio.get(
      '/jsonusers.asmx/GetExists',
      queryParameters: {'Email': email, 'PublicProfile': profile},
    );

    if (res.data['EmailExists']) result.add('Email já existe');
    if (res.data['PublicProfileExists']) result.add('Perfil já existe');

    return result;
  }

  Future<UserModel> cadastroWithEmail({
    required String email,
    required String password,
    required String day,
    required String month,
    required String year,
    required String country,
    required String? state,
    required String? city,
    required String nickName,
    required String name,
    required String profile,
  }) async {
    final response = await dio.get(
      "/jsonusers.asmx/InsertUserFacebook",
      queryParameters: {
        'CodUserType': 1,
        'Country': country,
        'City': city,
        'State': state,
        'Name': name,
        'Nick': nickName,
        'BirthDay': day,
        'BirthMonth': month,
        'BirthYear': year,
        'Email': email,
        'ZipCode': '0000000',
        'PublicProfile': profile,
        'PassWord': password,
      },
    );
    
    final user = UserModel.fromJson(response.data["Return"]);
    user.password = password;
    return user;
  }
}
