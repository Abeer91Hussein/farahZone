import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();

  int _currentBanner = 0;
  bool _searchOpen = false;

  final List<String> _bannerImages = [
    'assets/images/fourSesones.jpg',
    'assets/images/جلوريا.jpg',
    'assets/images/مزايا.jpg',
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), _autoSlide);
  }

  void _autoSlide() {
    if (!mounted) return;

    _currentBanner++;

    if (_currentBanner >= _bannerImages.length) {
      _currentBanner = 0;
    }

    if (_pageController.hasClients) {
      _pageController.animateToPage(
        _currentBanner,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }

    Future.delayed(const Duration(seconds: 4), _autoSlide);
  }

  void _openSearch() {
    setState(() {
      _searchOpen = true;
    });
  }

  void _closeSearch() {
    FocusScope.of(context).unfocus();

    setState(() {
      _searchOpen = false;
      _searchController.clear();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 8, 18, 0),
      height: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: HomeScreen.navy.withOpacity(.18),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // ─────────────────────────────────────────────
          // BANNERS
          // ─────────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
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
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),

          // ─────────────────────────────────────────────
          // DARK OVERLAY
          // ─────────────────────────────────────────────
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HomeScreen.navy.withOpacity(.30),
                  HomeScreen.navy.withOpacity(.80),
                ],
              ),
            ),
          ),

          // ─────────────────────────────────────────────
          // BANNER INDICATORS
          // ─────────────────────────────────────────────
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: List.generate(
                _bannerImages.length,
                    (index) {
                  final selected = index == _currentBanner;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(left: 5),
                    width: selected ? 24 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: selected
                          ? HomeScreen.gold
                          : Colors.white.withOpacity(.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            left: 25,
            right: 25,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                const Text(
                  'مرحباً بكم في فرح زون',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'كل ما تحتاجه ليوم احتفالك المثالي في مكان واحد.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 15),

                Align(
                  alignment: Alignment.centerRight,
                  child: _searchOpen
                      ? _searchBar()
                      : _searchIcon(),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════
  // SMALL SEARCH ICON
  // ═══════════════════════════════════════════════════

  Widget _searchIcon() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _openSearch,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.96),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: HomeScreen.gold,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(
            Icons.search_rounded,
            color: HomeScreen.navy,
            size: 21,
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════
  // CENTERED SEARCH BAR
  // ═══════════════════════════════════════════════════
  Widget _searchBar() {
    return SizedBox(
      width: 430,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: HomeScreen.gold.withOpacity(.65),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.16),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // SEARCH ICON - CLICK AGAIN TO CLOSE
            IconButton(
              onPressed: _closeSearch,
              splashRadius: 20,
              icon: const Icon(
                Icons.search_rounded,
                color: HomeScreen.navy,
                size: 22,
              ),
            ),

            const SizedBox(width: 2),

            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                textDirection: TextDirection.rtl,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'ابحث بالاسم أو القسم أو الموقع...',
                  hintStyle: TextStyle(
                    color: HomeScreen.navy.withOpacity(.45),
                    fontSize: 13,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),

            // MICROPHONE
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 5),
              decoration: const BoxDecoration(
                color: HomeScreen.navy,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mic_none_rounded,
                color: HomeScreen.gold,
                size: 19,
              ),
            ),

            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}