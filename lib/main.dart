import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/cadastro.dart';
import 'pages/home.dart';
import 'pages/chat_list_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/perfil.dart';
import 'pages/notificacoes.dart';
import 'pages/meus_jogos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fut Atual',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const CadastroPage(),
        '/home': (context) => const HomePage(),
        '/chat_list_screen': (context) => const ChatListScreen(),
        '/chat_screen': (context) =>
            const ChatScreen(userName: 'Usuário', avatar: 'assets/teste.png'),
        '/perfil': (context) => const PerfilPage(),
        '/notificacoes': (context) => const NotificacoesPage(),
        '/meus_jogos': (context) => const MeusJogosPage(),
      },
    );
  }
}
