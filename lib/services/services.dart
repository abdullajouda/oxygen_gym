import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services with ChangeNotifier {
  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
    notifyListeners();
  }

  setUserType(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userType', type);
    notifyListeners();
  }

  getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('userType');
    notifyListeners();
    return type;
  }

  setUser({
      int id, String name, String email, String mobile, String avatar,String address}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('mobile', mobile);
    prefs.setString('avatar', avatar);
    prefs.setString('address', address);
    notifyListeners();
  }

  clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
    prefs.remove('notifications');
    prefs.remove('userType');
    prefs.remove('id');
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('mobile');
    prefs.remove('avatar');
    notifyListeners();
  }

  setImage(String image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('avatar', image);
    notifyListeners();
  }

  loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('email');
  }

  loadMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('mobile');
  }

  loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('avatar');
  }

  loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('user_address');
  }
}
