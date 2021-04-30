class ClassModel {
  int id;
  String status;
  String from;
  String to;
  int availableNo;
  String specialization;
  String trainerName;
  int gender;

  ClassModel(
      {this.id,
        this.status,
        this.from,
        this.to,
        this.availableNo,
        this.specialization,
        this.trainerName,
        this.gender});

  ClassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
    availableNo = json['available_no'];
    specialization = json['specialization'];
    trainerName = json['trainer_name'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['from'] = this.from;
    data['to'] = this.to;
    data['available_no'] = this.availableNo;
    data['specialization'] = this.specialization;
    data['trainer_name'] = this.trainerName;
    data['gender'] = this.gender;
    return data;
  }
}