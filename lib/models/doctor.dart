class DoctorModel {
  int id;
  int weekDay;
  String status;
  String from;
  String to;
  int availableNo;
  String specialization;
  String doctorName;
  int gender;
  int type;
  int currentOrders;
  int inOrders;

  DoctorModel(
      {this.id,
        this.weekDay,
        this.status,
        this.from,
        this.to,
        this.availableNo,
        this.specialization,
        this.doctorName,
        this.gender,
        this.type,
        this.currentOrders,
        this.inOrders});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weekDay = json['week_day'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
    availableNo = json['available_no'];
    specialization = json['specialization'];
    doctorName = json['doctor_name'];
    gender = json['gender'];
    type = json['type'];
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
    data['available_no'] = this.availableNo;
    data['specialization'] = this.specialization;
    data['doctor_name'] = this.doctorName;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['current_orders'] = this.currentOrders;
    data['in_orders'] = this.inOrders;
    return data;
  }
}