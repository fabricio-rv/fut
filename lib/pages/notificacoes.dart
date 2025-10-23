import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notificacoes = [
      {
        'tipo': 'partida',
        'titulo': 'Você tem uma partida hoje!',
        'descricao': 'Arena Central - 19:00h. Clique para visualizar detalhes.',
        'icone': Icons.sports_soccer,
        'hora': 'Há 2h',
        'cor': Colors.greenAccent,
      },
      {
        'tipo': 'presenca',
        'titulo': 'João marcou presença no seu jogo!',
        'descricao': 'Posição: Goleiro — Society 7x7 • Campo do Parque.',
        'icone': Icons.check_circle_outline,
        'hora': 'Há 3h',
        'cor': Colors.blueAccent,
      },
      {
        'tipo': 'desafio',
        'titulo': 'Time da Vila aceitou seu desafio!',
        'descricao': 'A partida será agendada para sábado às 17:00h.',
        'icone': Icons.emoji_events_outlined,
        'hora': 'Ontem',
        'cor': Colors.orangeAccent,
      },
      {
        'tipo': 'jogador',
        'titulo': 'Pedro quer entrar na sua pelada!',
        'descricao': 'Faltam 2 vagas para completar o time Futsal 5x5.',
        'icone': Icons.person_add_alt_1_outlined,
        'hora': 'Ontem',
        'cor': Colors.purpleAccent,
      },
      {
        'tipo': 'alerta',
        'titulo': 'Chuva prevista no horário da sua partida',
        'descricao': 'Recomenda-se confirmar com o local antes de sair.',
        'icone': Icons.warning_amber_rounded,
        'hora': 'Há 1 dia',
        'cor': Colors.redAccent,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Notificações",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notificacoes.length,
        itemBuilder: (context, index) {
          final item = notificacoes[index];
          return _notificacaoCard(
            icone: item['icone'],
            corIcone: item['cor'],
            titulo: item['titulo'],
            descricao: item['descricao'],
            hora: item['hora'],
            onTap: () {
              // Ações específicas no futuro
            },
          );
        },
      ),
    );
  }

  Widget _notificacaoCard({
    required IconData icone,
    required Color corIcone,
    required String titulo,
    required String descricao,
    required String hora,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔔 Ícone lateral
            Container(
              decoration: BoxDecoration(
                color: corIcone.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icone, color: corIcone, size: 26),
            ),
            const SizedBox(width: 14),

            // 📜 Texto e detalhes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descricao,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    hora,
                    style: const TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
