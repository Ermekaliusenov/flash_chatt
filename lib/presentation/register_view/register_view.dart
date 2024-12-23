import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chatt/components/buttons/custom_button.dart';
import 'package:flash_chatt/components/inputs/custom_text_field.dart';
import 'package:flash_chatt/components/widgets/register_options_widget.dart';
import 'package:flash_chatt/models/user_model.dart';
import 'package:flash_chatt/presentation/home_view/home_view.dart';
import 'package:flash_chatt/presentation/login_view/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  String? userName;
  UserModel? userModel;
  final users = FirebaseFirestore.instance.collection('user');

  Future<void> registerEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Каттоо ийгиликтүү аяктады!')),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Сырдык соз жетишсиз')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Мындай аккаунт бар!')),
          );
        }
      }
    }

    Future<DocumentReference<Map<String, dynamic>>> addUser(
        String email, String password) async {
      final UserModel userModel = UserModel(
          userName: userName!,
          userId: FirebaseAuth.instance.currentUser.toString(),
          email: email,
          password: password);
      final userData = await users.add(userModel.toFirebase());
      return userData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (value) {
                  userName = value;
                  log('email ----> $userName');
                },
                hintText: 'Атыныз',
                validator: (value) {},
              ),
              SizedBox(height: height * 0.009),
              CustomTextField(
                onChanged: (value) {
                  email = value;
                  log('email---->$email');
                },
                hintText: 'Почта',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Почтаны жаз!';
                  } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                      .hasMatch(value)) {
                    return 'Туура почта киргизиңиз!';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.009),
              CustomTextField(
                onChanged: (value) {
                  password = value;
                  log('password ----> $password');
                },
                hintText: 'Сырдык соз',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Сырдык созду киргизиңиз!';
                  } else if (value.length < 6) {
                    return 'Сырдык соз кеминде 6 символ болуш керек!';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.009),
              CustomTextField(
                onChanged: (value) {
                  confirmPassword = value;
                  log('confirm password ----> $confirmPassword');
                },
                hintText: 'Сырдык созду тастыктоо',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Сырдык созду тастыктаңыз!';
                  } else if (value != password) {
                    return 'Сырдык соз дал келбейт!';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.009),
              RegisterOptionWidget(
                text2: 'Катталган болсонуз?',
                text: 'Кириш',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
              ),
              SizedBox(height: height * 0.1),
              CustomButton(
                  data: 'Катталуу',
                  onPressed: () {
                    registerEmail();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
