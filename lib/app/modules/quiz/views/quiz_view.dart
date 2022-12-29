import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kraepelin/app/modules/quiz/views/quiz/quiz_screen.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    return QuizScreen();
  }
}
