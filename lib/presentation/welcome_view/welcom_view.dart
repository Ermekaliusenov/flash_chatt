import 'package:flash_chatt/components/animations/Scale_Animation.dart';
import 'package:flash_chatt/components/animations/text_animation.dart';
import 'package:flash_chatt/components/buttons/custom_button.dart';
import 'package:flash_chatt/presentation/login_view/login_view.dart';
import 'package:flash_chatt/presentation/register_view/register_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScaleAnimation(
                  duration: const Duration(seconds: 2),
                  scaleFactor: 2.0,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/emoji.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const TextAnimation(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              data: 'Кириш',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              data: 'Катталуу',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
