
class User {
  int userId;
  String name;
  String email;
  String phoneNumber;
  String password;
  String accessToken;
  String appVersion;
  String latitude;
  String longitude;
  String osType;
  Null profileImage;
  int created;
  int updated;

  User(
      {this.userId,
        this.name,
        this.email,
        this.phoneNumber,
        this.password,
        this.accessToken,
        this.appVersion,
        this.latitude,
        this.longitude,
        this.osType,
        this.profileImage,
        this.created,
        this.updated});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    accessToken = json['accessToken'];
    appVersion = json['appVersion'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    osType = json['osType'];
    profileImage = json['profile_image'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['accessToken'] = this.accessToken;
    data['appVersion'] = this.appVersion;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['osType'] = this.osType;
    data['profile_image'] = this.profileImage;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}