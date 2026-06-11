// import 'package:flutter/material.dart';
// import 'package:masterchief_cv/models/project_detail.dart';
// import 'package:masterchief_cv/widgets/animated_orbit_widget.dart';
// import 'package:masterchief_cv/widgets/footer.dart';
// import 'package:masterchief_cv/widgets/project_section.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // Hero Header Section
//           const SliverToBoxAdapter(child: _HeroHeader()),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),

//           // Engineering & Innovation Section
//           SliverToBoxAdapter(
//             child: ProjectSection(
//               title: 'Engineering & Innovation',
//               subtitle: 'Research & Development',
//               icon: Icons.science,
//               gradientColors: const [Color(0xFF667EEA), Color(0xFF764BA2)],
//               projects: const [
//                 ProjectDetail(
//                   title: 'AI-Powered Code Assistant',
//                   description:
//                       'Developed an ML model that suggests code optimizations and catches bugs in real-time.',
//                   technologies: ['TensorFlow', 'Python', 'Flask'],
//                   icon: Icons.auto_awesome,
//                   imageUrl: 'assets/images/cortana.jpg',
//                 ),
//                 ProjectDetail(
//                   title: 'IoT Smart Home Hub',
//                   description:
//                       'Created a centralized platform controlling 50+ smart devices with predictive automation.',
//                   technologies: ['Raspberry Pi', 'MQTT', 'Flutter'],
//                   icon: Icons.home,
//                 ),
//               ],
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),

//           // Interactive Entertainment Section
//           SliverToBoxAdapter(
//             child: ProjectSection(
//               title: 'Interactive Entertainment',
//               subtitle: 'Game Development',
//               icon: Icons.games,
//               gradientColors: const [Color(0xFFF093FB), Color(0xFFF5576C)],
//               projects: const [
//                 ProjectDetail(
//                   title: 'Space Explorer RPG',
//                   description:
//                       'A procedurally generated space exploration game with 50K+ downloads on itch.io.',
//                   technologies: ['Unity', 'C#', 'Blender'],
//                   icon: Icons.explore,
//                 ),
//                 ProjectDetail(
//                   title: 'Puzzle Platformer',
//                   description:
//                       'Award-winning puzzle game featured in Indie Game Festival 2024.',
//                   technologies: ['Godot', 'GDScript', 'Aseprite'],
//                   icon: Icons.gamepad,
//                 ),
//                 ProjectDetail(
//                   title: 'Arcade Racing Game',
//                   description:
//                       'Fast-paced racing game with multiplayer support.',
//                   technologies: ['Unreal', 'C++', 'Blueprint'],
//                   icon: Icons.speed,
//                 ),
//               ],
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),

//           // Digital Products Section
//           SliverToBoxAdapter(
//             child: ProjectSection(
//               title: 'Digital Products',
//               subtitle: 'Web & App Development',
//               icon: Icons.apps,
//               gradientColors: const [Color(0xFF4FACFE), Color(0xFF00F2FE)],
//               projects: const [
//                 ProjectDetail(
//                   title: 'E-Commerce Platform',
//                   description:
//                       'Full-stack marketplace with 10K+ monthly users.',
//                   technologies: ['Flutter', 'Firebase', 'Stripe'],
//                   icon: Icons.shopping_cart,
//                 ),
//                 ProjectDetail(
//                   title: 'Task Management Suite',
//                   description: 'Productivity app used by 500+ teams worldwide.',
//                   technologies: ['React', 'Node.js', 'MongoDB'],
//                   icon: Icons.task,
//                 ),
//                 ProjectDetail(
//                   title: 'Social Media Dashboard',
//                   description: 'Analytics platform for content creators.',
//                   technologies: ['Flutter', 'Supabase', 'Chart.js'],
//                   icon: Icons.dashboard,
//                 ),
//               ],
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),

//           // Social Impact Section
//           SliverToBoxAdapter(
//             child: ProjectSection(
//               title: 'Social Impact',
//               subtitle: 'Community Work & Non-Profit',
//               icon: Icons.favorite,
//               gradientColors: const [Color(0xFFFA709A), Color(0xFFFEE140)],
//               projects: const [
//                 ProjectDetail(
//                   title: 'Pawsitive Connect',
//                   description:
//                       'A platform connecting animal shelters with adopters, featuring 200+ successful adoptions.',
//                   technologies: ['Flutter', 'Firebase', 'Google Maps API'],
//                   icon: Icons.pets,
//                 ),
//                 ProjectDetail(
//                   title: 'Code for Good Initiative',
//                   description:
//                       'Mentored 50+ aspiring developers through free coding workshops in underserved communities.',
//                   technologies: [
//                     'Teaching',
//                     'Curriculum Design',
//                     'Open Source',
//                   ],
//                   icon: Icons.school,
//                 ),
//                 ProjectDetail(
//                   title: 'Food Rescue App',
//                   description:
//                       'Connecting restaurants with food banks to reduce waste.',
//                   technologies: ['React Native', 'Node.js', 'Twilio'],
//                   icon: Icons.restaurant,
//                 ),
//               ],
//             ),
//           ),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),

//           // Footer
//           const SliverToBoxAdapter(child: Footer()),

//           const SliverToBoxAdapter(child: SizedBox(height: 40)),
//         ],
//       ),
//     );
//   }
// }

// class _HeroHeader extends StatelessWidget {
//   const _HeroHeader();

//   @override
//   Widget build(BuildContext context) {
//     return const AnimatedOrbitWidget();
//   }
// }
