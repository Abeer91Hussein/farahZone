import 'dart:async';

import 'package:flutter/material.dart';

// Uncomment these when your login/signup screens are ready.
import 'loginScreen.dart';
import 'signUpScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // =========================================================
  // COLORS
  // =========================================================

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  // =========================================================
  // BANNER
  // =========================================================

  final PageController _bannerController = PageController();

  int _currentBanner = 0;
  Timer? _bannerTimer;

  final List<String> _bannerImages = [
    'assets/images/مزايا.jpg',
    'assets/images/fourSesones.jpg',
    'assets/images/جلوريا.jpg',
  ];

  @override
  void initState() {
    super.initState();

    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted || !_bannerController.hasClients) {
        return;
      }

      int nextPage = _currentBanner + 1;

      if (nextPage >= _bannerImages.length) {
        nextPage = 0;
      }

      _bannerController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: gold, width: 1.2),
              ),
              child: const Text(
                'FZ',
                style: TextStyle(
                  color: navy,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 10),

            const Text(
              'FARAH ZONE',
              style: TextStyle(
                color: navy,
                fontSize: 18,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        actions: [
          // LOGIN
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: navy,
                side: const BorderSide(color: navy, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // SIGN UP
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navy,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: SingleChildScrollView(
        child: Column(
          children: [
            // =================================================
            // HERO
            // =================================================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 65),
              child: Column(
                children: [
                  const Text(
                    'Find the Perfect Place\nfor Your Perfect Day',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'LibertinusMath',
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      height: 1.15,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Discover beautiful wedding halls, compare venues, '
                    'and send your booking requests easily.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: navy.withOpacity(0.65),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),

            // =================================================
            // FARAH ZONE SERVICES BANNER
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 270,
                child: Stack(
                  children: [
                    // IMAGE SLIDER
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: PageView.builder(
                        controller: _bannerController,
                        itemCount: _bannerImages.length,

                        onPageChanged: (index) {
                          setState(() {
                            _currentBanner = index;
                          });
                        },

                        itemBuilder: (context, index) {
                          return Image.asset(
                            _bannerImages[index],
                            width: double.infinity,
                            height: 270,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),

                    // DARK OVERLAY
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black.withOpacity(0.35),
                        ),
                      ),
                    ),

                    // BANNER TEXT
                    Positioned(
                      left: 22,
                      right: 22,
                      bottom: 28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: gold,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'EXPLORE FARAH ZONE',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: navy,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Farah Zone Services',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Everything you need for your perfect event',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SLIDER INDICATORS
                    Positioned(
                      bottom: 12,
                      right: 22,
                      child: Row(
                        children: List.generate(_bannerImages.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(left: 5),
                            width: _currentBanner == index ? 18 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _currentBanner == index
                                  ? gold
                                  : Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // SPACE
            // =================================================
            const SizedBox(height: 75),

            // =================================================
            // HOW FARAH ZONE WORKS
            // =================================================
            Container(
              width: double.infinity,
              color: navy,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
              child: Column(
                children: [
                  const Text(
                    'How Farah Zone Works',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'LibertinusMath',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Plan your perfect day in three simple steps.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // RESPONSIVE CARDS
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Desktop / wide screen
                      if (constraints.maxWidth > 700) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildHowItWorksCard(
                                number: '01',
                                icon: Icons.search_outlined,
                                title: 'Discover',
                                description:
                                    'Explore venues and event options '
                                    'that match your celebration.',
                              ),
                            ),

                            _buildArrow(),

                            Expanded(
                              child: _buildHowItWorksCard(
                                number: '02',
                                icon: Icons.favorite_border,
                                title: 'Choose',
                                description:
                                    'Compare your favorite options '
                                    'and select the one you love.',
                              ),
                            ),

                            _buildArrow(),

                            Expanded(
                              child: _buildHowItWorksCard(
                                number: '03',
                                icon: Icons.celebration_outlined,
                                title: 'Celebrate',
                                description:
                                    'Send your request and take '
                                    'the next step toward your day.',
                              ),
                            ),
                          ],
                        );
                      }

                      // Mobile
                      return Column(
                        children: [
                          _buildHowItWorksCard(
                            number: '01',
                            icon: Icons.search_outlined,
                            title: 'Discover',
                            description:
                                'Explore venues and event options '
                                'that match your celebration.',
                          ),

                          const SizedBox(height: 18),

                          _buildMobileArrow(),

                          const SizedBox(height: 18),

                          _buildHowItWorksCard(
                            number: '02',
                            icon: Icons.favorite_border,
                            title: 'Choose',
                            description:
                                'Compare your favorite options '
                                'and select the one you love.',
                          ),

                          const SizedBox(height: 18),

                          _buildMobileArrow(),

                          const SizedBox(height: 18),

                          _buildHowItWorksCard(
                            number: '03',
                            icon: Icons.celebration_outlined,
                            title: 'Celebrate',
                            description:
                                'Send your request and take '
                                'the next step toward your day.',
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // =================================================
            // WHY FARAH ZONE
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
              child: Column(
                children: [
                  const Text(
                    'Why Plan With Farah Zone?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'LibertinusMath',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'A simpler way to plan something unforgettable.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: navy.withOpacity(0.6)),
                  ),

                  const SizedBox(height: 40),

                  // RESPONSIVE BENEFITS
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 650) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildBenefit(
                                Icons.grid_view_rounded,
                                'All in One',
                                'Venues and services gathered '
                                    'in one place.',
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: _buildBenefit(
                                Icons.touch_app_outlined,
                                'Easy Planning',
                                'Simple browsing and booking '
                                    'requests.',
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: _buildBenefit(
                                Icons.verified_outlined,
                                'Better Choices',
                                'Compare options before making '
                                    'your decision.',
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          _buildBenefit(
                            Icons.grid_view_rounded,
                            'All in One',
                            'Venues and services gathered '
                                'in one place.',
                          ),

                          const SizedBox(height: 35),

                          _buildBenefit(
                            Icons.touch_app_outlined,
                            'Easy Planning',
                            'Simple browsing and booking '
                                'requests.',
                          ),

                          const SizedBox(height: 35),

                          _buildBenefit(
                            Icons.verified_outlined,
                            'Better Choices',
                            'Compare options before making '
                                'your decision.',
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // =================================================
            // CONTACT US
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 45,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: navy.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.mail_outline, size: 40, color: gold),

                    const SizedBox(height: 15),

                    const Text(
                      'Have Questions?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'LibertinusMath',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: navy,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'We are here to help you find the perfect '
                      'venue for your special day.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.5,
                        color: navy.withOpacity(0.65),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // CONTACT ACTION HERE
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'CONTACT WITH US',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // FOOTER
            // =================================================
            const SizedBox(height: 50),

            Text(
              'FARAH ZONE',
              style: TextStyle(
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: navy.withOpacity(0.65),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Find. Request. Celebrate.',
              style: TextStyle(
                fontFamily: 'LibertinusMath',
                fontStyle: FontStyle.italic,
                color: navy.withOpacity(0.5),
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // HOW IT WORKS CARD
  // =========================================================

  Widget _buildHowItWorksCard({
    required String number,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: gold.withOpacity(0.35), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 58,
                height: 58,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: gold, width: 1.5),
                ),
                child: Icon(icon, color: gold, size: 25),
              ),

              Text(
                number,
                style: TextStyle(
                  color: gold.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'LibertinusMath',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              height: 1.5,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // DESKTOP ARROW
  // =========================================================

  Widget _buildArrow() {
    return SizedBox(
      width: 55,
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Icon(
          Icons.arrow_forward,
          color: gold.withOpacity(0.65),
          size: 25,
        ),
      ),
    );
  }

  // =========================================================
  // MOBILE ARROW
  // =========================================================

  Widget _buildMobileArrow() {
    return Icon(
      Icons.keyboard_arrow_down_rounded,
      color: gold.withOpacity(0.65),
      size: 28,
    );
  }

  // =========================================================
  // BENEFIT
  // =========================================================

  Widget _buildBenefit(IconData icon, String title, String description) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: gold.withOpacity(0.12),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon, color: gold, size: 29),
        ),

        const SizedBox(height: 15),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: navy,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: navy.withOpacity(0.6),
            height: 1.5,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
