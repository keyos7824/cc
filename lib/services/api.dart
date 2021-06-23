import 'dart:convert' show utf8, jsonDecode, jsonEncode;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../main.dart';

class Api {
  //static const String baseUrl = '192.168.1.37:8000';
  static const String baseUrl = '127.0.0.1:8000';
  static Connectivity _connectivity = Connectivity();

  // ---------------------------------------
  // Gestion de la connexion
  // ---------------------------------------
  Future<bool> isConnected() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    return connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi
        ? true
        : false;
  }

  Future<bool> hasInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future<bool> canConnect() async {
    return await isConnected() && await hasInternet();
  }

  // ---------------------------------------
  // Gestion de comptes
  // ---------------------------------------
  Future signup(body) async {
    Uri url = Uri.http(baseUrl, 'api/users');
    Response response = await post(
      url,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      user = jsonDecode(response.body);
    } else {
      Fluttertoast.showToast(
        msg: "${response.statusCode}, ${jsonDecode(response.body)}",
      );
    }
  }

   Future signin(body) async {
    Uri url = Uri.http(baseUrl, 'api/users');
    Response response = await post(
      url,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      user = jsonDecode(response.body);
    } else {
      Fluttertoast.showToast(
        msg: "${response.statusCode}, ${jsonDecode(response.body)}",
      );
    }
  }

   Future myAccount() async {
    Uri url = Uri.http(baseUrl, 'api/users');
    Response response = await get(
      url,
    );

    if (response.statusCode == 200) {
      String rawUtf8Data = utf8.decode(response.bodyBytes);
      Map data = jsonDecode(rawUtf8Data)[0]; 
      return data;
    } else {
      Fluttertoast.showToast(
        msg: "${response.statusCode}, ${jsonDecode(response.body)}",
      );
    }
  }

  // ---------------------------------------
  // Gestion des Entités
  // ---------------------------------------
  Future<List> getEntitiesPosts() async {
    Uri url = Uri.http(baseUrl, 'api/entities_posts');
    try {
      Response response = await get(
        url,
      ).timeout(
        Duration(seconds: 3),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
    return [];
  }

  // ---------------------------------------
  // Gestion des Patenaires
  // ---------------------------------------
  Future<List> getPartnersPost() async {
    Uri url = Uri.http(baseUrl, 'api/partners_posts');
    try {
      Response response = await get(
        url,
      ).timeout(
        Duration(seconds: 3),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
    return [];
  }

  Future<Object?> search(Map<String, dynamic>? query) async {
    Uri url = Uri.http(baseUrl, 'api/search', query);
    Response response = await get(
      url,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Fluttertoast.showToast(
        msg: "${response.statusCode}, ${jsonDecode(response.body)}",
      );
    }

    return null;
  }
}
