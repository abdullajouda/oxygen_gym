class PersonalTrainersModel {
  int id;
  int weekDay;
  String status;
  String from;
  String to;
  String trainerName;
  String specialization;
  int gender;
  int currentOrders;
  int inOrders;

  PersonalTrainersModel(
      {this.id,
        this.weekDay,
        this.status,
        this.from,
        this.to,
        this.trainerName,
        this.specialization,
        this.gender,
        this.currentOrders,
        this.inOrders});

  PersonalTrainersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weekDay = json['week_day'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
    trainerName = json['trainer_name'];
    specialization = json['specialization'];
    gender = json['gender'];
    currentOrders = json['current_orders'];
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
    data['current_orders'] = this.currentOrders;
    data['in_orders'] = this.inOrders;
    return data;
  }
}