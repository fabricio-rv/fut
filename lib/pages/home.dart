import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 🔘 Widget auxiliar para os modos de jogo
class _gameModeTag extends StatelessWidget {
  final String text;
  const _gameModeTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/notificacoes');
        break;
      case 2:
        Navigator.pushNamed(context, '/meus_jogos');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔝 TOPO
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 26,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/chat_list_screen'),
                    ),
                    Image.asset('assets/Icon.png', height: 50),
                    IconButton(
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/perfil'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ⚽ SEÇÃO 1 – ENCONTRAR JOGADORES
              _sectionHeader(
                icon: Icons.sports_soccer,
                title: 'Encontrar Jogadores',
                onViewAll: () =>
                    Navigator.pushNamed(context, '/buscar_jogador'),
              ),

              // 🔝 BOTÃO “BUSCAR JOGADORES” (AGORA FORA DO CARD)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/buscar_jogador'),
                  icon: const Icon(Icons.sports_soccer, color: Colors.white),
                  label: const Text('Buscar Jogadores'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🏟️ CARD DE MODALIDADES E DESCRIÇÃO
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 🔘 MODALIDADES
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _gameModeTag('Futsal 5x5'),
                            _gameModeTag('Society 7x7'),
                            _gameModeTag('Campo 11x11'),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // ✍️ TEXTO DESCRITIVO
                        const Text(
                          'Alguém furou ou pipocou de última hora? '
                          'Coloque sua partida e as posições que faltam pra completar seu time!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ⚫ “BUSCANDO JOGADORES” BADGE
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Buscando jogadores',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🔍 SEÇÃO 2 – ENCONTRAR PARTIDA INDIVIDUAL
              _sectionHeader(
                icon: Icons.search,
                title: 'Encontrar Partida Individual',
                onViewAll: () =>
                    Navigator.pushNamed(context, '/encontrar_partida'),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/encontrar_partida'),
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text('Encontrar Partidas'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              _gameCard(
                'Futsal 5x5',
                'Arena Central',
                'Hoje - 19:00',
                '2 vagas restantes',
                'Futsal',
              ),
              _gameCard(
                'Society 7x7',
                'Campo do Parque',
                'Amanhã - 20:30',
                '5 vagas restantes',
                'Society',
              ),

              const SizedBox(height: 20),

              // 🏆 SEÇÃO 3 – ENCONTRAR TIME ADVERSÁRIO
              _sectionHeader(
                icon: Icons.emoji_events,
                title: 'Encontrar Time Adversário',
                onViewAll: () =>
                    Navigator.pushNamed(context, '/encontrar_time'),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/encontrar_time'),
                  icon: const Icon(Icons.emoji_events, color: Colors.white),
                  label: const Text('Procurar Adversário'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Cards iguais aos de partida individual (melhor estilo)
              _gameCard(
                'Time da Vila',
                'Campo da Praça',
                'Sábado - 17:00',
                'Society 7x7',
                'Buscando adversário',
              ),
              _gameCard(
                'Peladeiros FC',
                'Arena Leste',
                'Domingo - 15:30',
                'Futsal 5x5',
                'Querem jogo amistoso',
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ⬛ BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer_outlined),
            label: 'Jogos',
          ),
        ],
      ),
    );
  }

  // 🔹 HEADER DAS SEÇÕES
  Widget _sectionHeader({
    required IconData icon,
    required String title,
    required VoidCallback onViewAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.black87),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onViewAll,
            child: const Text(
              'Ver todas',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ⚽ CARD DE PARTIDA / TIME
  Widget _gameCard(
    String title,
    String location,
    String time,
    String spots,
    String type,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    location,
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
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.people_alt_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    spots,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      type,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
