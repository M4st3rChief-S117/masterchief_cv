import 'package:flutter/material.dart';
import 'package:masterchief_cv/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Header Section
          SliverToBoxAdapter(child: _buildHeroHeader()),

          // Engineering & Innovation (Research & dev)
          SliverToBoxAdapter(child: _buildEngineeringSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Interactive Entertainment (Game Dev)
          SliverToBoxAdapter(child: _buildGameDevSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Digital Products (Web & App)
          SliverToBoxAdapter(child: _buildDigitalProductsSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Social Impact (Community Work)
          SliverToBoxAdapter(child: _buildSocialImpactSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // Skills & Contact Footer
          SliverToBoxAdapter(child: _buildFooter()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.purple.shade800,
            Colors.deepPurple.shade900,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background circles
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.opaque(0.05),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.opaque(0.05),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'avatar',
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.opaque(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 70, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'MasterChief',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.opaque(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Creativ Technologist & Full-Stack Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.code, '5+ Years'),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.rocket_launch, '12 Projects'),
                    const SizedBox(width: 20),
                    _buildSocialIcon(Icons.people, '50+ Clients'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.opaque(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildEngineeringSection() {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 24));
  }
}
