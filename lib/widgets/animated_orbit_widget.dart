import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masterchief_cv/main.dart';
import 'package:masterchief_cv/models/planet_data.dart';

class AnimatedOrbitWidget extends StatefulWidget {
  const AnimatedOrbitWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedOrbitWidgetState();
}

class _AnimatedOrbitWidgetState extends State<AnimatedOrbitWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _starfieldController;

  bool _showDetailView = false;

  late AnimationController _transitionController;
  late Animation<double> _zoomAnimation;

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

    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _transitionController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _starfieldController.dispose();
    _transitionController.dispose();

    super.dispose();
  }

  void _displayDetailView() {
    setState(() {
      _showDetailView = true;
    });
    _transitionController.forward();
  }

  void _hideDetailView() {
    _transitionController.reverse().then((_) {
      setState(() {
        _showDetailView = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final centerX = screenSize.width / 2;
    final centerY = screenSize.height / 2;

    return AnimatedBuilder(
      animation: _starfieldController,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
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
              ..._buildStarfield(screenSize),
              ..._buildGlowingStars(screenSize),

              if (!_showDetailView) ...[
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
                ..._buildOrbitingPlanets(screenSize, centerX, centerY),
              ],

              // Center Star with zoom animation
              AnimatedBuilder(
                animation: _transitionController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _zoomAnimation.value,
                    child: Stack(
                      children: [
                        // Main star content
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: _displayDetailView,
                                  child: Hero(
                                    tag: 'avatar',
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.yellow.shade300,
                                          width: 6,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.orange.opaque(0.5),
                                            blurRadius: 50,
                                            spreadRadius: 20,
                                          ),
                                          BoxShadow(
                                            color: Colors.yellow.opaque(0.3),
                                            blurRadius: 80,
                                            spreadRadius: 30,
                                          ),
                                        ],
                                        gradient: const RadialGradient(
                                          colors: [
                                            Colors.yellow,
                                            Colors.orange,
                                            Colors.red,
                                          ],
                                          stops: [0.3, 0.7, 1.0],
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: screenSize.width * 0.06,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (!_showDetailView) ...[
                                const SizedBox(height: 16),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: _displayDetailView,
                                    child: const Text(
                                      'MasterChief',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 15,
                                            color: Colors.orange,
                                            offset: Offset(0, 0),
                                          ),
                                          Shadow(
                                            blurRadius: 30,
                                            color: Colors.red,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: _displayDetailView,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.opaque(0.15),
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                          color: Colors.white.opaque(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Text(
                                        'Creative Technologist & Full-Stack Developer',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Detail panel (slides in from left)
              if (_showDetailView) _buildDetailPanel(screenSize),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailPanel(Size screenSize) {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: AnimatedBuilder(
        animation: _transitionController,
        builder: (context, child) {
          final slideAnimation = Tween<double>(begin: -screenSize.width, end: 0)
              .animate(
                CurvedAnimation(
                  parent: _transitionController,
                  curve: Curves.easeOutCubic,
                ),
              );

          return Transform.translate(
            offset: Offset(slideAnimation.value, 0),
            child: Container(
              width: screenSize.width / 2,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF1A003D),
                    Color(0xFF0A0015),
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.7, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.opaque(0.5),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Close button
                      Align(
                        alignment: Alignment.topRight,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: _hideDetailView,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.opaque(0.1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.opaque(0.2),
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18, // Smaller icon
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Reduced spacing
                      // Name
                      const Text(
                        'MasterChief',
                        style: TextStyle(
                          fontSize: 28, // Reduced from 42
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5, // Reduced
                        ),
                      ),
                      const SizedBox(height: 8), // Reduced
                      // Divider
                      Container(
                        width: 40, // Reduced from 60
                        height: 2, // Reduced from 3
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.orange, Colors.yellow],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 16), // Reduced from 20
                      // Title
                      const Text(
                        'Creative Technologist & Full-Stack Developer',
                        style: TextStyle(
                          fontSize: 14, // Reduced from 20
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3, // Reduced
                        ),
                      ),
                      const SizedBox(height: 20), // Reduced from 32
                      // Main content card
                      Container(
                        padding: const EdgeInsets.all(16), // Reduced from 24
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade900.opaque(0.8),
                              Colors.purple.shade900.opaque(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // Reduced from 24
                          border: Border.all(color: Colors.white.opaque(0.2)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Let's Build Something Amazing Together",
                              style: TextStyle(
                                fontSize: 16, // Reduced from 22
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12), // Reduced from 16
                            const Text(
                              'Open for collaborations, freelance work, and innovative projects',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12, // Reduced from 14
                                height: 1.4, // Reduced from 1.5
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16), // Reduced from 24
                            // Contact chips
                            Wrap(
                              spacing: 8, // Reduced from 12
                              runSpacing: 8, // Reduced from 12
                              alignment: WrapAlignment.center,
                              children: [
                                _buildContactChip(
                                  Icons.email,
                                  'bgamer9999.b9@gmail.com',
                                ),
                                _buildContactChip(
                                  Icons.phone,
                                  '+39 348 893 6829',
                                ),
                                _buildContactChip(
                                  Icons.location_on,
                                  'Nuvolera, BS',
                                ),
                                _buildContactChip(
                                  Icons.code,
                                  'github.com/M4st3rChief-S117',
                                ),
                              ],
                            ),
                            const SizedBox(height: 16), // Reduced from 24
                            // Social circles
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialCircle(Icons.android),
                                const SizedBox(width: 12), // Reduced from 16
                                _buildSocialCircle(Icons.link),
                                const SizedBox(width: 12), // Reduced from 16
                                _buildSocialCircle(Icons.alternate_email),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Updated contact chip with smaller size
  Widget _buildContactChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white.opaque(0.1),
        borderRadius: BorderRadius.circular(16), // Reduced from 20
        border: Border.all(color: Colors.white.opaque(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white70), // Reduced from 16
          const SizedBox(width: 4), // Reduced from 6
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ), // Reduced from 12
          ),
        ],
      ),
    );
  }

  // Updated social circle with smaller size
  Widget _buildSocialCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8), // Reduced from 10
      decoration: BoxDecoration(
        color: Colors.white.opaque(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.opaque(0.3)),
      ),
      child: Icon(icon, color: Colors.white70, size: 20), // Reduced from 24
    );
  }

  List<Widget> _buildStarfield(Size screenSize) {
    final stars = <Widget>[];
    final random = Random(42);

    for (int i = 0; i < 200; i++) {
      stars.add(
        Positioned(
          left: random.nextDouble() * screenSize.width,
          top: random.nextDouble() * screenSize.height,
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

  List<Widget> _buildGlowingStars(Size screenSize) {
    final stars = <Widget>[];
    final random = Random(73);

    for (int i = 0; i < 30; i++) {
      stars.add(
        Positioned(
          left: random.nextDouble() * screenSize.width,
          top: random.nextDouble() * screenSize.height,
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.opaque(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.opaque(0.6),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return stars;
  }

  List<Widget> _buildOrbitingPlanets(
    Size screenSize,
    double centerX,
    double centerY,
  ) {
    final screenSize = MediaQuery.of(context).size;
    final baseRadius = screenSize.width / 3.5;

    final planets = [
      PlanetData(
        radiusX: baseRadius * 0.6, // Horizontal radius - wider
        radiusY: baseRadius * 0.3, // Vertical radius - closer
        size: screenSize.width * 0.05,
        color: Colors.red.shade500,
        speed: 8000,
        name: 'Engineering',
        icon: Icons.science,
      ),
      PlanetData(
        radiusX: baseRadius * 0.8, // Horizontal radius - wider
        radiusY: baseRadius * 0.4, // Vertical radius - closer
        size: screenSize.width * 0.06,
        color: Colors.blue.shade500,
        speed: 6000,
        name: 'Entertainment',
        icon: Icons.games,
      ),
      PlanetData(
        radiusX: baseRadius * 1.0, // Horizontal radius - wider
        radiusY: baseRadius * 0.5, // Vertical radius - closer
        size: screenSize.width * 0.06,
        color: Colors.orange.shade500,
        speed: 4000,
        name: 'Digital Products',
        icon: Icons.apps,
      ),
      PlanetData(
        radiusX: baseRadius * 1.3, // Horizontal radius - wider
        radiusY: baseRadius * 0.65, // Vertical radius - closer
        size: screenSize.width * 0.08,
        color: Colors.cyan.shade500,
        speed: 3000,
        name: 'Social Impact',
        icon: Icons.favorite,
      ),
    ];

    // // Build orbit paths first (so they appear behind planets)
    // final orbitPaths = planets.map((planet) {
    //   return CustomPaint(
    //     painter: EllipticalOrbitPainter(
    //       centerX: centerX + 50,
    //       centerY: centerY,
    //       radiusX: planet.radiusX,
    //       radiusY: planet.radiusY,
    //       color: planet.color.opaque(0.3),
    //     ),
    //   );
    // }).toList();

    // Build planets
    final planetWidgets = planets.asMap().entries.map((entry) {
      final index = entry.key;
      final planet = entry.value;

      return AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          final angle =
              (_controller.value * 2 * pi * planet.speed) + (index * pi / 2);
          final x = cos(angle) * planet.radiusX;
          final y = sin(angle) * planet.radiusY;

          return Positioned(
            left: centerX + 50 + x - planet.size / 2,
            top: centerY + y - planet.size / 2,
            child: InkWell(
              onTap: () {
                print('Tapped ${planet.name}');
              },
              child: Container(
                width: planet.size,
                height: planet.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      planet.color,
                      planet.color.opaque(0.6),
                      Colors.transparent,
                    ],
                    stops: const [0.5, 0.8, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: planet.color.opaque(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        planet.icon,
                        size: planet.size * 0.4,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        planet.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: planet.size * 0.12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }).toList();

    // Return both paths and planets
    return [
      // ...orbitPaths,
      ...planetWidgets,
    ];
  }
}
