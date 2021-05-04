class SettingsModel {
  int id;
  String url;
  String logo;
  String appStoreUrl;
  String playStoreUrl;
  String infoEmail;
  String mobile;
  String phone;
  String facebook;
  String twitter;
  String linkedIn;
  String instagram;
  String googlePlus;
  String image;
  int showWorkout;
  int showDoctors;
  int showClasses;
  int showPersonal;
  String createdAt;
  String updatedAt;
  Pages rules;
  Pages privacy;
  Pages terms;
  Pages refund;
  String title;
  String description;
  String address;

  SettingsModel(
      {this.id,
        this.url,
        this.logo,
        this.appStoreUrl,
        this.playStoreUrl,
        this.infoEmail,
        this.mobile,
        this.phone,
        this.facebook,
        this.twitter,
        this.linkedIn,
        this.instagram,
        this.googlePlus,
        this.image,
        this.showWorkout,
        this.showDoctors,
        this.showClasses,
        this.showPersonal,
        this.createdAt,
        this.updatedAt,
        this.rules,
        this.privacy,
        this.terms,
        this.refund,
        this.title,
        this.description,
        this.address});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    logo = json['logo'];
    appStoreUrl = json['app_store_url'];
    playStoreUrl = json['play_store_url'];
    infoEmail = json['info_email'];
    mobile = json['mobile'];
    phone = json['phone'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedIn = json['linked_in'];
    instagram = json['instagram'];
    googlePlus = json['google_plus'];
    image = json['image'];
    showWorkout = json['show_workout'];
    showDoctors = json['show_doctors'];
    showClasses = json['show_classes'];
    showPersonal = json['show_personal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rules = json['rules'] != null ? new Pages.fromJson(json['rules']) : null;
    privacy =
    json['privacy'] != null ? new Pages.fromJson(json['privacy']) : null;
    terms = json['terms'] != null ? new Pages.fromJson(json['terms']) : null;
    refund = json['refund'] != null ? new Pages.fromJson(json['refund']) : null;
    title = json['title'];
    description = json['description'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['logo'] = this.logo;
    data['app_store_url'] = this.appStoreUrl;
    data['play_store_url'] = this.playStoreUrl;
    data['info_email'] = this.infoEmail;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linked_in'] = this.linkedIn;
    data['instagram'] = this.instagram;
    data['google_plus'] = this.googlePlus;
    data['image'] = this.image;
    data['show_workout'] = this.showWorkout;
    data['show_doctors'] = this.showDoctors;
    data['show_classes'] = this.showClasses;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rules != null) {
      data['rules'] = this.rules.toJson();
    }
    if (this.privacy != null) {
      data['privacy'] = this.privacy.toJson();
    }
    if (this.terms != null) {
      data['terms'] = this.terms.toJson();
    }
    if (this.refund != null) {
      data['refund'] = this.refund.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['address'] = this.address;
    return data;
  }
}

class Pages {
  int id;
  String createdAt;
  String title;
  String description;

  Pages({this.id, this.createdAt, this.title, this.description});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class SettingsOperation{
  SettingsModel _settingsModel;

  SettingsModel get settingsModel {
    return _settingsModel;
  }

  setSettings(SettingsModel settingsModel){
    _settingsModel = settingsModel;
  }

}