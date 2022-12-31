import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kraepelin/app/data/dto/response/post_user_response.dart';
import 'package:kraepelin/app/modules/quiz/views/quiz_view.dart';
import 'package:kraepelin/app/routes/app_pages.dart';
import 'package:kraepelin/app/services/user_service.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  UserService? userService;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telpController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    userService = Get.put<UserService>(UserService());
    super.onInit();
  }

  void postUser() async {
    PostUserResponse response = await userService!.postUser(
        nameController.text, emailController.text, telpController.text);
    print(response.toJson());
    Get.to(() => QuizView(), arguments: response);
  }
}
