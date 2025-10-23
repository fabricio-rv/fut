import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // TOPO
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

          // CORPO
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
                    Row(
                      children: const [
                        Text(
                          'Crie sua Conta',
                          style: TextStyle(
                            fontSize: 22,
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
                    const SizedBox(height: 8),
                    const Text(
                      'Preencha os campos abaixo para começar a jogar com a gente.',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(height: 8),

                    _campoTexto('Email', 'Digite seu email'),
                    const SizedBox(height: 8),
                    _campoTexto('Senha', 'Digite sua senha', isSenha: true),
                    const SizedBox(height: 8),
                    _campoTexto(
                      'Confirmar Senha',
                      'Confirme sua senha',
                      isSenha: true,
                    ),

                    const SizedBox(height: 16),

                    // Criar Conta
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Voltar ao Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Voltar ao Login',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _dividerContinue(),
                    const SizedBox(height: 10),
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

  // REUSO
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
