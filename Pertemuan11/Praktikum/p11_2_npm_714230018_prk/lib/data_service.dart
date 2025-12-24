import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

class DataService {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      headers: {
        'Accept' :'application/json',
        'Content-Type': 'application/json',
        'x-api-key': 'reqres_bbca121c38f748198e21e44314b34e2b'
      },
    )
  );

  Future getUsers() async {

    try {
      final res = await dio.get('/users');
      debugPrint('STATUS: ${res.statusCode}');
      debugPrint('DATA  : ${res.data}');
      return res.data;
      
    } catch (e) {
      debugPrint('ERROR: $e');
      return null;
    }
  }

  Future<dynamic> postUser(String name, String job) async {
    try {

    final response = await dio.post('/users', data: {'name': name, 'job': job});
    debugPrint('STATUS: ${response.statusCode}');
    debugPrint('DATA  : ${response.data}');

    if (response.statusCode == 201) {

    
    return response.data;

    
  }
  return null;

  } on DioException catch (e) {
    debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
    debugPrint('DIO ERROR DATA  : ${e.response?.data}');
    return null;
  }
  }

  Future<UserCreate?> createUser(UserCreate user) async {
    try {
      final response = await dio.post(
        '/api/users',
        data: user.toMap(),
      );
      if (response.statusCode == 201) {
        return UserCreate.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('DIO ERROR DATA  : ${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ERROR: $e');
      rethrow;
    }
  }

  Future<dynamic>putUser(String idUser, String name, String job) async {
    try {
      final response = await dio.put(
        '/users/$idUser',
        data: {'name': name, 'job': job}
      );
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('DATA  : ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } on DioException catch (e) {
      debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('DIO ERROR DATA  : ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('ERROR: $e');
      return null;
    }
  }


  Future<dynamic> deleteUser(String idUser) async {
    try {
      final response = await dio.delete('/user/$idUser');

      debugPrint ('STATUS: ${response.statusCode}');
      debugPrint ('DATA  : ${response.data}');

      if (response.statusCode == 204){
        return 'Delete user succes';
      }
      return null;
      } on DioException catch (e) {

        debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
        debugPrint('DIO ERROR DATA  : ${e.response?.data}');
        return null;
    } catch (e) {
      debugPrint('ERROR: $e');
      return null;
    }
  }

  Future<Iterable<User>?> getUserModel() async {
    try {
      final response =  await dio.get('/users');
      
      if (response.statusCode == 200){
        final users = (response.data['data'] as List)
        .map((user) => User.fromJson(user))
        .toList();

        return users;
      }
      return null; 
    } on DioException catch (e) {
      debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('DIO ERROR DATA  : ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('ERROR: $e');
      return null;
    }
  }
}
