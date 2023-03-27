import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatGptField extends StatelessWidget {
  String text;

  ChatGptField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff434654),
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
          horizontalTitleGap: .1,
          title: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                text,
                textStyle: TextStyle(color: Colors.grey.shade200),
                speed: const Duration(milliseconds: 40),
              ),
            ],
            totalRepeatCount: 1,
          ),
          leading: Image.asset(
            'assets/images/chat_gpt.png',
            height: 50,
            width: 80,
          )),
    );
  }
}
