import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr.Kapil Narwani"),
        actions: [
          Icon(Icons.video_call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.phone),
          SizedBox(
            width: 10,
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text("New Group")),
                    PopupMenuItem(value: 2, child: Text("Setting")),
                    PopupMenuItem(value: 3, child: Text("Logout"))
                  ])
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 480,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 218, 217, 217),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.emoji_emotions),
                  suffixIcon: Icon(Icons.send),
                  hintText: "Message"),
            ),
          )
        ],
      ),
    );
  }
}
