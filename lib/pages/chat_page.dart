import 'package:flutter/material.dart';
import 'package:store_app/pages/chat_messages_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: const SizedBox(),
        title: const Text(
          "Chat",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatMessagesPage()));
            },
            child: Card(
              margin: const EdgeInsets.all(20),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/images/avatar.jpg")),
                title: Text(
                  "Angie Brekke",
                  style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                ),
                trailing: const Icon(Icons.message_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }
}
