import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  String mobile;
  int cityId;
  String imageProfile;
  int gender;
  String accessToken;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.mobile,
        this.cityId,
        this.imageProfile,
        this.gender,
        this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    cityId = json['city_id'];
    imageProfile = json['image_profile'];
    gender = json['gender'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['city_id'] = this.cityId;
    data['image_profile'] = this.imageProfile;
    data['gender'] = this.gender;
    data['access_token'] = this.accessToken;
    return data;
  }
}
class UserFunctions with ChangeNotifier {
  User _user;

  User get user {
    return _user;
  }

  setUser(User user){
    _user = user;
  }

  clearUser(){
    _user = User();
  }

}