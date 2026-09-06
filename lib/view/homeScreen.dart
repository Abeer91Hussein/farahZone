import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // =========================================================
      // APP BAR
      // =========================================================

      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        titleSpacing: 12,

        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: gold,
                  width: 1.2,
                ),
              ),
              child: const Text(
                'FZ',
                style: TextStyle(
                  color: navy,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibertinusMath',
                ),
              ),
            ),

            const SizedBox(width: 8),

            Flexible(
              child: Text(
                'FARAH ZONE',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: navy,
                  fontSize: 16,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'LibertinusMath',
                ),
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            tooltip: 'Wishlist',
            onPressed: () {
              // Wishlist screen later
            },
            icon: const Icon(
              Icons.favorite_border,
              color: navy,
              size: 22,
            ),
          ),

          IconButton(
            tooltip: 'My Requests',
            onPressed: () {
              // My requests screen later
            },
            icon: const Icon(
              Icons.event_note_outlined,
              color: navy,
              size: 22,
            ),
          ),

          IconButton(
            tooltip: 'Profile',
            onPressed: () {
              // Profile screen later
            },
            icon: const Icon(
              Icons.person_outline,
              color: navy,
              size: 23,
            ),
          ),

          const SizedBox(width: 4),
        ],
      ),

      // =========================================================
      // BODY
      // =========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===================================================
            // WELCOME
            // ===================================================

            const Text(
              'Welcome to Farah Zone',
              style: TextStyle(
                color: navy,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'LibertinusMath',
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Find everything you need for your perfect celebration.',
              style: TextStyle(
                color: navy.withOpacity(0.65),
                fontSize: 14,
                height: 1.5,
                fontFamily: 'LibertinusMath',
              ),
            ),

            const SizedBox(height: 25),

            // ===================================================
            // SEARCH BAR
            // ===================================================

            _searchBar(context),

            const SizedBox(height: 38),

            // ===================================================
            // CATEGORIES
            // ===================================================

            const Text(
              'Explore Categories',
              style: TextStyle(
                color: navy,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: 'LibertinusMath',
              ),
            ),

            const SizedBox(height: 25),

            LayoutBuilder(
              builder: (context, constraints) {
                final bool isDesktop = constraints.maxWidth >= 700;

                final double circleSize = isDesktop ? 160 : 110;

                if (isDesktop) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _categoryItem(
                        context,
                        title: 'Wedding Halls',
                        image: 'assets/images/fourSesones.jpg',
                        size: circleSize,
                      ),

                      _categoryItem(
                        context,
                        title: 'Makeup Artists',
                        image: 'assets/images/makeup.jpg',
                        size: circleSize,
                      ),

                      _categoryItem(
                        context,
                        title: 'Decorations',
                        image: 'assets/images/wedding-decor.jpg',
                        size: circleSize,
                      ),
                    ],
                  );
                }

                // MOBILE
                return SizedBox(
                  height: 160,

                  child: ListView(
                    scrollDirection: Axis.horizontal,

                    children: [
                      const SizedBox(width: 10),

                      _categoryItem(
                        context,
                        title: 'Wedding Halls',
                        image: 'assets/images/fourSesones.jpg',
                        size: circleSize,
                      ),

                      const SizedBox(width: 25),

                      _categoryItem(
                        context,
                        title: 'Makeup Artists',
                        image: 'assets/images/makeup.jpg',
                        size: circleSize,
                      ),

                      const SizedBox(width: 25),

                      _categoryItem(
                        context,
                        title: 'Decorations',
                        image: 'assets/images/جلوريا.jpg',
                        size: circleSize,
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 55),

            // ===================================================
            // AVAILABLE SOON
            // ===================================================

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Expanded(
                  child: Text(
                    'Available Soon',
                    style: TextStyle(
                      color: navy,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                ),

                Text(
                  'Nearest dates',
                  style: TextStyle(
                    color: navy.withOpacity(0.55),
                    fontSize: 12,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 7),

            Text(
              'Wedding halls with the nearest available dates',
              style: TextStyle(
                color: navy.withOpacity(0.60),
                fontSize: 13,
                fontFamily: 'LibertinusMath',
              ),
            ),

            const SizedBox(height: 22),

            // ===================================================
            // AVAILABLE HALLS
            // ===================================================

            LayoutBuilder(
              builder: (context, constraints) {

                if (constraints.maxWidth >= 850) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: _hallCard(
                          image: 'assets/images/fourSesones.jpg',
                          name: 'Four Seasons Hall',
                          location: 'Ramallah',
                          rating: '4.8',
                          date: 'September 12, 2026',
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: _hallCard(
                          image: 'assets/images/جلوريا.jpg',
                          name: 'Gloria Hall',
                          location: 'Nablus',
                          rating: '4.7',
                          date: 'September 15, 2026',
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: _hallCard(
                          image: 'assets/images/مزايا.jpg',
                          name: 'Mazaya Hall',
                          location: 'Ramallah',
                          rating: '4.6',
                          date: 'September 18, 2026',
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [

                    _hallCard(
                      image: 'assets/images/fourSesones.jpg',
                      name: 'Four Seasons Hall',
                      location: 'Ramallah',
                      rating: '4.8',
                      date: 'September 12, 2026',
                    ),

                    const SizedBox(height: 18),

                    _hallCard(
                      image: 'assets/images/جلوريا.jpg',
                      name: 'Gloria Hall',
                      location: 'Nablus',
                      rating: '4.7',
                      date: 'September 15, 2026',
                    ),

                    const SizedBox(height: 18),

                    _hallCard(
                      image: 'assets/images/مزايا.jpg',
                      name: 'Mazaya Hall',
                      location: 'Ramallah',
                      rating: '4.6',
                      date: 'September 18, 2026',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 55),

            // ===================================================
            // SPECIAL OFFERS
            // ===================================================

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  'Special Offers',
                  style: TextStyle(
                    color: navy,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // All offers later
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: navy,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 7),

            Text(
              'Exclusive offers for your special day',
              style: TextStyle(
                color: navy.withOpacity(0.60),
                fontSize: 13,
                fontFamily: 'LibertinusMath',
              ),
            ),

            const SizedBox(height: 22),

            // ===================================================
            // OFFERS
            // ===================================================

            LayoutBuilder(
              builder: (context, constraints) {

                if (constraints.maxWidth >= 850) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: _offerCard(
                          image: 'assets/images/fourSesones.jpg',
                          category: 'WEDDING HALL',
                          title: '20% Off Wedding Packages',
                          description:
                          'Book your celebration package and enjoy a special discount.',
                          discount: '20% OFF',
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: _offerCard(
                          image: 'assets/images/makeup.jpg',
                          category: 'MAKEUP & BEAUTY',
                          title: 'Bridal Makeup Package',
                          description:
                          'Special bridal makeup package at an exclusive price.',
                          discount: '15% OFF',
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: _offerCard(
                          image: 'assets/images/wedding-decor.jpg',
                          category: 'DECORATION',
                          title: 'Wedding Decoration',
                          description:
                          'Create your dream atmosphere with our decoration package.',
                          discount: '10% OFF',
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [

                    _offerCard(
                      image: 'assets/images/fourSesones.jpg',
                      category: 'WEDDING HALL',
                      title: '20% Off Wedding Packages',
                      description:
                      'Book your celebration package and enjoy a special discount.',
                      discount: '20% OFF',
                    ),

                    const SizedBox(height: 18),

                    _offerCard(
                      image: 'assets/images/makeup.jpg',
                      category: 'MAKEUP & BEAUTY',
                      title: 'Bridal Makeup Package',
                      description:
                      'Special bridal makeup package at an exclusive price.',
                      discount: '15% OFF',
                    ),

                    const SizedBox(height: 18),

                    _offerCard(
                      image: 'assets/images/wedding-decor.jpg',
                      category: 'DECORATION',
                      title: 'Wedding Decoration',
                      description:
                      'Create your dream atmosphere with our decoration package.',
                      discount: '10% OFF',
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // SEARCH BAR
  // =============================================================

  Widget _searchBar(BuildContext context) {
    return Container(
      height: 52,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: TextField(
        style: const TextStyle(
          color: navy,
          fontSize: 13,
          fontFamily: 'LibertinusMath',
        ),

        decoration: InputDecoration(
          hintText: 'Search halls, makeup artists, decorations...',
          hintStyle: TextStyle(
            color: navy.withOpacity(0.40),
            fontSize: 12,
            fontFamily: 'LibertinusMath',
          ),

          prefixIcon: Icon(
            Icons.search,
            color: navy.withOpacity(0.55),
            size: 21,
          ),

          suffixIcon: IconButton(
            tooltip: 'Voice Search',
            onPressed: () {
              // STT will be connected here later
            },
            icon: const Icon(
              Icons.mic_none,
              color: navy,
              size: 21,
            ),
          ),

          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: gold,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  // =============================================================
  // CATEGORY ITEM
  // =============================================================

  Widget _categoryItem(
      BuildContext context, {
        required String title,
        required String image,
        required double size,
      }) {
    return GestureDetector(
      onTap: () {
        // Navigation will be added later
      },

      child: SizedBox(
        width: size + 30,

        child: Column(
          children: [

            Container(
              width: size,
              height: size,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(
                  color: gold,
                  width: 2,
                ),

                boxShadow: [
                  BoxShadow(
                    color: navy.withOpacity(0.12),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),

              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,

                  errorBuilder: (
                      context,
                      error,
                      stackTrace,
                      ) {
                    return Container(
                      color: Colors.white,
                      child: const Icon(
                        Icons.image_outlined,
                        color: gold,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                color: navy,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'LibertinusMath',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // AVAILABLE HALL CARD
  // =============================================================

  Widget _hallCard({
    required String image,
    required String name,
    required String location,
    required String rating,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),

            child: SizedBox(
              height: 180,
              width: double.infinity,

              child: Image.asset(
                image,
                fit: BoxFit.cover,

                errorBuilder: (
                    context,
                    error,
                    stackTrace,
                    ) {
                  return Container(
                    color: cream,
                    child: const Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: gold,
                        size: 45,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // INFORMATION
          Padding(
            padding: const EdgeInsets.all(17),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: navy,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'LibertinusMath',
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.star,
                      color: gold,
                      size: 17,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      rating,
                      style: const TextStyle(
                        color: navy,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    Icon(
                      Icons.location_on_outlined,
                      color: navy.withOpacity(0.55),
                      size: 16,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      location,
                      style: TextStyle(
                        color: navy.withOpacity(0.60),
                        fontSize: 12,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: gold.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(
                        Icons.event_available_outlined,
                        color: gold,
                        size: 16,
                      ),

                      const SizedBox(width: 7),

                      Flexible(
                        child: Text(
                          'Available $date',
                          style: const TextStyle(
                            color: navy,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'LibertinusMath',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 42,

                  child: OutlinedButton(
                    onPressed: () {
                      // Hall details later
                    },

                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: navy,
                        width: 1,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: const Text(
                      'VIEW DETAILS',
                      style: TextStyle(
                        color: navy,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // SPECIAL OFFER CARD
  // =============================================================

  Widget _offerCard({
    required String image,
    required String category,
    required String title,
    required String description,
    required String discount,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // =====================================================
          // IMAGE + DISCOUNT
          // =====================================================

          Stack(
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),

                child: SizedBox(
                  height: 170,
                  width: double.infinity,

                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,

                    errorBuilder: (
                        context,
                        error,
                        stackTrace,
                        ) {
                      return Container(
                        color: cream,
                        child: const Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: gold,
                            size: 45,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // DISCOUNT BADGE
              Positioned(
                top: 14,
                right: 14,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: gold,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // =====================================================
          // OFFER INFORMATION
          // =====================================================

          Padding(
            padding: const EdgeInsets.all(17),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  category,
                  style: const TextStyle(
                    color: gold,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: navy,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    color: navy.withOpacity(0.60),
                    fontSize: 12,
                    height: 1.4,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 40,

                  child: ElevatedButton(
                    onPressed: () {
                      // Offer details later
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
                      'VIEW OFFER',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),
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