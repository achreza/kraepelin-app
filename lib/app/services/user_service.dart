import 'package:get/get.dart';
import 'package:kraepelin/app/data/dto/response/post_user_response.dart';

class UserService extends GetConnect {
  String apiBaseUrl = "https://kraepelin.000webhostapp.com/api/";

  Future<PostUserResponse> postUser(
      String name, String email, String telp) async {
    final response = await post(
        apiBaseUrl + "users?name=$name&email=$email&telp=$telp",
        {"name": name, "email": email, "password": telp});
    if (response.status.hasError) {
      return PostUserResponse(
          success: false, message: "Error: ${response.statusText}");
    } else {
      return PostUserResponse.fromJson(response.body);
    }
  }

  Future<String> tambahData(String benar, String salah, String belum,
      String waktu, String id_user) async {
    final response = await post(
        apiBaseUrl +
            "nilai?benar=$benar&salah=$salah&belum=$belum&waktu=$waktu&id_user=$id_user",
        {
          "benar": benar,
          "salah": salah,
          "belum": belum,
          "waktu": waktu,
          "id_user": id_user
        });
    if (response.status.hasError) {
      return "Error: ${response.statusText}";
    } else {
      return "Data Tersimpan";
    }
  }
}
