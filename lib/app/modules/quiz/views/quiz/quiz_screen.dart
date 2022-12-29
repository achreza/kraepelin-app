import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kraepelin/app/modules/quiz/controllers/quiz_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizController _controller = Get.put(QuizController());
    return Scaffold(
      body: Body(),
    );
  }
}
