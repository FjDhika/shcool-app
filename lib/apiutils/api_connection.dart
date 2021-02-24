import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:school_app/model/apiModel.dart';
import 'package:school_app/model/jurusanModel.dart';
import 'package:school_app/model/siswaModel.dart';

final _base = "https://school-api-1399.herokuapp.com";
final _loginEndpoint = "/api/users/login";
final _loginURL = _base + _loginEndpoint;
final _createSiswa = _base + "/api/users"; //post
final _updateSiswa = _base + "/api/users/{id}"; //delete
final _addJurusan = _base + "/addJurusan"; //put

final _createJurusan = _base + "/api/jurusan";
final _getJurusan = _base + "/api/jurusan/avail";

Future<Role> login(UserLogin userLogin) async {
  try {
    Dio dio = new Dio();
    var response = await dio.post(_loginURL,
        data: userLogin.toDatabaseJson(),
        options: new Options(contentType: Headers.formUrlEncodedContentType));
    // print(response);
    if (response.statusCode == 200) {
      return Role.fromJson(json.decode(response.toString()));
    } else {
      print(json.decode(response.toString()).toString());
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    print(error.toString());
  }
}

Future<bool> updateSiswa(SiswaModel siswaModel) async {
  try {
    print("update");
    var url = _createSiswa + "/${siswaModel.id}";
    siswaModel.id = null;
    print(siswaModel.toJson().toString());
    Dio dio = new Dio();
    var response = await dio.put(url,
        data: siswaModel.toJson(),
        options: new Options(contentType: Headers.formUrlEncodedContentType));
    print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      // throw Exception(json.decode(response.toString()));
      print("failed");
    }
  } catch (error) {
    return false;
  }
}

Future<bool> createSiswa(SiswaModel siswaModel) async {
  try {
    Dio dio = new Dio();
    var response = await dio.post(_createSiswa,
        data: siswaModel.toJson(),
        options: new Options(contentType: Headers.formUrlEncodedContentType));
    // print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(json.decode(response.toString()).toString());
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    return false;
  }
}

Future<List<SiswaModel>> getSiswaData() async {
  try {
    Dio dio = new Dio();
    var response = await dio.get(_createSiswa);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => SiswaModel.fromJson(e))
          .toList();
    } else {
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    return null;
  }
}

Future<bool> createJurusan(JurusanModel jurusanModel) async {
  try {
    Dio dio = new Dio();
    var response = await dio.post(_createJurusan,
        data: jurusanModel.toDatabaseJson(),
        options: new Options(contentType: Headers.formUrlEncodedContentType));
    // print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    return false;
  }
}

Future<bool> deleteSiswa(String id) async {
  try {
    Dio dio = new Dio();
    var response = await dio.delete(_createSiswa + "/$id",
        options: new Options(contentType: Headers.formUrlEncodedContentType));
    // print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    return false;
  }
}

Future<List<JurusanModel>> getJurusanAvail() async {
  try {
    Dio dio = new Dio();
    var response = await dio.get(_getJurusan);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => JurusanModel.fromDatabaseJson(e))
          .toList();
    } else {
      throw Exception(json.decode(response.toString()));
    }
  } catch (error) {
    return null;
  }
}
