import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // 🔝 PARTE SUPERIOR (30%)
          Container(
            height: size.height * 0.30,
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Image.asset('assets/Icon.png', width: 200, height: 200),
              ),
            ),
          ),

          // ⚪ PARTE INFERIOR (70%)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.white],
                  stops: [0.0, 0.15],
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 🌟 Cabeçalho
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.3,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'O app que conecta jogadores e peladas perto de você. ',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Bora Jogar?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.sports_soccer,
                                  size: 22,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Faça login ou crie sua conta e comece a jogar com a gente.',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(height: 12),

                    // Campos
                    _campoTexto('Email', 'Digite seu email'),
                    const SizedBox(height: 10),
                    _campoTexto('Senha', 'Digite sua senha', isSenha: true),

                    const SizedBox(height: 18),

                    // Botão Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Botão Criar Conta -> vai para CadastroPage
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Esqueceu sua Senha ?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 18),
                    _dividerContinue(),
                    const SizedBox(height: 18),
                    _botoesSociais(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Campo texto padrão
  Widget _campoTexto(String label, String hint, {bool isSenha = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isSenha,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            suffixIcon: isSenha
                ? const Icon(Icons.visibility_off_outlined)
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  // Divider
  Widget _dividerContinue() => Row(
    children: const [
      Expanded(child: Divider(thickness: 1, color: Colors.black26)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text('ou continue com', style: TextStyle(color: Colors.black54)),
      ),
      Expanded(child: Divider(thickness: 1, color: Colors.black26)),
    ],
  );

  // Botões Sociais
  Widget _botoesSociais() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _socialButton(FontAwesomeIcons.google, Colors.redAccent),
      const SizedBox(width: 20),
      _socialButton(FontAwesomeIcons.apple, Colors.black),
      const SizedBox(width: 20),
      _socialButton(FontAwesomeIcons.facebookF, Colors.blueAccent),
    ],
  );

  Widget _socialButton(IconData icon, Color color) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Center(child: FaIcon(icon, color: color, size: 26)),
      ),
    );
  }
}
