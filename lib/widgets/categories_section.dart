
import 'package:flutter/material.dart';
// import 'package:farah/view/categoriesScreen.dart';

class CategoriesSection extends StatefulWidget {
  // ===================== NEW: shared state, passed down from HomeScreen =====================
  // Replaces the old local-only _selectedIndex (single select). This is the
  // same Set<String> that AvailabilityCalendar reads, so tapping a card here
  // updates the calendar too.
  final Set<String> selectedCategories;
  final ValueChanged<Set<String>> onCategoriesChanged;

  const CategoriesSection({
    super.key,
    required this.selectedCategories,
    required this.onCategoriesChanged,
  });
  // =============================================================================================

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  // ============================================================
  // ⭐ MODIFY: FARAH ZONE COLORS
  // ============================================================

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  // ============================================================
  // ⭐ MODIFY: FONT
  // ============================================================

  static const String fontFamily = 'LibertinusMath';

  // ============================================================
  // ⭐ MODIFY: CATEGORIES
  // ============================================================

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'قاعات الأفراح',
      'count': '128 قاعة',
      'image': 'assets/images/fourSesones.jpg',
    },
    {
      'title': 'صالونات التجميل',
      'count': '56 صالون',
      'image': 'assets/images/makeup.jpg',
    },
    {
      'title': 'التزيين والديكور',
      'count': '74 مزود خدمة',
      'image': 'assets/images/wedding-decor.jpg',
    },
    {
      'title': 'تأجير السيارات',
      'count': '42 سيارة',
      'image': 'assets/images/car.jpg',
    },
    {
      'title': 'قاعات الفنادق',
      'count': '36 قاعة',
      'image': 'assets/images/carmelHotel.jpg',
    },
  ];

  // ===================== NEW: toggle helper =====================
  // Multi-select: tapping an already-selected card removes it, tapping an
  // unselected card adds it. Builds a new set and reports it up to
  // HomeScreen so CategoriesSection and AvailabilityCalendar stay in sync.
  void _toggleCategory(String title) {
    final updated = Set<String>.from(widget.selectedCategories);
    if (updated.contains(title)) {
      updated.remove(title);
    } else {
      updated.add(title);
    }
    widget.onCategoriesChanged(updated);
  }
  // ==================================================================

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader(),

              const SizedBox(height: 15),

              _categoryList(),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // SECTION HEADER
  // ============================================================

  Widget _sectionHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ========================================================
        // TITLE
        // ========================================================

        const Text(
          'استكشف الأقسام',
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),

        const SizedBox(width: 15),

        // ========================================================
        // GOLD LINE
        // ========================================================

        Expanded(
          child: Container(
            height: 1,
            color: gold.withOpacity(0.45),
          ),
        ),

        const SizedBox(width: 12),

        // // ========================================================
        // // SHOW ALL
        // // ========================================================
        // InkWell(
        //   borderRadius: BorderRadius.circular(8),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const CategoriesScreen(),
        //       ),
        //     );
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 4,
        //       vertical: 5,
        //     ),
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const Icon(
        //           Icons.arrow_back,
        //           color: gold,
        //           size: 19,
        //         ),
        //         const SizedBox(width: 4),
        //         Text(
        //           'عرض الكل',
        //           style: TextStyle(
        //             fontFamily: fontFamily,
        //             fontSize: 15,
        //             color: navy.withOpacity(0.85),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

      ],
    );
  }

  // ============================================================
  // CATEGORY LIST
  // ============================================================

  Widget _categoryList() {
    return Column(
      children: List.generate(
        _categories.length,
            (index) {
          final category = _categories[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == _categories.length - 1 ? 0 : 11,
            ),
            child: _categoryCard(
              title: category['title'],
              count: category['count'],
              image: category['image'],
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // CATEGORY CARD
  // ============================================================

  Widget _categoryCard({
    required String title,
    required String count,
    required String image,
  }) {
    // NEW: selected now comes from the shared set (matched by title)
    // instead of a locally-owned single _selectedIndex.
    final bool selected = widget.selectedCategories.contains(title);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _toggleCategory(title),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,

          // ======================================================
          // ⭐ MODIFY CARD HEIGHT
          // ======================================================

          height: 82,

          decoration: BoxDecoration(
            color: selected
                ? navy
                : Colors.white.withOpacity(0.92),

            borderRadius: BorderRadius.circular(19),

            border: Border.all(
              color: selected
                  ? navy
                  : Colors.white.withOpacity(0.95),
              width: 1,
            ),

            // ====================================================
            // ⭐ MODIFY CARD SHADOW
            // ====================================================

            boxShadow: [
              BoxShadow(
                color: navy.withOpacity(
                  selected ? 0.18 : 0.07,
                ),
                blurRadius: selected ? 16 : 12,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  selected ? 7 : 4,
                ),
              ),
            ],
          ),

          child: Row(
            children: [
              // ==================================================
              // IMAGE
              // ==================================================

              Padding(
                padding: const EdgeInsets.all(9),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 280),

                  // ⭐ MODIFY IMAGE SIZE
                  width: 64,
                  height: 64,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),

                    border: Border.all(
                      color: selected
                          ? gold.withOpacity(0.70)
                          : Colors.white,
                      width: 2,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: navy.withOpacity(
                          selected ? 0.20 : 0.10,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  clipBehavior: Clip.antiAlias,

                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: cream,
                        child: const Icon(
                          Icons.image_outlined,
                          color: navy,
                          size: 27,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // ==================================================
              // TEXT
              // ==================================================

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.end,
                    children: [
                      // ==========================================
                      // TITLE
                      // ==========================================

                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: selected
                              ? Colors.white
                              : navy,
                        ),
                      ),

                      const SizedBox(height: 3),

                      // ==========================================
                      // COUNT
                      // ==========================================

                      Text(
                        count,
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 13,
                          color: selected
                              ? gold
                              : navy.withOpacity(0.48),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              // ==================================================
              // ARROW / CHECK
              // ==================================================

              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 280,
                  ),
                  width: 31,
                  height: 31,

                  decoration: BoxDecoration(
                    color: selected
                        ? gold
                        : cream,
                    shape: BoxShape.circle,
                  ),

                  // NEW: a check mark reads more clearly as "this is
                  // selected" than a back-arrow does once multiple cards
                  // can be active at once.
                  child: Icon(
                    selected ? Icons.check_rounded : Icons.arrow_back,
                    size: 16,
                    color: selected
                        ? navy
                        : navy.withOpacity(0.75),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}