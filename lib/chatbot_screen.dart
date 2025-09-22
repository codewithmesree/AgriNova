import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'AgriNova Assistant',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // AgriNova Assistant's initial message
                _buildMessageBubble(
                  message: 'Hello, farmer! How can I assist you today?',
                  isUser: false,
                  avatar: const CircleAvatar(backgroundImage: AssetImage('assets/chatbot_avatar.png')), // Using local asset for chatbot avatar
                ),
                const SizedBox(height: 10),
                // User's message example
                _buildMessageBubble(
                  message: 'What crops are best suited for my soil type?',
                  isUser: true,
                  avatar: const CircleAvatar(backgroundImage: AssetImage('assets/user_avatar.png')), // Using local asset for user avatar
                ),
                const SizedBox(height: 10),
                // AgriNova Assistant's response example
                _buildMessageBubble(
                  message: 'To recommend the best crops, I need some information about your soil. Can you tell me the soil type or provide a soil sample image?',
                  isUser: false,
                  avatar: const CircleAvatar(backgroundImage: AssetImage('assets/chatbot_avatar.png')), // Using local asset for chatbot avatar
                ),
              ],
            ),
          ),
          // Message input area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your question...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.green.shade50,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.green.shade50,
                  child: IconButton(
                    icon: const Icon(Icons.mic_none, color: Colors.black54),
                    onPressed: () {
                      // TODO: Implement voice input
                    },
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.green.shade50,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt_outlined, color: Colors.black54),
                    onPressed: () {
                      // TODO: Implement image input
                    },
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    // TODO: Implement send message
                  },
                  backgroundColor: Colors.green,
                  mini: true,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required bool isUser,
    required CircleAvatar avatar,
  }) {
    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isUser) avatar, // Chatbot avatar on the left
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: isUser ? Colors.green : Colors.green.shade50,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: isUser ? const Radius.circular(15) : const Radius.circular(0),
                bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(15),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: isUser ? Colors.white : Colors.black87),
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (isUser) avatar, // User avatar on the right
      ],
    );
  }
}
