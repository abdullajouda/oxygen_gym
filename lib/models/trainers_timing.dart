class Trainer {
  int id;
  String status;
  String name;
  String image;
  List<Times> times;

  Trainer({this.id, this.status, this.name, this.image, this.times});

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    image = json['image'];
    if (json['times'] != null) {
      times = new List<Times>();
      json['times'].forEach((v) {
        times.add(new Times.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.times != null) {
      data['times'] = this.times.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Times {
  int id;
  int trainerId;
  String from;
  String to;
  int weekDay;
  String status;
  String createdAt;

  Times(
      {this.id,
        this.trainerId,
        this.from,
        this.to,
        this.weekDay,
        this.status,
        this.createdAt});

  Times.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainerId = json['trainer_id'];
    from = json['from'];
    to = json['to'];
    weekDay = json['week_day'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trainer_id'] = this.trainerId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['week_day'] = this.weekDay;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}