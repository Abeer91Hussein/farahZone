import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  // ============================================================
  // CURRENT FILTER VALUES
  // ============================================================

  String _selectedLocation = 'الكل';
  String _selectedCategory = 'الكل';
  String _selectedItem = 'الكل';
  String _selectedPrice = 'الكل';

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: cream,

        // ========================================================
        // APP BAR
        // ========================================================

        appBar: AppBar(
          backgroundColor: cream,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: navy,
          ),
          title: const Text(
            'العروض الخاصة',
            style: TextStyle(
              color: navy,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              fontFamily: 'LibertinusMath',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: navy.withOpacity(0.07),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: navy,
                  size: 21,
                ),
              ),
            ),
          ],
        ),

        // ========================================================
        // BODY
        // ========================================================

        body: LayoutBuilder(
          builder: (context, constraints) {
            final bool isDesktop =
                constraints.maxWidth >= 850;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                isDesktop ? 50 : 20,
                8,
                isDesktop ? 50 : 20,
                35,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // HEADER
                  // ==================================================

                  _offersHeader(),

                  const SizedBox(height: 25),

                  // ==================================================
                  // FILTER
                  // ==================================================

                  _filterBar(context),

                  const SizedBox(height: 25),

                  // ==================================================
                  // SECTION TITLE
                  // ==================================================

                  Row(
                    children: [
                      const Text(
                        'العروض المتاحة',
                        style: TextStyle(
                          color: navy,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'LibertinusMath',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '3 عروض',
                        style: TextStyle(
                          color: navy.withOpacity(0.45),
                          fontSize: 12,
                          fontFamily: 'LibertinusMath',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ==================================================
                  // OFFERS
                  // ==================================================

                  if (isDesktop)
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _offerCard(
                            image:
                            'assets/images/fourSesones.jpg',
                            discount: '20%',
                            category: 'قاعات الأفراح',
                            title:
                            'خصم 20% على باقات الأفراح',
                            description:
                            'احجزي باقة احتفالك واستفيدي من خصم خاص لفترة محدودة.',
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: _offerCard(
                            image:
                            'assets/images/makeup.jpg',
                            discount: '15%',
                            category: 'مكياج العروس',
                            title:
                            'باقة مكياج العروس',
                            description:
                            'إطلالة متكاملة للعروس مع باقة مكياج خاصة بسعر حصري.',
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: _offerCard(
                            image:
                            'assets/images/wedding-decor.jpg',
                            discount: '10%',
                            category:
                            'التزيين والديكور',
                            title:
                            'ديكور حفلات الزفاف',
                            description:
                            'اصنعي الأجواء التي تحلمين بها مع باقة ديكور مميزة.',
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        _offerCard(
                          image:
                          'assets/images/fourSesones.jpg',
                          discount: '20%',
                          category: 'قاعات الأفراح',
                          title:
                          'خصم 20% على باقات الأفراح',
                          description:
                          'احجزي باقة احتفالك واستفيدي من خصم خاص لفترة محدودة.',
                        ),

                        const SizedBox(height: 18),

                        _offerCard(
                          image:
                          'assets/images/makeup.jpg',
                          discount: '15%',
                          category: 'مكياج العروس',
                          title:
                          'باقة مكياج العروس',
                          description:
                          'إطلالة متكاملة للعروس مع باقة مكياج خاصة بسعر حصري.',
                        ),

                        const SizedBox(height: 18),

                        _offerCard(
                          image:
                          'assets/images/wedding-decor.jpg',
                          discount: '10%',
                          category:
                          'التزيين والديكور',
                          title:
                          'ديكور حفلات الزفاف',
                          description:
                          'اصنعي الأجواء التي تحلمين بها مع باقة ديكور مميزة.',
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // OFFERS HEADER
  // ============================================================

  Widget _offersHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        24,
        25,
        24,
        25,
      ),
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.16),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [




          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [


                  const SizedBox(width: 12),


                ],
              ),

              const SizedBox(height: 18),

              const Text(
                'عروض خاصة لك',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'LibertinusMath',
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'اكتشف أفضل العروض واحصل على يوم احتفال مميز بسعر أفضل.',
                style: TextStyle(
                  color:
                  Colors.white.withOpacity(0.68),
                  fontSize: 12.5,
                  height: 1.7,
                  fontFamily: 'LibertinusMath',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FILTER BAR
  // ============================================================

  Widget _filterBar(BuildContext context) {
    final bool hasFilter =
        _selectedLocation != 'الكل' ||
            _selectedCategory != 'الكل' ||
            _selectedItem != 'الكل' ||
            _selectedPrice != 'الكل';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: cream,
              borderRadius:
              BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: navy,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'فلترة العروض',
                  style: TextStyle(
                    color: navy,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'LibertinusMath',
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  hasFilter
                      ? _filterSummary()
                      : 'المدينة • القسم • الخدمة • السعر',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: navy.withOpacity(0.45),
                    fontSize: 10,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          InkWell(
            borderRadius:
            BorderRadius.circular(12),
            onTap: () {
              _showOfferFilters(context);
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: navy,
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text(
                    'فلترة',
                    style: TextStyle(
                      color: gold,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),

                  SizedBox(width: 6),

                  Icon(
                    Icons.tune_rounded,
                    color: gold,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FILTER SUMMARY
  // ============================================================

  String _filterSummary() {
    final List<String> values = [];

    if (_selectedLocation != 'الكل') {
      values.add(_selectedLocation);
    }

    if (_selectedCategory != 'الكل') {
      values.add(_selectedCategory);
    }

    if (_selectedItem != 'الكل') {
      values.add(_selectedItem);
    }

    if (_selectedPrice != 'الكل') {
      values.add(_selectedPrice);
    }

    return values.join(' • ');
  }

  // ============================================================
  // OFFER FILTER BOTTOM SHEET
  // ============================================================

  void _showOfferFilters(BuildContext context) {
    String location = _selectedLocation;
    String category = _selectedCategory;
    String selectedItem = _selectedItem;
    String price = _selectedPrice;

    const locationOptions = [
      'الكل',
      'رام الله',
      'نابلس',
      'القدس',
      'بيت لحم',
      'الخليل',
    ];

    const priceOptions = [
      'الكل',
      'أقل من 500 ₪',
      '500 - 1000 ₪',
      '1000 - 2000 ₪',
      '2000 - 3000 ₪',
      'أكثر من 3000 ₪',
    ];

    // ==========================================================
    // CATEGORIES BY CITY
    // ==========================================================

    List<String> getCategoriesForLocation(
        String selectedLocation,
        ) {
      switch (selectedLocation) {
        case 'رام الله':
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'التزيين والديكور',
            'تأجير السيارات',
            'قاعات الفنادق',
          ];

        case 'نابلس':
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'التزيين والديكور',
            'تأجير السيارات',
          ];

        case 'القدس':
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'التزيين والديكور',
            'تأجير السيارات',
            'قاعات الفنادق',
          ];

        case 'بيت لحم':
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'التزيين والديكور',
            'تأجير السيارات',
          ];

        case 'الخليل':
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'تأجير السيارات',
          ];

        default:
          return [
            'قاعات الأفراح',
            'صالونات التجميل',
            'التزيين والديكور',
            'تأجير السيارات',
            'قاعات الفنادق',
          ];
      }
    }

    // ==========================================================
    // ITEMS BY CITY + CATEGORY
    // ==========================================================

    List<String> getItemsForCategory(
        String selectedLocation,
        String selectedCategory,
        ) {
      if (selectedLocation == 'الكل' ||
          selectedCategory == 'الكل') {
        return [];
      }

      if (selectedCategory == 'قاعات الأفراح') {
        if (selectedLocation == 'رام الله') {
          return [
            'الكل',
            'Four Seasons Hall',
            'Mazaya Hall',
          ];
        }

        if (selectedLocation == 'نابلس') {
          return [
            'الكل',
            'Gloria Hall',
          ];
        }

        return [
          'الكل',
          'قاعة أفراح القدس',
          'قاعة أفراح مميزة',
        ];
      }

      if (selectedCategory == 'صالونات التجميل') {
        if (selectedLocation == 'رام الله') {
          return [
            'الكل',
            'Beauty Salon',
            'Royal Beauty Salon',
            'Luna Beauty',
          ];
        }

        if (selectedLocation == 'نابلس') {
          return [
            'الكل',
            'Nablus Beauty Salon',
            'Luna Beauty Nablus',
          ];
        }

        return [
          'الكل',
          'Royal Beauty Salon',
          'Beauty Center',
        ];
      }

      if (selectedCategory == 'التزيين والديكور') {
        if (selectedLocation == 'رام الله') {
          return [
            'الكل',
            'Elegant Decoration',
            'Royal Decor',
            'Golden Events Decor',
          ];
        }

        if (selectedLocation == 'نابلس') {
          return [
            'الكل',
            'Nablus Events Decor',
            'Elegant Decor Nablus',
          ];
        }

        return [
          'الكل',
          'Royal Decor',
          'Golden Events Decor',
        ];
      }

      if (selectedCategory == 'تأجير السيارات') {
        if (selectedLocation == 'رام الله') {
          return [
            'الكل',
            'Mercedes S-Class',
            'BMW 7 Series',
            'Mercedes V-Class',
          ];
        }

        if (selectedLocation == 'نابلس') {
          return [
            'الكل',
            'BMW 7 Series',
            'Mercedes S-Class',
          ];
        }

        return [
          'الكل',
          'Mercedes S-Class',
          'BMW 7 Series',
        ];
      }

      if (selectedCategory == 'قاعات الفنادق') {
        if (selectedLocation == 'رام الله') {
          return [
            'الكل',
            'Grand Hotel Hall',
            'Royal Palace Hall',
            'Golden Hotel Hall',
          ];
        }

        if (selectedLocation == 'القدس') {
          return [
            'الكل',
            'Royal Palace Hall',
            'Jerusalem Grand Hall',
          ];
        }

        return [
          'الكل',
          'Grand Hotel Hall',
          'Royal Hotel Hall',
        ];
      }

      return [];
    }

    // ==========================================================
    // CATEGORY ICON
    // ==========================================================

    IconData getCategoryIcon(
        String category,
        ) {
      switch (category) {
        case 'قاعات الأفراح':
          return Icons.account_balance_outlined;

        case 'صالونات التجميل':
          return Icons.face_retouching_natural;

        case 'التزيين والديكور':
          return Icons.auto_awesome_outlined;

        case 'تأجير السيارات':
          return Icons.local_taxi_outlined;

        case 'قاعات الفنادق':
          return Icons.hotel_outlined;

        default:
          return Icons.category_outlined;
      }
    }

    // ==========================================================
    // BOTTOM SHEET
    // ==========================================================

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (
              context,
              setModalState,
              ) {
            final categories =
            getCategoriesForLocation(location);

            final items =
            getItemsForCategory(
              location,
              category,
            );

            // ====================================================
            // SELECTION FIELD
            // ====================================================

            Widget selectionField({
              required String title,
              required IconData icon,
              required String value,
              required List<String> options,
              required ValueChanged<String>
              onSelected,
            }) {
              return Container(
                margin:
                const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(16),
                  border: Border.all(
                    color: navy.withOpacity(.08),
                  ),
                ),
                child: ExpansionTile(
                  tilePadding:
                  const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  childrenPadding:
                  const EdgeInsets.fromLTRB(
                    10,
                    0,
                    10,
                    10,
                  ),
                  initiallyExpanded: false,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                  collapsedShape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                  leading: Icon(
                    icon,
                    color: navy,
                    size: 20,
                  ),
                  title: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: navy,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                      'LibertinusMath',
                    ),
                  ),
                  subtitle: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: value == 'الكل'
                          ? navy.withOpacity(.45)
                          : navy,
                      fontSize: 12,
                      fontWeight:
                      FontWeight.w600,
                      fontFamily:
                      'LibertinusMath',
                    ),
                  ),
                  iconColor: navy,
                  collapsedIconColor: navy,
                  children:
                  options.map((option) {
                    final bool selected =
                        value == option;

                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child:
                      AnimatedContainer(
                        duration:
                        const Duration(
                          milliseconds: 200,
                        ),
                        margin:
                        const EdgeInsets.only(
                          bottom: 6,
                        ),
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 13,
                          vertical: 11,
                        ),
                        decoration:
                        BoxDecoration(
                          color: selected
                              ? navy
                              : cream,
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration:
                              BoxDecoration(
                                color: selected
                                    ? gold
                                    : Colors
                                    .transparent,
                                shape:
                                BoxShape.circle,
                                border:
                                Border.all(
                                  color: selected
                                      ? gold
                                      : navy.withOpacity(
                                    .25,
                                  ),
                                  width: 1.5,
                                ),
                              ),
                              child: selected
                                  ? const Icon(
                                Icons.check,
                                color: navy,
                                size: 13,
                              )
                                  : null,
                            ),

                            const SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: Text(
                                option,
                                textAlign:
                                TextAlign.right,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : navy,
                                  fontSize: 12.5,
                                  fontWeight:
                                  selected
                                      ? FontWeight
                                      .bold
                                      : FontWeight
                                      .w500,
                                  fontFamily:
                                  'LibertinusMath',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }

            // ====================================================
            // SHEET UI
            // ====================================================

            return Directionality(
              textDirection:
              TextDirection.rtl,
              child: Container(
                constraints:
                BoxConstraints(
                  maxHeight:
                  MediaQuery.of(context)
                      .size
                      .height *
                      .86,
                ),
                decoration:
                const BoxDecoration(
                  color: cream,
                  borderRadius:
                  BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.fromLTRB(
                      20,
                      12,
                      20,
                      18,
                    ),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: [
                        // HANDLE
                        Container(
                          width: 44,
                          height: 5,
                          decoration:
                          BoxDecoration(
                            color:
                            navy.withOpacity(
                              .18,
                            ),
                            borderRadius:
                            BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        // TITLE
                        Align(
                          alignment:
                          Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .end,
                            children: [
                              const Text(
                                'تصفية العروض',
                                textAlign:
                                TextAlign.right,
                                style: TextStyle(
                                  color: navy,
                                  fontSize: 23,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontFamily:
                                  'LibertinusMath',
                                ),
                              ),

                              const SizedBox(
                                height: 6,
                              ),

                              Text(
                                'اختر المدينة ثم القسم والخدمة والسعر',
                                textAlign:
                                TextAlign.right,
                                style: TextStyle(
                                  color:
                                  navy.withOpacity(
                                    .55,
                                  ),
                                  fontSize: 13,
                                  fontFamily:
                                  'LibertinusMath',
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 18,
                        ),

                        // FILTER FIELDS
                        Flexible(
                          child:
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                // CITY
                                selectionField(
                                  title: 'المدينة',
                                  icon: Icons
                                      .location_on_outlined,
                                  value: location,
                                  options:
                                  locationOptions,
                                  onSelected:
                                      (value) {
                                    setModalState(
                                          () {
                                        location =
                                            value;

                                        category =
                                        'الكل';

                                        selectedItem =
                                        'الكل';

                                        price =
                                        'الكل';
                                      },
                                    );
                                  },
                                ),

                                // CATEGORY
                                if (location !=
                                    'الكل')
                                  selectionField(
                                    title: 'القسم',
                                    icon:
                                    getCategoryIcon(
                                      category,
                                    ),
                                    value:
                                    category,
                                    options: [
                                      'الكل',
                                      ...categories,
                                    ],
                                    onSelected:
                                        (value) {
                                      setModalState(
                                            () {
                                          category =
                                              value;

                                          selectedItem =
                                          'الكل';

                                          price =
                                          'الكل';
                                        },
                                      );
                                    },
                                  ),

                                // SERVICE / HALL
                                if (location !=
                                    'الكل' &&
                                    category !=
                                        'الكل' &&
                                    items.isNotEmpty)
                                  selectionField(
                                    title: category ==
                                        'قاعات الأفراح'
                                        ? 'القاعة'
                                        : 'الخدمة',
                                    icon: category ==
                                        'قاعات الأفراح'
                                        ? Icons
                                        .account_balance_outlined
                                        : Icons
                                        .business_center_outlined,
                                    value:
                                    selectedItem,
                                    options: items,
                                    onSelected:
                                        (value) {
                                      setModalState(
                                            () {
                                          selectedItem =
                                              value;
                                        },
                                      );
                                    },
                                  ),

                                // PRICE
                                if (location !=
                                    'الكل' &&
                                    category !=
                                        'الكل' &&
                                    selectedItem !=
                                        'الكل')
                                  selectionField(
                                    title:
                                    'نطاق السعر',
                                    icon: Icons
                                        .payments_outlined,
                                    value: price,
                                    options:
                                    priceOptions,
                                    onSelected:
                                        (value) {
                                      setModalState(
                                            () {
                                          price =
                                              value;
                                        },
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // ==================================================
                        // BUTTONS
                        // ==================================================

                        Directionality(
                          textDirection:
                          TextDirection.ltr,
                          child: Row(
                            children: [
                              // CANCEL
                              Expanded(
                                child:
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      sheetContext,
                                    );
                                  },
                                  style:
                                  OutlinedButton
                                      .styleFrom(
                                    minimumSize:
                                    const Size(
                                      double.infinity,
                                      50,
                                    ),
                                    side: BorderSide(
                                      color: navy
                                          .withOpacity(
                                        .18,
                                      ),
                                    ),
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'إلغاء',
                                    style:
                                    TextStyle(
                                      color: navy,
                                      fontWeight:
                                      FontWeight
                                          .w600,
                                      fontFamily:
                                      'LibertinusMath',
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              // APPLY
                              Expanded(
                                flex: 2,
                                child:
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedLocation =
                                          location;

                                      _selectedCategory =
                                          category;

                                      _selectedItem =
                                          selectedItem;

                                      _selectedPrice =
                                          price;
                                    });

                                    Navigator.pop(
                                      sheetContext,
                                    );
                                  },
                                  style:
                                  ElevatedButton
                                      .styleFrom(
                                    backgroundColor:
                                    navy,
                                    foregroundColor:
                                    Colors.white,
                                    minimumSize:
                                    const Size(
                                      double.infinity,
                                      50,
                                    ),
                                    elevation: 0,
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                  child:
                                  const Text(
                                    'تطبيق الفلاتر',
                                    style:
                                    TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontFamily:
                                      'LibertinusMath',
                                    ),
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
              ),
            );
          },
        );
      },
    );
  }

  // ============================================================
  // OFFER CARD
  // ============================================================

  Widget _offerCard({
    required String image,
    required String discount,
    required String category,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.09),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(23),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            // ==================================================
            // IMAGE
            // ==================================================

            Stack(
              children: [
                SizedBox(
                  height: 190,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                // IMAGE GRADIENT
                Positioned.fill(
                  child: DecoratedBox(
                    decoration:
                    BoxDecoration(
                      gradient:
                      LinearGradient(
                        begin:
                        Alignment.topCenter,
                        end:
                        Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          navy.withOpacity(
                            0.58,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // DISCOUNT
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration:
                    BoxDecoration(
                      color: gold,
                      borderRadius:
                      BorderRadius.circular(
                        13,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(
                            0.15,
                          ),
                          blurRadius: 9,
                          offset:
                          const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'خصم $discount',
                      style:
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 10.5,
                        fontWeight:
                        FontWeight.bold,
                        fontFamily:
                        'LibertinusMath',
                      ),
                    ),
                  ),
                ),

                // FAVORITE
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration:
                    BoxDecoration(
                      color: Colors.white
                          .withOpacity(.92),
                      shape:
                      BoxShape.circle,
                    ),
                    child:
                    const Icon(
                      Icons
                          .favorite_border_rounded,
                      color: navy,
                      size: 18,
                    ),
                  ),
                ),

                // CATEGORY
                Positioned(
                  bottom: 14,
                  right: 15,
                  child: Container(
                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration:
                    BoxDecoration(
                      color: Colors.white
                          .withOpacity(.90),
                      borderRadius:
                      BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Text(
                      category,
                      style:
                      const TextStyle(
                        color: navy,
                        fontSize: 9.5,
                        fontWeight:
                        FontWeight.w700,
                        fontFamily:
                        'LibertinusMath',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ==================================================
            // CONTENT
            // ==================================================

            Padding(
              padding:
              const EdgeInsets.fromLTRB(
                17,
                16,
                17,
                17,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow:
                    TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: navy,
                      fontSize: 16,
                      height: 1.35,
                      fontWeight:
                      FontWeight.w700,
                      fontFamily:
                      'LibertinusMath',
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    description,
                    maxLines: 2,
                    overflow:
                    TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                      navy.withOpacity(.55),
                      fontSize: 11.5,
                      height: 1.6,
                      fontFamily:
                      'LibertinusMath',
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 42,
                          child:
                          ElevatedButton(
                            onPressed: () {},
                            style:
                            ElevatedButton
                                .styleFrom(
                              backgroundColor:
                              navy,
                              foregroundColor:
                              gold,
                              elevation: 0,
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  13,
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              children: [
                                Icon(
                                  Icons
                                      .arrow_back_rounded,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'عرض التفاصيل',
                                  style:
                                  TextStyle(
                                    fontSize:
                                    11.5,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontFamily:
                                    'LibertinusMath',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 9,
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
}