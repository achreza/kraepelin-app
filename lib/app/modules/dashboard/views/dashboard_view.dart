import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: EdgeInsets.all(10),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text('Kraepelin',
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800)),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            controller: controller.nameController,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Nama'
                  : null;
            },
            decoration: inputDecoration('Nama', Icons.person),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Email'
                  : null;
            },
            controller: controller.emailController,
            decoration: inputDecoration('Email', Icons.mail),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Nomor Telepon'
                  : null;
            },
            controller: controller.telpController,
            decoration: inputDecoration('Nomor Telepon', Icons.phone),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                controller.postUser();
              }
            },
            child: Text('Mulai Quiz'),
          ),
        ]),
      ),
    )));
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
      color: Colors.black,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
  );
}
