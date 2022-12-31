import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kraepelin/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:kraepelin/app/routes/app_pages.dart';

import '../../../../../constant.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizController _qnController = Get.put(QuizController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "Jawaban Benar : ${_qnController.numOfCorrectAns}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "Jawaban Salah : ${_qnController.numOfWrongAns}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "Tidak Dijawab : ${20 - (_qnController.numOfWrongAns + _qnController.numOfCorrectAns)}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 2),
              ElevatedButton(
                  onPressed: () => Get.offNamed(Routes.DASHBOARD),
                  child: Text("Kembali ke Dashboard"))
            ],
          )
        ],
      ),
    );
  }
}
