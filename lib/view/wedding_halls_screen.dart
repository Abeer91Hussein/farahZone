import 'package:flutter/material.dart';
import 'package:farah/view/serviceDetailsScreen.dart';

class WeddingHallsScreen extends StatefulWidget {
  const WeddingHallsScreen({super.key});

  @override
  State<WeddingHallsScreen> createState() => _WeddingHallsScreenState();
}

class _WeddingHallsScreenState extends State<WeddingHallsScreen> {
  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  final TextEditingController _searchController =
  TextEditingController();

  String _searchText = '';
  String _selectedLocation = 'الكل';
  String _selectedCapacity = 'الكل';

  final Set<int> _favorites = {};

  final List<Map<String, dynamic>> _halls = [
    {
      'id': 1,
      'name': 'قاعة الفصول الاربعة',
      'location': 'رام الله',
      'price': 1500,
      'capacity': 200,
      'rating': 4.8,
      'image': 'assets/images/fourSesones.jpg',
      'featured': true,
    },
    {
      'id': 2,
      'name': 'قاعة الملكية',
      'location': 'رام الله',
      'price': 2000,
      'capacity': 300,
      'rating': 4.7,
      'image': 'assets/images/malakeha.jpg',
      'featured': true,
    },
    {
      'id': 3,
      'name': 'قاعة جلوريا',
      'location': 'رام الله',
      'price': 1000,
      'capacity': 150,
      'rating': 4.6,
      'image': 'assets/images/جلوريا.jpg',
      'featured': false,
    },
    {
      'id': 4,
      'name': 'قاعة مزايا',
      'location': 'رام الله',
      'price': 1800,
      'capacity': 250,
      'rating': 4.9,
      'image': 'assets/images/مزايا.jpg',
      'featured': false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredHalls {
    return _halls.where((hall) {
      final matchesSearch =
          hall['name'].toString().contains(_searchText) ||
              hall['location'].toString().contains(_searchText);

      final matchesLocation =
          _selectedLocation == 'الكل' ||
              hall['location'] == _selectedLocation;

      final matchesCapacity =
          _selectedCapacity == 'الكل' ||
              (_selectedCapacity == 'أقل من 200' &&
                  hall['capacity'] < 200) ||
              (_selectedCapacity == '200 - 300' &&
                  hall['capacity'] >= 200 &&
                  hall['capacity'] <= 300) ||
              (_selectedCapacity == 'أكثر من 300' &&
                  hall['capacity'] > 300);

      return matchesSearch &&
          matchesLocation &&
          matchesCapacity;
    }).toList();
  }

  List<Map<String, dynamic>> get _featuredHalls {
    return _filteredHalls
        .where((hall) => hall['featured'] == true)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: cream,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 20,
                  vertical: 20,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1400,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(),

                        const SizedBox(height: 28),

                        _buildHero(),

                        const SizedBox(height: 28),

                        _buildSearchBar(),

                        const SizedBox(height: 32),

                        _buildSectionTitle(
                          'جميع القاعات',
                          '${_filteredHalls.length} قاعة متاحة',
                        ),

                        const SizedBox(height: 18),

                        _buildHallsGrid(isDesktop),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: navy,
          ),
        ),

        const Spacer(),

        const Text(
          'قاعات الأفراح',
          style: TextStyle(
            color: navy,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'LibertinusMath',
          ),
        ),

        const Spacer(),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: navy,
          ),
        ),
      ],
    );
  }

  Widget _buildHero() {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/fourSesones.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            colors: [
              navy.withOpacity(.90),
              navy.withOpacity(.20),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'قاعة أحلامك تبدأ من هنا',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'LibertinusMath',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'اكتشفي أجمل القاعات لمناسبتك المميزة',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontFamily: 'LibertinusMath',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchText = value.trim();
          });
        },
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: navy,
          fontFamily: 'LibertinusMath',
        ),
        decoration: InputDecoration(
          hintText: 'ابحثي عن قاعة أو موقع...',
          hintStyle: TextStyle(
            color: navy.withOpacity(.45),
            fontFamily: 'LibertinusMath',
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: gold,
          ),
          suffixIcon: _searchText.isNotEmpty
              ? IconButton(
            onPressed: () {
              _searchController.clear();

              setState(() {
                _searchText = '';
              });
            },
            icon: const Icon(
              Icons.close_rounded,
              color: navy,
            ),
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String title,
      String subtitle,
      ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: navy,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'LibertinusMath',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: navy.withOpacity(.55),
                fontSize: 12,
                fontFamily: 'LibertinusMath',
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: gold,
          size: 16,
        ),
      ],
    );
  }

  Widget _buildFeaturedHalls(bool isDesktop) {
    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _featuredHalls.length,
        separatorBuilder: (_, __) =>
        const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: isDesktop ? 340 : 285,
            child: _buildHallCard(
              _featuredHalls[index],
              featured: true,
            ),
          );
        },
      ),
    );
  }

  Widget _buildHallsGrid(bool isDesktop) {
    if (_filteredHalls.isEmpty) {
      return _buildEmptyState();
    }

    final columns = isDesktop ? 3 : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _filteredHalls.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,

        // ⭐ MODIFY:
        // We use a fixed card height instead of childAspectRatio.
        // This prevents the bottom content from overflowing.
        mainAxisExtent: isDesktop ? 380 : 350,
      ),
      itemBuilder: (context, index) {
        return _buildHallCard(
          _filteredHalls[index],
        );
      },
    );
  }

  Widget _buildHallCard(
      Map<String, dynamic> hall, {
        bool featured = false,
      }) {
    final int id = hall['id'] as int;
    final bool isFavorite = _favorites.contains(id);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),

        // ⭐ MODIFY:
        // Open the general ServiceDetailsScreen.
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(
                image: hall['image'],
                name: hall['name'],
                category: 'قاعات الأفراح',
                location: hall['location'],
                rating: '${hall['rating']}',
                description:
                'قاعة ${hall['name']} توفر لك أجواءً مميزة '
                    'للاحتفال بأجمل مناسباتك. '
                    'تتميز القاعة بتصميم أنيق ومساحة مناسبة '
                    'لاستقبال ضيوفك، وتوفر تجربة مميزة لتنظيم '
                    'حفلات الزفاف والمناسبات الخاصة.',
                price: '${hall['price']} ₪',
                bookings: '${hall['capacity']} شخص',
                availableDate: 'متاح للحجز',
                features: const [
                  'تكييف مركزي',
                  'موقف سيارات',
                  'خدمة الطعام',
                  'نظام صوتي',
                  'إضاءة احترافية',
                  'منطقة تصوير',
                ],
              ),
            ),
          );
        },

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: navy.withOpacity(.09),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.stretch,
            children: [
              // =========================================================
              // IMAGE
              // =========================================================
              Expanded(
                flex: 6,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      hall['image'],
                      fit: BoxFit.cover,
                    ),

                    // Dark gradient at bottom of image
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.35),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Featured badge
                    if (featured)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: gold,
                            borderRadius:
                            BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:
                                Colors.black.withOpacity(.15),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Text(
                            'مميزة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LibertinusMath',
                            ),
                          ),
                        ),
                      ),

                    // Favorite button
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                              Colors.black.withOpacity(.15),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                _favorites.remove(id);
                              } else {
                                _favorites.add(id);
                              }
                            });
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.redAccent
                                : navy,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // =========================================================
              // CARD INFORMATION
              // =========================================================
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      // Hall name
                      Text(
                        hall['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: navy,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibertinusMath',
                        ),
                      ),

                      const SizedBox(height: 7),

                      // Location + rating
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: gold,
                          ),

                          const SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              hall['location'],
                              maxLines: 1,
                              overflow:
                              TextOverflow.ellipsis,
                              style: TextStyle(
                                color: navy.withOpacity(.60),
                                fontSize: 12,
                                fontFamily:
                                'LibertinusMath',
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: gold,
                          ),

                          const SizedBox(width: 3),

                          Text(
                            '${hall['rating']}',
                            style: const TextStyle(
                              color: navy,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LibertinusMath',
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Capacity + price
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 16,
                            color: navy.withOpacity(.55),
                          ),

                          const SizedBox(width: 5),

                          Text(
                            '${hall['capacity']} شخص',
                            style: TextStyle(
                              color: navy.withOpacity(.65),
                              fontSize: 12,
                              fontFamily:
                              'LibertinusMath',
                            ),
                          ),

                          const Spacer(),

                          Text(
                            '${hall['price']} ₪',
                            style: const TextStyle(
                              color: gold,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LibertinusMath',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // =================================================
                      // عرض التفاصيل BUTTON
                      // =================================================
                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ServiceDetailsScreen(
                                      image: hall['image'],
                                      name: hall['name'],
                                      category: 'قاعات الأفراح',
                                      location:
                                      hall['location'],
                                      rating:
                                      '${hall['rating']}',
                                      description:
                                      'قاعة ${hall['name']} توفر لك أجواءً مميزة '
                                          'للاحتفال بأجمل مناسباتك. '
                                          'تتميز القاعة بتصميم أنيق ومساحة مناسبة '
                                          'لاستقبال ضيوفك، وتوفر تجربة مميزة لتنظيم '
                                          'حفلات الزفاف والمناسبات الخاصة.',
                                      price:
                                      '${hall['price']} ₪',
                                      bookings:
                                      '${hall['capacity']} شخص',
                                      availableDate:
                                      'متاح للحجز',
                                      features: const [
                                        'تكييف مركزي',
                                        'موقف سيارات',
                                        'خدمة الطعام',
                                        'نظام صوتي',
                                        'إضاءة احترافية',
                                        'منطقة تصوير',
                                      ],
                                    ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: navy,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(11),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              const Text(
                                'عرض التفاصيل',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontFamily:
                                  'LibertinusMath',
                                ),
                              ),

                              const SizedBox(width: 7),

                              const Icon(
                                Icons
                                    .arrow_back_rounded,
                                color: gold,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            color: navy.withOpacity(.35),
            size: 50,
          ),

          const SizedBox(height: 15),

          const Text(
            'لا توجد قاعات مطابقة',
            style: TextStyle(
              color: navy,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'LibertinusMath',
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'جربي تغيير خيارات البحث',
            style: TextStyle(
              color: navy.withOpacity(.55),
              fontFamily: 'LibertinusMath',
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationFilter() {
    _showSelectionSheet(
      title: 'اختاري الموقع',
      options: const [
        'الكل',
        'رام الله',
        'البيرة',
        'نابلس',
      ],
      selected: _selectedLocation,
      onSelected: (value) {
        setState(() {
          _selectedLocation = value;
        });
      },
    );
  }

  void _showCapacityFilter() {
    _showSelectionSheet(
      title: 'عدد الأشخاص',
      options: const [
        'الكل',
        'أقل من 200',
        '200 - 300',
        'أكثر من 300',
      ],
      selected: _selectedCapacity,
      onSelected: (value) {
        setState(() {
          _selectedCapacity = value;
        });
      },
    );
  }

  void _showAllFilters() {
    _showCapacityFilter();
  }

  void _showSelectionSheet({
    required String title,
    required List<String> options,
    required String selected,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                const SizedBox(height: 18),

                ...options.map((option) {
                  final isSelected =
                      option == selected;

                  return ListTile(
                    title: Text(
                      option,
                      style: const TextStyle(
                        fontFamily: 'LibertinusMath',
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                      Icons.check_circle,
                      color: gold,
                    )
                        : null,
                    onTap: () {
                      onSelected(option);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}