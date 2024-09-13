import 'package:flutter/material.dart';

class ChatMessagesPage extends StatelessWidget {
  const ChatMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.red,
                    ),
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/avatar.jpg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Angie Brekke",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "main_font",
                                letterSpacing: 1),
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "main_font",
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.red,
                      ),
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Today"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _textMessageBox(isUser: true, text: "Hi, How are You?"),
                    _textMessageBox(
                        isUser: false,
                        text: "I'm good bro, how can I help you?"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textMessageBox({required bool isUser, required String text}) => Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: isUser
            ? const EdgeInsets.only(left: 100, right: 20)
            : const EdgeInsets.only(left: 20, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isUser ? Colors.red[800] : Colors.white,
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: isUser ? Colors.grey[50] : Colors.grey[800],
                    fontSize: 14,
                    fontFamily: "main_font",
                    letterSpacing: 1),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    isUser
                        ? "assets/images/profile-picture.jpeg"
                        : "assets/images/avatar.jpg",
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  isUser ? "You" : "Angie Brekk",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
                const Spacer(),
                Text(
                  "7:05 pm",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                )
              ],
            )
          ],
        ),
      );
}
