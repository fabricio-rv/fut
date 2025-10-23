import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        title: const Text(
          "Conversas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _chatTile(
            context,
            name: "Lucas Oliveira",
            message: "E aí, viu o jogo ontem?",
            time: "10:30",
            avatar: "assets/teste.png",
          ),
          _chatTile(
            context,
            name: "Time da Vila",
            message: "Sábado às 17h tá confirmado?",
            time: "Ontem",
            avatar: "assets/teste.png",
          ),
          _chatTile(
            context,
            name: "Peladeiros FC",
            message: "Partida marcada pra domingo!",
            time: "2 dias atrás",
            avatar: "assets/teste.png",
          ),
        ],
      ),
    );
  }

  Widget _chatTile(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    required String avatar,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(avatar), radius: 26),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(color: Colors.black54),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.black45, fontSize: 12),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(userName: name, avatar: avatar),
            ),
          );
        },
      ),
    );
  }
}
