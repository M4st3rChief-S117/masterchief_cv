import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masterchief_cv/main.dart';
import 'package:masterchief_cv/models/planated_data.dart';

class AnimatedOrbitWidget extends StatefulWidget {
  const AnimatedOrbitWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedOrbitWidgetState();
}

class _AnimatedOrbitWidgetState extends State<AnimatedOrbitWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _starfieldController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(days: 1),
      vsync: this,
    )..repeat();

    _starfieldController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _starfieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _starfieldController,
      builder: (context, child) {
        return Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(
                  Colors.blue.shade900,
                  Colors.purple.shade800,
                  _starfieldController.value,
                )!,
                const Color(0xFF1A003D),
                const Color(0xFF000008),
              ],
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
          child: Stack(
            children: [
              ..._buildStarfield(),

              ..._buildGlowingStars(),
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

              ..._buildOrbitingPlanets(),
              // Center Star
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'avatar',
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.yellow.shade300,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.opaque(0.5),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                          gradient: RadialGradient(
                            colors: [
                              Colors.yellow.shade300,
                              Colors.orange.shade700,
                              Colors.red.shade900,
                            ],
                            stops: const [0.3, 0.7, 1.0],
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.transparent,
                          // child: Icon(Icons.star, size: 50, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'MasterChief',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.orange,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
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
                        'Creative Technologist & Full-Stack Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildStarfield() {
    final stars = <Widget>[];
    final random = Random(42);

    for (int i = 0; i < 150; i++) {
      stars.add(
        Positioned(
          left: random.nextDouble() * MediaQuery.of(context).size.width,
          top: random.nextDouble() * 500,
          child: Container(
            width: random.nextDouble() * 2 + 0.5,
            height: random.nextDouble() * 2 + 0.5,
            decoration: BoxDecoration(
              color: Colors.white.opaque(random.nextDouble() * 0.5 + 0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return stars;
  }

  List<Widget> _buildGlowingStars() {
    final stars = <Widget>[];
    final random = Random(73);

    for (int i = 0; i < 20; i++) {
      stars.add(
        Positioned(
          left: random.nextDouble() * MediaQuery.of(context).size.width,
          top: random.nextDouble() * 500,
          child: Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white.opaque(0.8),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.opaque(0.5),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return stars;
  }

  List<Widget> _buildOrbitingPlanets() {
    final planets = [
      PlanetData(
        radius: 130,
        size: 20,
        color: Colors.red.shade400,
        speed: 8000,
        name: 'Mars',
      ),
      PlanetData(
        radius: 160,
        size: 28,
        color: Colors.blue.shade400,
        speed: 6000,
        name: 'Earth',
      ),
      PlanetData(
        radius: 200,
        size: 35,
        color: Colors.orange.shade400,
        speed: 4000,
        name: 'Jupiter',
      ),
      PlanetData(
        radius: 240,
        size: 24,
        color: Colors.cyan.shade400,
        speed: 3000,
        name: 'Neptune',
      ),
    ];

    return planets.asMap().entries.map((entry) {
      final index = entry.key;
      final planet = entry.value;

      return AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          // Calculate angle - now using speed multiplier
          // _controller.value goes from 0 to 1 over 365 days
          // Multiply by 2π and speed to get reasonable orbit rates
          final angle =
              (_controller.value * 2 * pi * planet.speed) + (index * pi / 2);
          final x = cos(angle) * planet.radius;
          final y = sin(angle) * planet.radius;

          return Positioned(
            left: MediaQuery.of(context).size.width / 2 + x - planet.size / 2,
            top: 250 + y - planet.size / 2,
            child: Container(
              width: planet.size,
              height: planet.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: planet.color,
                boxShadow: [
                  BoxShadow(
                    color: planet.color.opaque(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  planet.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }).toList();
  }
}
