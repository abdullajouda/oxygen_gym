class SliderModel {
  int id;
  String image;
  int categoryId;
  String createdAt;
  String title;

  SliderModel({this.id, this.image, this.categoryId, this.createdAt, this.title});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    return data;
  }
}