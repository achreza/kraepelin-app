import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kraepelin/app/data/dto/response/post_user_response.dart';
import 'package:kraepelin/app/modules/quiz/views/score/score_screen.dart';
import 'package:kraepelin/app/services/user_service.dart';

import '../../../data/models/question_model.dart';

class QuizController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation? get animation => this._animation;

  PageController? _pageController;
  PageController? get pageController => this._pageController;

  List<String>? pertanyaan = [];
  List<String>? jawaban = [];
  List<String> indexJawaban = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ];
  final _random = new Random();

  PostUserResponse? userData;

  List<Question>? _questions = [];
  List<Question>? get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int? get correctAns => this._correctAns;

  int? _wrongAns;
  int? get wrongAns => this._wrongAns;

  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  int _numOfWrongAns = 0;
  int get numOfWrongAns => this._numOfWrongAns;

  int _numOfNotAns = 0;
  int get numOfNotAns => this._numOfNotAns;

  UserService? userService;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    userService = Get.put<UserService>(UserService());
    userData = Get.arguments;
    generatePertanyaan();
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();

    Future.delayed(Duration(seconds: 60)).then((_) {
      simpanData();
      Get.to(() => ScoreScreen());
    });

    super.onInit();
  }

  void simpanData() async {
    String message = await userService!.tambahData(
        numOfCorrectAns.toString(),
        numOfWrongAns.toString(),
        numOfNotAns.toString(),
        "60",
        userData!.data!.idUser.toString());
    Get.snackbar("Simpan Data", message);
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns)
      _numOfCorrectAns++;
    else
      _numOfWrongAns++;

    // It will stop the counter
    // _animationController!.stop();
    // update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions!.length) {
      _isAnswered = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      // _animationController!.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      simpanData();

      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  void generatePertanyaan() {
    for (var i = 0; i < 20; i++) {
      int angka1 = next(1, 10);
      int angka2 = next(1, 10);
      int jaw = angka1 + angka2;
      String ans = jaw.toString();
      String output = ans[ans.length - 1];

      pertanyaan!.add("$angka1 + $angka2 = ?");
      jawaban!.add(output);
      Question pertanyaanBaru = Question(
          id: i,
          question: pertanyaan![i],
          options: indexJawaban,
          answer: int.parse(output));

      questions!.add(pertanyaanBaru);
    }
  }
}
