import 'dart:async';

import 'package:flutter/material.dart';

import 'loginScreen.dart';
import 'signUpScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // =========================================================
  // BRAND COLORS
  // =========================================================

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  // =========================================================
  // HERO SLIDER
  // =========================================================

  final PageController _heroController = PageController();

  Timer? _heroTimer;

  int _currentHero = 0;

  final List<String> _heroImages = [
    'assets/images/مزايا.jpg',
    'assets/images/fourSesones.jpg',
    'assets/images/جلوريا.jpg',
  ];

  final List<String> _heroTitles = [
    'وين تبدأ حكايتك؟',
    'خلّي يومك يشبهك',
    'لأن أجمل اللحظات تستحق مكاناً استثنائياً',
  ];

  // =========================================================
  // CATEGORIES
  // =========================================================

  final List<Map<String, String>> _categories = [
    {
      'image': 'assets/images/fourSesones.jpg',
      'title': 'قاعات الأفراح',
      'subtitle': 'اختاري المكان',
    },
    {
      'image': 'assets/images/makeup.jpg',
      'title': 'صالونات التجميل',
      'subtitle': 'إطلالتك تبدأ هنا',
    },
    {
      'image': 'assets/images/wedding-decor.jpg',
      'title': 'التزيين والديكور',
      'subtitle': 'اصنعي الأجواء',
    },
    {
      'image': 'assets/images/جلوريا.jpg',
      'title': 'تأجير السيارات',
      'subtitle': 'وصّلي لحظتك بأناقة',
    },
    {
      'image': 'assets/images/مزايا.jpg',
      'title': 'قاعات الفنادق',
      'subtitle': 'تجربة متكاملة',
    },
  ];

  @override
  void initState() {
    super.initState();

    _heroTimer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) {
        if (!mounted || !_heroController.hasClients) {
          return;
        }

        int next = _currentHero + 1;

        if (next >= _heroImages.length) {
          next = 0;
        }

        _heroController.animateToPage(
          next,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    _heroController.dispose();
    super.dispose();
  }

  // =========================================================
  // NAVIGATION
  // =========================================================

  void _openLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _openSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: cream,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHero(),
              _buildIntro(),
              _buildCategories(),
              // _buildDiscovery(),
              _buildHowItWorks(),
              // _buildFeatured(),
              _buildFinalCTA(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // HERO
  // =========================================================

  Widget _buildHero() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool desktop = constraints.maxWidth >= 850;

        return SizedBox(
          height: desktop ? 720 : 690,
          child: Stack(
            children: [
              // =================================================
              // IMAGE
              // =================================================

              Positioned.fill(
                child: PageView.builder(
                  controller: _heroController,
                  itemCount: _heroImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentHero = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _heroImages[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              // =================================================
              // DARK GRADIENT
              // =================================================

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        navy.withOpacity(0.72),
                        Colors.transparent,
                        Colors.black.withOpacity(0.72),
                      ],
                      stops: const [
                        0,
                        0.45,
                        1,
                      ],
                    ),
                  ),
                ),
              ),

              // =================================================
              // TOP NAVIGATION
              // =================================================

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildHeroNavigation(desktop),
              ),

              // =================================================
              // HERO CONTENT
              // =================================================

              Positioned(
                left: 25,
                right: 25,
                bottom: desktop ? 110 : 125,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 850,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: gold.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'أهلاً بك في فرح زون',
                            style: TextStyle(
                              color: navy,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          _heroTitles[_currentHero],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'LibertinusMath',
                            color: Colors.white,
                            fontSize: desktop ? 58 : 40,
                            height: 1.15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'اكتشفي الأماكن والخدمات التي تجعل مناسبتك '
                              'أجمل، وابني يومك بالطريقة التي تحلمين بها.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.82),
                            fontSize: desktop ? 16 : 13,
                            height: 1.7,
                          ),
                        ),

                        const SizedBox(height: 28),

                        _buildHeroButton(),
                      ],
                    ),
                  ),
                ),
              ),

              // =================================================
              // SLIDER INDICATORS
              // =================================================

              Positioned(
                bottom: 35,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _heroImages.length,
                        (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentHero == index ? 28 : 7,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentHero == index
                              ? gold
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // =================================================
              // SCROLL INDICATOR
              // =================================================

              Positioned(
                bottom: 25,
                right: 25,
                child: Row(
                  children: [
                    Text(
                      'اكتشفي المزيد',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.65),
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: gold,
                      size: 18,
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

  // =========================================================
  // HERO NAVIGATION
  // =========================================================

  Widget _buildHeroNavigation(bool desktop) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        desktop ? 45 : 20,
        25,
        desktop ? 45 : 20,
        0,
      ),
      child: Row(
        children: [
          // LOGO
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: gold.withOpacity(0.8),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: const Text(
                  'FZ',
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(width: 11),

              if (desktop)
                const Text(
                  'FARAH ZONE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
            ],
          ),

          const Spacer(),

          // LOGIN
          GestureDetector(
            onTap: _openLogin,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.13),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.35),
                ),
              ),
              child: const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // SIGN UP
          GestureDetector(
            onTap: _openSignup,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'إنشاء حساب',
                style: TextStyle(
                  color: navy,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // HERO BUTTON
  // =========================================================

  Widget _buildHeroButton() {
    return GestureDetector(
      onTap: _openSignup,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: gold,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gold.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ابدئي رحلة التخطيط',
              style: TextStyle(
                color: navy,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_back_rounded,
              color: navy,
              size: 19,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // INTRO
  // =========================================================

  Widget _buildIntro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        25,
        80,
        25,
        65,
      ),
      child: Column(
        children: [
          const Text(
            'كل تفاصيل يومك الجميل...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: gold,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'في مكان واحد.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'LibertinusMath',
              color: navy,
              fontSize: 39,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 17),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),
            child: Text(
              'من القاعة التي تتخيلينها، إلى تفاصيل الديكور '
                  'والتجميل والسيارة... فرح زون يجمع لك الخيارات '
                  'لتختاري ما يناسبك بسهولة.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: navy.withOpacity(0.58),
                fontSize: 14,
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // CATEGORIES
  // =========================================================

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اكتشفي',
                      style: TextStyle(
                        color: gold,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ماذا تحتاجين لمناسبتك؟',
                      style: TextStyle(
                        color: navy,
                        fontFamily: 'LibertinusMath',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: gold,
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool desktop = constraints.maxWidth >= 850;

              if (desktop) {
                return SizedBox(
                  height: 360,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildLargeCategory(
                          _categories[0],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildSmallCategory(
                                _categories[1],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: _buildSmallCategory(
                                _categories[2],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: _buildSmallCategory(
                                _categories[3],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: _buildSmallCategory(
                                _categories[4],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: [
                  _buildLargeCategory(_categories[0]),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSmallCategory(
                          _categories[1],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSmallCategory(
                          _categories[2],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSmallCategory(
                          _categories[3],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSmallCategory(
                          _categories[4],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // =========================================================
  // LARGE CATEGORY
  // =========================================================

  Widget _buildLargeCategory(
      Map<String, String> category,
      ) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.14),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            category['image']!,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  navy.withOpacity(0.8),
                ],
              ),
            ),
          ),

          Positioned(
            right: 20,
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category['subtitle']!,
                  style: const TextStyle(
                    color: gold,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'LibertinusMath',
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // SMALL CATEGORY
  // =========================================================

  Widget _buildSmallCategory(
      Map<String, String> category,
      ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.11),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            category['image']!,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  navy.withOpacity(0.82),
                ],
              ),
            ),
          ),

          Positioned(
            right: 15,
            bottom: 14,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category['subtitle']!,
                  style: const TextStyle(
                    color: gold,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  category['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'LibertinusMath',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // =========================================================
  // DISCOVERY OPTION
  // =========================================================

  Widget _buildDiscoveryOption(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.065),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: gold.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: gold,
              size: 21,
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
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.48),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white.withOpacity(0.35),
            size: 14,
          ),
        ],
      ),
    );
  }

  // =========================================================
  // HOW IT WORKS
  // =========================================================

  Widget _buildHowItWorks() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        25,
        80,
        25,
        70,
      ),
      child: Column(
        children: [
          const Text(
            'طريقتنا',
            style: TextStyle(
              color: gold,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'من الفكرة إلى المناسبة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: navy,
              fontFamily: 'LibertinusMath',
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 40),

          _buildTimelineItem(
            number: '01',
            title: 'اكتشفي',
            description:
            'تصفحي القاعات والخدمات واكتشفي الخيارات التي تناسبك.',
            icon: Icons.explore_outlined,
          ),

          _buildTimelineLine(),

          _buildTimelineItem(
            number: '02',
            title: 'اختاري',
            description:
            'احفظي المفضلة لديك وقارني بينها قبل اتخاذ القرار.',
            icon: Icons.favorite_border_rounded,
          ),

          _buildTimelineLine(),

          _buildTimelineItem(
            number: '03',
            title: 'أرسلي طلبك',
            description:
            'اختاري ما يناسبك وأرسلي طلب الحجز بسهولة.',
            icon: Icons.send_outlined,
          ),

          _buildTimelineLine(),

          _buildTimelineItem(
            number: '04',
            title: 'احتفلي',
            description:
            'اتركي لنا مهمة تسهيل البداية، وابدئي الاستعداد ليومك.',
            icon: Icons.auto_awesome,
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TIMELINE ITEM
  // =========================================================

  Widget _buildTimelineItem({
    required String number,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: navy,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: navy.withOpacity(0.16),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: gold,
            size: 25,
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: const TextStyle(
                    color: gold,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontFamily: 'LibertinusMath',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: TextStyle(
                    color: navy.withOpacity(0.58),
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // TIMELINE LINE
  // =========================================================

  Widget _buildTimelineLine() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 1,
        height: 38,
        margin: const EdgeInsets.only(
          right: 31,
        ),
        color: gold.withOpacity(0.35),
      ),
    );
  }


  // =========================================================
  // FEATURED CARD
  // =========================================================

  Widget _buildFeaturedCard(
      Map<String, String> venue,
      ) {
    return SizedBox(
      width: 290,
      child: Container(
        decoration: BoxDecoration(
          color: cream,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: navy.withOpacity(0.09),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 225,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    venue['image']!,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: navy,
                        size: 19,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: navy,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: gold,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            venue['rating']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    venue['name']!,
                    style: const TextStyle(
                      color: navy,
                      fontFamily: 'LibertinusMath',
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: navy.withOpacity(0.5),
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        venue['location']!,
                        style: TextStyle(
                          color: navy.withOpacity(0.55),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // FINAL CTA
  // =========================================================

  Widget _buildFinalCTA() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(
        25,
        60,
        25,
        60,
      ),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const Text(
            'لحظتك تستحق أن تبدأ\nبطريقة جميلة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'LibertinusMath',
              fontSize: 36,
              height: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            'خذي الخطوة الأولى واكتشفي عالم فرح زون.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.58),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 28),

          GestureDetector(
            onTap: _openSignup,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 27,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 9),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: navy,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // FOOTER
  // =========================================================

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        35,
        20,
        35,
      ),
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: navy,
              shape: BoxShape.circle,
            ),
            child: const Text(
              'FZ',
              style: TextStyle(
                color: gold,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'FARAH ZONE',
            style: TextStyle(
              color: navy,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'كل ما تحتاجينه ليومك الجميل',
            style: TextStyle(
              color: navy.withOpacity(0.48),
              fontFamily: 'LibertinusMath',
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            '© 2026 Farah Zone',
            style: TextStyle(
              color: navy.withOpacity(0.3),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}