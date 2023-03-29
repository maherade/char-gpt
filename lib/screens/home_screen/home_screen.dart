import 'package:chat_gpt/components/chat_gpt_field.dart';
import 'package:chat_gpt/components/user_chat_field.dart';
import 'package:chat_gpt/dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var textEditingController = TextEditingController();

  List<String> chat = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff343541),
        appBar: AppBar(
          backgroundColor: const Color(0xff343541),
          centerTitle: true,
          title: const Text('Chat GPT'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? UserField(
                          text: chat[index],
                        )
                      : ChatGptField(
                          text: chat[index],
                        );
                },
                itemCount: chat.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color(0xff434654),
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Ask Me What You Want...",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  )),
                  TextButton(
                      onPressed: () {
                        getChat();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.grey.shade200,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getChat() {
    if (textEditingController.text.isNotEmpty) {
      setState(() {
        chat.add(textEditingController.text);
      });
      DioHelper.postData(url: 'completions', data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": textEditingController.text}
        ],
        "temperature": 0.7,
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            chat.add(value.data["choices"][0]["message"]["content"]);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value.statusMessage.toString())));
        }
      });
      textEditingController.clear();
    } else {}
  }
}
