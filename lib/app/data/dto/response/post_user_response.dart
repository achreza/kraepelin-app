class PostUserResponse {
  bool? success;
  String? message;
  Data? data;

  PostUserResponse({this.success, this.message, this.data});

  PostUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? telp;
  String? updatedAt;
  String? createdAt;
  int? idUser;

  Data(
      {this.name,
      this.email,
      this.telp,
      this.updatedAt,
      this.createdAt,
      this.idUser});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    telp = json['telp'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['telp'] = this.telp;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id_user'] = this.idUser;
    return data;
  }
}
