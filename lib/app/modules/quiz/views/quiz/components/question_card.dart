import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kraepelin/app/data/models/question_model.dart';
import 'package:kraepelin/app/modules/quiz/controllers/quiz_controller.dart';
import '../../../../../../constant.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuizController _controller = Get.put(QuizController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          // ...List.generate(
          //   question.options.length,
          //   (index) => Option(
          //     index: index,
          //     text: question.options[index],
          //     press: () => _controller.checkAns(question, index),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Option(
                text: question.options[1],
                index: 1,
                press: () => _controller.checkAns(question, 1),
              ),
              Option(
                text: question.options[2],
                index: 2,
                press: () => _controller.checkAns(question, 2),
              ),
              Option(
                text: question.options[3],
                index: 3,
                press: () => _controller.checkAns(question, 3),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Option(
                text: question.options[4],
                index: 4,
                press: () => _controller.checkAns(question, 4),
              ),
              Option(
                text: question.options[5],
                index: 5,
                press: () => _controller.checkAns(question, 5),
              ),
              Option(
                text: question.options[6],
                index: 6,
                press: () => _controller.checkAns(question, 6),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Option(
                text: question.options[7],
                index: 7,
                press: () => _controller.checkAns(question, 7),
              ),
              Option(
                text: question.options[8],
                index: 8,
                press: () => _controller.checkAns(question, 8),
              ),
              Option(
                text: question.options[9],
                index: 9,
                press: () => _controller.checkAns(question, 9),
              ),
            ],
          ),
          Option(
            text: question.options[0],
            index: 0,
            press: () => _controller.checkAns(question, 0),
          )
        ],
      ),
    );
  }
}
