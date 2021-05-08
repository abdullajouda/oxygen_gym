class PersonalTrainersModel {
  int id;
  int weekDay;
  String status;
  String avatar;
  String from;
  String to;
  String trainerName;
  int gender;
  int inOrders;

  PersonalTrainersModel(
      {this.id,
        this.weekDay,
        this.status,
        this.avatar,
        this.from,
        this.to,
        this.trainerName,
        this.gender,
        this.inOrders});

  PersonalTrainersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weekDay = json['week_day'];
    status = json['status'];
    avatar = json['image'];
    from = json['from'];
    to = json['to'];
    trainerName = json['trainer_name'];
    gender = json['gender'];
    inOrders = json['in_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['week_day'] = this.weekDay;
    data['status'] = this.status;
    data['from'] = this.from;
    data['to'] = this.to;
    data['trainer_name'] = this.trainerName;
    data['gender'] = this.gender;
    data['in_orders'] = this.inOrders;
    return data;
  }
}