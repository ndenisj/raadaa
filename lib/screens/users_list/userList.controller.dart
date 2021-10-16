import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_json/screens/users_list/userList.model.dart';
import 'package:users_json/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class UserListController extends ChangeNotifier {
  List<dynamic> _users = <dynamic>[];
  List<dynamic> get users => _users;
  set users(List<dynamic> users) {
    _users = users;
    notifyListeners();
  }

  // List<User> _users = <User>[];
  // List<User> get users => _users;
  // set users(List<User> users) {
  //   _users = users;
  //   notifyListeners();
  // }

  Future<List<dynamic>> getUsers() async {
    try {
      final url = ApiEndPoints.getAPI('users');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      final responseBody = jsonDecode(response.body);

      if (responseBody.length > 0) {
        users = responseBody;
        return users;
      } else {
        Get.snackbar('Error', 'No active permit found!');
      }
    } on SocketException {
      Get.snackbar('Error', 'Network error. Please check your data connection');
    } on TimeoutException {
      Get.snackbar('Error', 'Not responding, please try again');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Something went wrong, please try again');
    }
    return users;
  }
}
