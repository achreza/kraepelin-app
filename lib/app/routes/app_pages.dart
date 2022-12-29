import 'package:get/get.dart';

import 'package:kraepelin/app/modules/home/bindings/home_binding.dart';
import 'package:kraepelin/app/modules/home/views/home_view.dart';
import 'package:kraepelin/app/modules/quiz/bindings/quiz_binding.dart';
import 'package:kraepelin/app/modules/quiz/views/quiz_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.QUIZ;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => QuizView(),
      binding: QuizBinding(),
    ),
  ];
}
