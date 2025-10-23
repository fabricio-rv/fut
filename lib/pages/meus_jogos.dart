import 'package:flutter/material.dart';

class MeusJogosPage extends StatefulWidget {
  const MeusJogosPage({super.key});

  @override
  State<MeusJogosPage> createState() => _MeusJogosPageState();
}

class _MeusJogosPageState extends State<MeusJogosPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> partidasAtivas = [
    {
      'tipo': 'time_x_time',
      'titulo': 'Time da Vila x Peladeiros FC',
      'local': 'Arena Central',
      'horario': 'Hoje - 19:00',
      'status': 'Confirmado',
      'detalhe': 'Partida oficial marcada',
      'icone': Icons.emoji_events_outlined,
    },
    {
      'tipo': 'host',
      'titulo': 'Society 7x7 - Campo do Parque',
      'local': 'Campo do Parque',
      'horario': 'Amanhã - 20:30',
      'status': 'Buscando jogadores',
      'vagasRestantes': 3,
      'marcados': 7,
      'icone': Icons.sports_soccer,
    },
    {
      'tipo': 'jogador',
      'titulo': 'Futsal 5x5 - Arena City',
      'local': 'Arena City',
      'horario': 'Sexta - 21:00',
      'status': 'Você marcou presença',
      'posicao': 'Zagueiro',
      'icone': Icons.person_pin_circle_outlined,
    },
  ];

  final List<Map<String, dynamic>> partidasEncerradas = [
    {
      'tipo': 'time_x_time',
      'titulo': 'Time da Vila x Real Pirituba',
      'local': 'Quadra da Vila',
      'horario': 'Dom - 17:00',
      'resultado': '3 x 2',
      'icone': Icons.emoji_events,
    },
    {
      'tipo': 'jogador',
      'titulo': 'Peladeiros FC - Futsal 5x5',
      'local': 'Arena City',
      'horario': 'Ontem - 20:00',
      'status': 'Você jogou como Meia',
      'icone': Icons.person,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Meus Jogos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: Column(
        children: [
          // 🟢 Abas
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              indicatorWeight: 2,
              tabs: const [
                Tab(text: "Partidas Ativas"),
                Tab(text: "Partidas Encerradas"),
              ],
            ),
          ),

          // 🏆 Conteúdo das Abas
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPartidasList(partidasAtivas, isEncerrada: false),
                _buildPartidasList(partidasEncerradas, isEncerrada: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartidasList(
    List<Map<String, dynamic>> lista, {
    required bool isEncerrada,
  }) {
    if (lista.isEmpty) {
      return const Center(
        child: Text(
          "Nenhuma partida encontrada.",
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final partida = lista[index];
        return _buildPartidaCard(partida, isEncerrada);
      },
    );
  }

  Widget _buildPartidaCard(Map<String, dynamic> partida, bool isEncerrada) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔝 Cabeçalho
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(partida['icone'], color: Colors.black87, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  partida['titulo'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 🏟️ Informações principais
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text(
                partida['local'] ?? '',
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                size: 16,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              Text(
                partida['horario'] ?? '',
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 🧾 Detalhes adicionais dinâmicos
          if (partida['tipo'] == 'host') ...[
            Text(
              "Status: ${partida['status']}",
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Jogadores confirmados: ${partida['marcados']}/10",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            Text(
              "Vagas restantes: ${partida['vagasRestantes']}",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ] else if (partida['tipo'] == 'host') ...[
            Text(
              "Status: ${partida['status'] ?? '-'}",
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Jogadores confirmados: ${partida['marcados'] ?? 0}/10",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            Text(
              "Vagas restantes: ${partida['vagasRestantes'] ?? 0}",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ] else if (partida['tipo'] == 'jogador') ...[
            Text(
              partida['status'] ?? 'Sem status definido',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              "Posição: ${partida['posicao'] ?? '-'}",
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ] else if (partida['tipo'] == 'time_x_time') ...[
            Text(
              "Status: ${partida['status'] ?? 'Encerrado'}",
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
            Text(
              partida['detalhe'] ?? '',
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ],

          if (isEncerrada && partida.containsKey('resultado')) ...[
            const SizedBox(height: 8),
            Text(
              "Resultado: ${partida['resultado']}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],

          const SizedBox(height: 10),
          // 🔘 Botão Ação
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isEncerrada ? "Ver detalhes" : "Ver partida",
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
