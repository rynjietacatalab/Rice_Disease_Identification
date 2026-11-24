
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryGreen = Color(0xFF256B45);
  static const Color lightGreen = Color(0xFFEAF4EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.eco,
                      color: primaryGreen,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RiceCare',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        ),
                        Text(
                          'Rice Plant Health Assistant',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // WELCOME
              const Text(
                'Healthy Rice,\nBetter Harvest.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Color(0xFF183D2A),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Monitor your rice plants and identify '
                    'supported plant stresses using '
                    'image-based analysis.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF647067),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // MAIN SCAN CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white,
                      size: 48,
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Check Your Rice Plant',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Capture or upload a photo to '
                          'check for supported rice plant stresses.',
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/scan',
                          );
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text('Scan Rice Plant'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryGreen,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'How It Works',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF183D2A),
                ),
              ),

              const SizedBox(height: 18),

              const _FeatureTile(
                icon: Icons.add_a_photo_outlined,
                title: '1. Capture an Image',
                subtitle: 'Take a photo or select one from your gallery.',
              ),

              const _FeatureTile(
                icon: Icons.psychology_outlined,
                title: '2. Analyze the Plant',
                subtitle: 'The trained model examines visual symptoms.',
              ),

              const _FeatureTile(
                icon: Icons.menu_book_outlined,
                title: '3. View Recommendations',
                subtitle: 'Read verified management guidance.',
              ),

              const SizedBox(height: 20),

              // DEVELOPMENT STATUS
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: primaryGreen),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Prototype mode: AI classification '
                            'is not yet integrated.',
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// REUSABLE FEATURE TILE
class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: HomeScreen.lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: HomeScreen.primaryGreen,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
