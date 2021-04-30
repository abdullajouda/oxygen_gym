class WorkoutModel {
  int id;
  String status;
  String from;
  String to;
  int availableNo;

  WorkoutModel({this.id, this.status, this.from, this.to, this.availableNo});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
    availableNo = json['available_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['from'] = this.from;
    data['to'] = this.to;
    data['available_no'] = this.availableNo;
    return data;
  }
}