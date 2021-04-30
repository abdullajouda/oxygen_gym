class DoctorModel {
  int id;
  String status;
  String from;
  String to;
  int availableNo;
  String specialization;
  String doctorName;
  int gender;
  int type;

  DoctorModel(
      {this.id,
        this.status,
        this.from,
        this.to,
        this.availableNo,
        this.specialization,
        this.doctorName,
        this.gender,
        this.type,
      });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
    availableNo = json['available_no'];
    specialization = json['specialization'];
    doctorName = json['doctor_name'];
    gender = json['gender'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['from'] = this.from;
    data['to'] = this.to;
    data['available_no'] = this.availableNo;
    data['specialization'] = this.specialization;
    data['doctor_name'] = this.doctorName;
    data['gender'] = this.gender;
    return data;
  }
}