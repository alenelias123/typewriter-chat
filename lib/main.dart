import 'package:flutter/material.dart';

void main() {
  runApp(TypewriterChatApp());
}

class TypewriterChatApp extends StatelessWidget {
  const TypewriterChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typewriter Chat',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = []; // List to store messages
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Typewriter Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    // Ensure no backspace behavior
                    if (value.length < controller.text.length) {
                      controller.text = controller.text;
                    }
                  },
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        messages.add(value);
                        controller.clear();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      messages.add(controller.text);
                      controller.clear();
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
