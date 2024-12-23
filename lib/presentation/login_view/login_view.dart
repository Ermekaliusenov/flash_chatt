

import 'package:flash_chatt/components/buttons/custom_button.dart';
import 'package:flash_chatt/components/inputs/custom_text_field.dart';
import 'package:flash_chatt/components/widgets/register_options_widget.dart';
import 'package:flash_chatt/presentation/register_view/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(onChanged: (value) {}, hintText: 'Почта'),
          SizedBox(
            height: height * 0.009,
          ),
          CustomTextField(onChanged: (value) {}, hintText: 'Сырдык соз'),
          SizedBox(
            height: height * 0.009,
          ),
          RegisterOptionWidget(
            text2: 'Каттала элек болсонуз?',
            text: 'Катталуу',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterView()),
              );
            },
          ),
          SizedBox(
            height: height * 0.1,
          ),
          CustomButton(data: 'Кириш', onPressed: () {})
        ],
      ),
    );
  }
}
