import 'package:oxygen/models/user.dart';

class HistoryModel {
  int id;
  int userId;
  int targetId;
  String orderDate;
  int dayId;
  int status;
  int type;
  String from;
  String to;
  String specialization;
  String person;
  String createdAt;
  User user;

  HistoryModel(
      {this.id,
        this.userId,
        this.targetId,
        this.orderDate,
        this.dayId,
        this.status,
        this.type,
        this.from,
        this.to,
        this.specialization,
        this.person,
        this.createdAt,
        this.user});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    targetId = json['target_id'];
    orderDate = json['order_date'];
    dayId = json['day_id'];
    status = json['status'];
    type = json['type'];
    from = json['from'];
    to = json['to'];
    specialization = json['specialization'];
    person = json['person'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['target_id'] = this.targetId;
    data['order_date'] = this.orderDate;
    data['day_id'] = this.dayId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['from'] = this.from;
    data['to'] = this.to;
    data['specialization'] = this.specialization;
    data['person'] = this.person;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}