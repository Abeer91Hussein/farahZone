import 'package:flutter/material.dart';

import 'package:farah/widgets/home_app_bar.dart';
import 'package:farah/widgets/home_drawer.dart';
import 'package:farah/widgets/hero_section.dart';
import 'package:farah/widgets/availability_calendar.dart';
import 'package:farah/widgets/service_cards.dart';
import 'package:farah/widgets/most_booked.dart';
import 'package:farah/widgets/special_offers.dart';

import 'package:farah/view/wedding_halls_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Set<String> _selectedCategories = {'قاعات الأفراح'};

  void _handleCategoriesChanged(Set<String> categories) {
    setState(() {
      _selectedCategories = categories;
    });
  }

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'قاعات الأفراح',
      'image': 'assets/images/fourSesones.jpg',
      'icon': Icons.account_balance_outlined,
    },
    {
      'title': 'صالونات التجميل',
      'image': 'assets/images/makeup.jpg',
      'icon': Icons.face_retouching_natural,
    },
    {
      'title': 'التزيين والديكور',
      'image': 'assets/images/wedding-decor.jpg',
      'icon': Icons.auto_awesome_outlined,
    },
    {
      'title': 'تأجير السيارات',
      'image': 'assets/images/car.jpg',
      'icon': Icons.directions_car_filled_outlined,
    },
    {
      'title': 'قاعات الفنادق',
      'image': 'assets/images/carmelHotel.jpg',
      'icon': Icons.hotel_outlined,
    },
  ];

  void _openCategory(String title) {
    Widget? screen;

    switch (title) {
      case 'قاعات الأفراح':
        screen = const WeddingHallsScreen();
        break;

    // Add your other screens here:
    //
    // case 'صالونات التجميل':
    //   screen = const BeautySalonsScreen();
    //   break;
    //
    // case 'التزيين والديكور':
    //   screen = const DecorationScreen();
    //   break;
    //
    // case 'تأجير السيارات':
    //   screen = const CarRentalScreen();
    //   break;
    //
    // case 'قاعات الفنادق':
    //   screen = const HotelHallsScreen();
    //   break;
    }

    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => screen!,
        ),
      );
    }
  }

  Widget _categoriesSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLarge = constraints.maxWidth >= 900;

          final cardWidth = isLarge
              ? (constraints.maxWidth - 56) / 5
              : 170.0;

          return SizedBox(
            height: 175,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final category = _categories[index];

                return _categoryCard(
                  title: category['title'],
                  image: category['image'],
                  icon: category['icon'],
                  width: cardWidth,
                  onTap: () {
                    _openCategory(category['title']);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _categoryCard({
    required String title,
    required String image,
    required IconData icon,
    required double width,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      height: 170,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          splashColor: HomeScreen.gold.withOpacity(.18),
          highlightColor: HomeScreen.navy.withOpacity(.06),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(.85),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: HomeScreen.navy.withOpacity(.15),
                  blurRadius: 18,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.42, 1.0],
                      colors: [
                        Colors.black.withOpacity(.05),
                        HomeScreen.navy.withOpacity(.12),
                        HomeScreen.navy.withOpacity(.90),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.94),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.18),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      color: HomeScreen.navy,
                      size: 19,
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: HomeScreen.gold,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: HomeScreen.navy,
                      size: 18,
                    ),
                  ),
                ),

                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'LibertinusMath',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.15,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 2.5,
                        width: 28,
                        decoration: BoxDecoration(
                          color: HomeScreen.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
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
  }

  Widget _calendarSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: AvailabilityCalendar(
            selectedCategories: _selectedCategories,
            onCategoriesChanged: _handleCategoriesChanged,
          ),
        ),
      ),
    );
  }

  void _showSearchDialog() {
    final TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(.45),
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: HomeScreen.cream,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: HomeScreen.navy.withOpacity(.25),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: HomeScreen.navy,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.search_rounded,
                          color: HomeScreen.gold,
                          size: 23,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          'ابحث عن خدماتك',
                          style: TextStyle(
                            fontFamily: 'LibertinusMath',
                            color: HomeScreen.navy,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: HomeScreen.navy,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: HomeScreen.navy.withOpacity(.08),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: HomeScreen.navy.withOpacity(.07),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.trim().isEmpty) return;

                        Navigator.pop(dialogContext);

                        // TODO:
                        // Add your search navigation/function here.
                      },
                      decoration: InputDecoration(
                        hintText: 'ابحث بالاسم أو القسم أو الموقع...',
                        hintStyle: TextStyle(
                          fontFamily: 'LibertinusMath',
                          color: HomeScreen.navy.withOpacity(.45),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: HomeScreen.navy,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            size: 19,
                            color: HomeScreen.navy.withOpacity(.45),
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'LibertinusMath',
                        color: HomeScreen.navy,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        size: 18,
                        color: HomeScreen.gold,
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          'ابحث عن قاعة، صالون، ديكور أو خدمة تناسب احتفالك.',
                          style: TextStyle(
                            fontFamily: 'LibertinusMath',
                            color: HomeScreen.navy.withOpacity(.65),
                            fontSize: 12,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: HomeScreen.cream,
        appBar: const HomeAppBar(),
        drawer: const HomeDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeroSection(

              ),

              _categoriesSection(),

              const SizedBox(height: 5),

              _calendarSection(),

              const SizedBox(height: 25),

              const ServiceCards(),

              const MostBookedSection(),

              const SpecialOffersSection(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}