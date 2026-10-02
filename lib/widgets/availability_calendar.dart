import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:farah/view/homeScreen.dart';

class _CalendarWeekDay extends StatelessWidget {
  final String text;

  const _CalendarWeekDay(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: HomeScreen.navy,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class AvailabilityCalendar extends StatefulWidget {
  final Set<String> selectedCategories;
  final ValueChanged<Set<String>> onCategoriesChanged;

  const AvailabilityCalendar({
    super.key,
    required this.selectedCategories,
    required this.onCategoriesChanged,
  });

  @override
  State<AvailabilityCalendar> createState() =>
      _AvailabilityCalendarState();
}

class _AvailabilityCalendarState extends State<AvailabilityCalendar> {
  // ============================================================
  // FILTERS
  // ============================================================

  String _selectedLocation = 'الكل';
  String _selectedPrice = 'الكل';

  // ============================================================
  // CALENDAR STATE
  // ============================================================

  DateTime _calendarMonth = DateTime(2026, 9);
  DateTime? _selectedDate;

  bool _detailOpen = false;

  // ============================================================
  // SCROLL / SWIPE CONTROL
  // ============================================================

  bool _wheelLocked = false;
  bool _touchMonthLocked = false;

  // ============================================================
  // SELECTED CATEGORIES
  // ============================================================

  Set<String> get _selectedCategories => widget.selectedCategories;

  static const List<Map<String, dynamic>> _categoryMeta = [
    {
      'name': 'قاعات الأفراح',
      'icon': Icons.account_balance_outlined,
    },
    {
      'name': 'صالونات التجميل',
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'التزيين والديكور',
      'icon': Icons.auto_awesome_outlined,
    },
    {
      'name': 'تأجير السيارات',
      'icon': Icons.local_taxi_outlined,
    },
    {
      'name': 'قاعات الفنادق',
      'icon': Icons.hotel_outlined,
    },
  ];

  // ============================================================
  // MONTH NAME
  // ============================================================

  String _monthName(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    return months[month - 1];
  }

  String _arabicMonthName(int month) {
    return _monthName(month);
  }

  String _formatArabicDate(DateTime date) {
    return '${date.day} ${_arabicMonthName(date.month)} ${date.year}';
  }

  // ============================================================
  // MONTH / YEAR PICKER
  // ============================================================

  void _showMonthYearPicker() {
    int selectedYear = _calendarMonth.year;
    int selectedMonth = _calendarMonth.month;

    const List<String> months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    final int currentYear = DateTime.now().year;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 22),
              decoration: const BoxDecoration(
                color: HomeScreen.cream,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 5,
                      decoration: BoxDecoration(
                        color: HomeScreen.navy.withOpacity(.18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'اختيار التاريخ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: HomeScreen.navy,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'اختر السنة والشهر لعرض المواعيد المتاحة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: HomeScreen.navy.withOpacity(.55),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'السنة',
                        style: TextStyle(
                          color: HomeScreen.navy.withOpacity(.65),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      height: 48,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          final int year = currentYear + index;

                          final bool selected = year == selectedYear;

                          return GestureDetector(
                            onTap: () {
                              setModalState(() {
                                selectedYear = year;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              width: 72,
                              margin: const EdgeInsets.only(left: 7),
                              decoration: BoxDecoration(
                                color: selected
                                    ? HomeScreen.navy
                                    : HomeScreen.cream,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selected
                                      ? HomeScreen.navy
                                      : HomeScreen.navy.withOpacity(.12),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '$year',
                                  style: TextStyle(
                                    color: selected
                                        ? HomeScreen.cream
                                        : HomeScreen.navy,
                                    fontSize: 13,
                                    fontWeight: selected
                                        ? FontWeight.bold
                                        : FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 18),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'الشهر',
                        style: TextStyle(
                          color: HomeScreen.navy.withOpacity(.65),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2.3,
                      ),
                      itemBuilder: (context, index) {
                        final int month = index + 1;

                        final bool selected = month == selectedMonth;

                        return GestureDetector(
                          onTap: () {
                            setModalState(() {
                              selectedMonth = month;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            decoration: BoxDecoration(
                              color: selected
                                  ? HomeScreen.navy
                                  : HomeScreen.cream,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: selected
                                    ? HomeScreen.navy
                                    : HomeScreen.navy.withOpacity(.12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                months[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selected
                                      ? HomeScreen.cream
                                      : HomeScreen.navy,
                                  fontSize: 12,
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _calendarMonth = DateTime(
                              selectedYear,
                              selectedMonth,
                            );

                            _selectedDate = null;
                            _detailOpen = false;
                          });

                          Navigator.pop(sheetContext);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HomeScreen.navy,
                          foregroundColor: HomeScreen.cream,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'عرض المواعيد',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ============================================================
  // CATEGORY CHIPS
  // ============================================================

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: _categoryMeta.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final meta = _categoryMeta[i];

          final String name = meta['name'] as String;

          final IconData icon = meta['icon'] as IconData;

          final bool selected =
          _selectedCategories.contains(name);

          return GestureDetector(
            onTap: () {
              final updated =
              Set<String>.from(_selectedCategories);

              if (selected) {
                updated.remove(name);
              } else {
                updated.add(name);
              }

              widget.onCategoriesChanged(updated);

              setState(() {
                _selectedDate = null;
                _detailOpen = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding:
              const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: selected
                    ? HomeScreen.navy
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected
                      ? HomeScreen.navy
                      : HomeScreen.navy.withOpacity(.15),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 14,
                    color: selected
                        ? HomeScreen.gold
                        : HomeScreen.navy,
                  ),

                  const SizedBox(width: 6),

                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? Colors.white
                          : HomeScreen.navy,
                    ),
                  ),

                  if (selected) ...[
                    const SizedBox(width: 6),

                    GestureDetector(
                      onTap: () {
                        final updated =
                        Set<String>.from(_selectedCategories)
                          ..remove(name);

                        widget.onCategoriesChanged(updated);

                        setState(() {
                          _selectedDate = null;
                          _detailOpen = false;
                        });
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 13,
                        color: HomeScreen.gold.withOpacity(.9),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // COMPACT FILTERS
  // ============================================================

  Widget _buildCompactFilters() {
    return SizedBox(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          _compactFilterChip(
            icon: Icons.location_on_outlined,
            label: _selectedLocation == 'الكل'
                ? 'الموقع'
                : _selectedLocation,
            active: _selectedLocation != 'الكل',
            onTap: _showLocationFilter,
          ),

          const SizedBox(width: 7),

          _compactFilterChip(
            icon: Icons.payments_outlined,
            label: _selectedPrice == 'الكل'
                ? 'السعر'
                : _selectedPrice,
            active: _selectedPrice != 'الكل',
            onTap: _showPriceFilter,
          ),
        ],
      ),
    );
  }

  Widget _compactFilterChip({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: active
              ? HomeScreen.navy
              : HomeScreen.navy.withOpacity(.055),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: active
                ? HomeScreen.navy
                : HomeScreen.navy.withOpacity(.10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: active
                  ? HomeScreen.gold
                  : HomeScreen.navy,
            ),

            const SizedBox(width: 5),

            Text(
              label,
              style: TextStyle(
                color: active
                    ? Colors.white
                    : HomeScreen.navy,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // LOCATION FILTER
  // ============================================================

  void _showLocationFilter() {
    const locations = [
      'الكل',
      'رام الله',
      'نابلس',
      'القدس',
      'بيت لحم',
      'الخليل',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding:
            const EdgeInsets.fromLTRB(18, 12, 18, 20),
            decoration: const BoxDecoration(
              color: HomeScreen.cream,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(26),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                      HomeScreen.navy.withOpacity(.18),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الموقع',
                      style: TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...locations.map(
                        (location) {
                      final bool selected =
                          location == _selectedLocation;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedLocation = location;
                            _selectedDate = null;
                            _detailOpen = false;
                          });

                          Navigator.pop(sheetContext);
                        },
                        child: Container(
                          margin:
                          const EdgeInsets.only(bottom: 7),
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? HomeScreen.navy
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected
                                    ? Icons
                                    .check_circle_rounded
                                    : Icons
                                    .radio_button_unchecked,
                                size: 18,
                                color: selected
                                    ? HomeScreen.gold
                                    : HomeScreen.navy
                                    .withOpacity(.25),
                              ),

                              const SizedBox(width: 9),

                              Expanded(
                                child: Text(
                                  location,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : HomeScreen.navy,
                                    fontSize: 12.5,
                                    fontWeight: selected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // PRICE FILTER
  // ============================================================

  void _showPriceFilter() {
    const prices = [
      'الكل',
      'أقل من 500 ₪',
      '500 - 1000 ₪',
      '1000 - 2000 ₪',
      '2000 - 3000 ₪',
      'أكثر من 3000 ₪',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding:
            const EdgeInsets.fromLTRB(18, 12, 18, 20),
            decoration: const BoxDecoration(
              color: HomeScreen.cream,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(26),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                      HomeScreen.navy.withOpacity(.18),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'نطاق السعر',
                      style: TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...prices.map(
                        (price) {
                      final bool selected =
                          price == _selectedPrice;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPrice = price;
                            _selectedDate = null;
                            _detailOpen = false;
                          });

                          Navigator.pop(sheetContext);
                        },
                        child: Container(
                          margin:
                          const EdgeInsets.only(bottom: 7),
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? HomeScreen.navy
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selected
                                    ? Icons
                                    .check_circle_rounded
                                    : Icons
                                    .radio_button_unchecked,
                                size: 18,
                                color: selected
                                    ? HomeScreen.gold
                                    : HomeScreen.navy
                                    .withOpacity(.25),
                              ),

                              const SizedBox(width: 9),

                              Expanded(
                                child: Text(
                                  price,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : HomeScreen.navy,
                                    fontSize: 12.5,
                                    fontWeight: selected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final int year = _calendarMonth.year;
    final int month = _calendarMonth.month;

    final DateTime firstDayOfMonth =
    DateTime(year, month, 1);

    final int startingWeekday =
        firstDayOfMonth.weekday % 7;

    final int daysInMonth =
        DateTime(year, month + 1, 0).day;

    const List<String> weekdays = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
    ];

    final bool anyCategorySelected =
        _selectedCategories.isNotEmpty;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        14,
        14,
        14,
        12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: HomeScreen.navy.withOpacity(.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ======================================================
          // HEADER
          // ======================================================

          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                const Spacer(),

                GestureDetector(
                  onTap: _showMonthYearPicker,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${_monthName(month)} $year',
                        style: const TextStyle(
                          color: HomeScreen.navy,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 2),

                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: HomeScreen.navy,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'الأجندة',
                    style: TextStyle(
                      color: HomeScreen.navy,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ======================================================
          // COMPACT FILTERS
          // ======================================================

          _buildCompactFilters(),

          const SizedBox(height: 10),

          // ======================================================
          // CATEGORY CHIPS
          // ======================================================

          _buildCategoryChips(),

          const SizedBox(height: 10),

          // ======================================================
          // MONTH ARROWS
          // ======================================================

          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    color: HomeScreen.navy,
                    size: 20,
                  ),
                  onPressed: _previousMonth,
                ),

                const Spacer(),

                Text(
                  'اسحب لليمين أو اليسار لتغيير الشهر',
                  style: TextStyle(
                    color: HomeScreen.navy.withOpacity(.35),
                    fontSize: 9.5,
                  ),
                ),

                const Spacer(),

                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  icon: const Icon(
                    Icons.chevron_right_rounded,
                    color: HomeScreen.navy,
                    size: 20,
                  ),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),

          const SizedBox(height: 2),

          // ======================================================
          // SCROLLABLE CALENDAR
          // ======================================================

          _buildCalendarMonthScroller(
            weekdays: weekdays,
            year: year,
            month: month,
            startingWeekday: startingWeekday,
            daysInMonth: daysInMonth,
            anyCategorySelected: anyCategorySelected,
          ),

          const SizedBox(height: 8),

          // ======================================================
          // LEGEND
          // ======================================================

          if (!anyCategorySelected)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: HomeScreen.gold,
                          width: 2,
                        ),
                      ),
                    ),

                    const SizedBox(width: 4),

                    const Text(
                      'متاح',
                      style: TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 14),

                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: HomeScreen.navy,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 4),

                    const Text(
                      'محجوز',
                      style: TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            Text(
              'الرقم أسفل كل يوم = عدد المتاح لكل قسم محدد',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HomeScreen.navy.withOpacity(.5),
                fontSize: 9.5,
              ),
            ),

          // ======================================================
          // DETAIL PANEL
          // ======================================================

          if (_detailOpen && _selectedDate != null)
            _buildDetailPanel(),
        ],
      ),
    );
  }

  // ============================================================
  // HORIZONTAL MONTH SWIPE CALENDAR
  // ============================================================

  Widget _buildCalendarMonthScroller({
    required List<String> weekdays,
    required int year,
    required int month,
    required int startingWeekday,
    required int daysInMonth,
    required bool anyCategorySelected,
  }) {
    return Listener(
      // ========================================================
      // MOUSE / TRACKPAD
      // ========================================================

      onPointerSignal: (event) {
        if (event is! PointerScrollEvent) {
          return;
        }

        if (_wheelLocked) {
          return;
        }

        final double horizontal =
            event.scrollDelta.dx;

        // Vertical scrolling is intentionally ignored.
        if (horizontal.abs() < 8) {
          return;
        }

        _wheelLocked = true;

        if (horizontal > 0) {
          _previousMonth();
        } else {
          _nextMonth();
        }

        Future.delayed(
          const Duration(milliseconds: 500),
              () {
            if (mounted) {
              _wheelLocked = false;
            }
          },
        );
      },

      child: GestureDetector(
        // ========================================================
        // HORIZONTAL TOUCH SWIPE
        // ========================================================

        onHorizontalDragEnd: (details) {
          final double velocity =
              details.primaryVelocity ?? 0;

          if (velocity.abs() < 150) {
            return;
          }

          if (_touchMonthLocked) {
            return;
          }

          _touchMonthLocked = true;

          if (velocity < 0) {
            _nextMonth();
          } else {
            _previousMonth();
          }

          Future.delayed(
            const Duration(milliseconds: 500),
                () {
              if (mounted) {
                _touchMonthLocked = false;
              }
            },
          );
        },

        child: Column(
          children: [
            // ==================================================
            // WEEKDAYS
            // ==================================================

            Row(
              children: weekdays.map((day) {
                return Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        color:
                        HomeScreen.navy.withOpacity(.60),
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 7),

            // ==================================================
            // CALENDAR DAYS
            // ==================================================

            AnimatedSwitcher(
              duration:
              const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder:
                  (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: GridView.builder(
                key: ValueKey('$year-$month'),
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount:
                startingWeekday + daysInMonth,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 2,
                  childAspectRatio:
                  anyCategorySelected
                      ? 0.78
                      : 1.25,
                ),
                itemBuilder: (context, index) {
                  // =================================================
                  // EMPTY DAYS
                  // =================================================

                  if (index < startingWeekday) {
                    return const SizedBox();
                  }

                  final int day =
                      index - startingWeekday + 1;

                  final DateTime date = DateTime(
                    year,
                    month,
                    day,
                  );

                  final bool selected =
                      _selectedDate != null &&
                          _selectedDate!.year ==
                              date.year &&
                          _selectedDate!.month ==
                              date.month &&
                          _selectedDate!.day ==
                              date.day;

                  void onTapDay() {
                    setState(() {
                      _selectedDate = date;
                      _detailOpen = true;
                    });
                  }

                  // =================================================
                  // CATEGORY MODE
                  // =================================================

                  if (anyCategorySelected) {
                    return GestureDetector(
                      onTap: onTapDay,
                      child: AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 160),
                        margin:
                        const EdgeInsets.all(1.5),
                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? HomeScreen.navy
                              : HomeScreen.cream,
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              '$day',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight:
                                FontWeight.bold,
                                color: selected
                                    ? Colors.white
                                    : HomeScreen.navy,
                              ),
                            ),

                            const SizedBox(height: 1),

                            ..._selectedCategories.map(
                                  (cat) {
                                final meta =
                                _categoryMeta
                                    .firstWhere(
                                      (m) =>
                                  m['name'] ==
                                      cat,
                                );

                                final count =
                                _countAvailable(
                                  category: cat,
                                  date: date,
                                );

                                return Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    vertical: .5,
                                  ),
                                  child: Row(
                                    mainAxisSize:
                                    MainAxisSize.min,
                                    children: [
                                      Icon(
                                        meta['icon']
                                        as IconData,
                                        size: 7.5,
                                        color: selected
                                            ? HomeScreen
                                            .gold
                                            : HomeScreen
                                            .navy
                                            .withOpacity(
                                          .55,
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 2,
                                      ),

                                      Text(
                                        '$count',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight:
                                          FontWeight
                                              .w800,
                                          color: selected
                                              ? Colors.white
                                              : HomeScreen
                                              .navy,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // =================================================
                  // NORMAL MODE
                  // =================================================

                  final bool available =
                  _isDateAvailable(date);

                  return GestureDetector(
                    onTap: () {
                      if (!available) {
                        return;
                      }

                      onTapDay();
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 160),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: available
                              ? Colors.white
                              : HomeScreen.navy,
                          shape: BoxShape.circle,
                          border: available
                              ? Border.all(
                            color:
                            HomeScreen.gold,
                            width: 1.5,
                          )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            '$day',
                            style: TextStyle(
                              color: available
                                  ? HomeScreen.navy
                                  : Colors.white,
                              fontSize: 10,
                              fontWeight:
                              selected ||
                                  !available
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DETAIL PANEL
  // ============================================================

  Widget _buildDetailPanel() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: HomeScreen.cream,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوفر المشترك — '
                    '${_selectedDate!.day} '
                    '${_monthName(_selectedDate!.month)}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: HomeScreen.navy,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _detailOpen = false;
                  });
                },
                child: Icon(
                  Icons.close_rounded,
                  size: 17,
                  color:
                  HomeScreen.navy.withOpacity(.5),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          if (_selectedCategories.isEmpty)
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'اختر قسمًا واحدًا أو أكثر لعرض التوفر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                  HomeScreen.navy.withOpacity(.55),
                  fontSize: 12.5,
                ),
              ),
            )
          else
            ..._selectedCategories.map(
                  (cat) {
                final meta =
                _categoryMeta.firstWhere(
                      (m) => m['name'] == cat,
                );

                final count = _countAvailable(
                  category: cat,
                  date: _selectedDate!,
                );

                return Padding(
                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            meta['icon'] as IconData,
                            size: 15,
                            color: HomeScreen.navy,
                          ),

                          const SizedBox(width: 7),

                          Text(
                            cat,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              HomeScreen.navy,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        '$count متاح',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                          HomeScreen.navy
                              .withOpacity(.6),
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          if (_selectedCategories.isNotEmpty) ...[
            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO:
                  // Navigate to results
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  HomeScreen.gold,
                  foregroundColor:
                  HomeScreen.navy,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'عرض كل النتائج لهذا اليوم',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ============================================================
  // MONTH NAVIGATION
  // ============================================================

  void _previousMonth() {
    setState(() {
      _calendarMonth = DateTime(
        _calendarMonth.year,
        _calendarMonth.month - 1,
      );

      _selectedDate = null;
      _detailOpen = false;
    });
  }

  void _nextMonth() {
    setState(() {
      _calendarMonth = DateTime(
        _calendarMonth.year,
        _calendarMonth.month + 1,
      );

      _selectedDate = null;
      _detailOpen = false;
    });
  }

  // ============================================================
  // SERVICE DATA
  // ============================================================

  List<Map<String, dynamic>> get _allServices => [
    {
      'name': 'Four Seasons Hall',
      'location': 'رام الله',
      'category': 'قاعات الأفراح',
      'price': 2500,
      'dates': [12, 16, 20, 24, 27],
    },
    {
      'name': 'Gloria Hall',
      'location': 'نابلس',
      'category': 'قاعات الأفراح',
      'price': 2200,
      'dates': [15, 19, 22, 26, 29],
    },
    {
      'name': 'Mazaya Hall',
      'location': 'رام الله',
      'category': 'قاعات الأفراح',
      'price': 2000,
      'dates': [18, 21, 25, 28, 30],
    },
    {
      'name': 'Beauty Salon',
      'location': 'رام الله',
      'category': 'صالونات التجميل',
      'price': 350,
      'dates': [5, 10, 14, 18, 23, 27],
    },
    {
      'name': 'Royal Beauty Salon',
      'location': 'رام الله',
      'category': 'صالونات التجميل',
      'price': 500,
      'dates': [7, 12, 17, 21, 26],
    },
    {
      'name': 'Luna Beauty',
      'location': 'رام الله',
      'category': 'صالونات التجميل',
      'price': 700,
      'dates': [3, 9, 15, 20, 25],
    },
    {
      'name': 'Nablus Beauty Salon',
      'location': 'نابلس',
      'category': 'صالونات التجميل',
      'price': 400,
      'dates': [6, 11, 16, 22, 28],
    },
    {
      'name': 'Elegant Decoration',
      'location': 'رام الله',
      'category': 'التزيين والديكور',
      'price': 800,
      'dates': [4, 8, 13, 19, 24, 29],
    },
    {
      'name': 'Royal Decor',
      'location': 'رام الله',
      'category': 'التزيين والديكور',
      'price': 1200,
      'dates': [2, 9, 16, 23, 30],
    },
    {
      'name': 'Golden Events Decor',
      'location': 'رام الله',
      'category': 'التزيين والديكور',
      'price': 1800,
      'dates': [6, 12, 18, 25],
    },
    {
      'name': 'Nablus Events Decor',
      'location': 'نابلس',
      'category': 'التزيين والديكور',
      'price': 900,
      'dates': [5, 10, 15, 21, 27],
    },
    {
      'name': 'Mercedes S-Class',
      'location': 'رام الله',
      'category': 'تأجير السيارات',
      'price': 600,
      'dates': [1, 5, 11, 17, 22, 28],
    },
    {
      'name': 'BMW 7 Series',
      'location': 'رام الله',
      'category': 'تأجير السيارات',
      'price': 750,
      'dates': [3, 8, 14, 20, 26],
    },
    {
      'name': 'Mercedes V-Class',
      'location': 'رام الله',
      'category': 'تأجير السيارات',
      'price': 900,
      'dates': [4, 10, 16, 21, 27],
    },
    {
      'name': 'BMW 7 Series',
      'location': 'نابلس',
      'category': 'تأجير السيارات',
      'price': 700,
      'dates': [6, 13, 19, 24, 29],
    },
    {
      'name': 'Grand Hotel Hall',
      'location': 'رام الله',
      'category': 'قاعات الفنادق',
      'price': 3000,
      'dates': [7, 14, 21, 28],
    },
    {
      'name': 'Royal Palace Hall',
      'location': 'رام الله',
      'category': 'قاعات الفنادق',
      'price': 3500,
      'dates': [5, 12, 19, 26],
    },
    {
      'name': 'Golden Hotel Hall',
      'location': 'رام الله',
      'category': 'قاعات الفنادق',
      'price': 2800,
      'dates': [3, 10, 17, 24],
    },
    {
      'name': 'Royal Palace Hall',
      'location': 'القدس',
      'category': 'قاعات الفنادق',
      'price': 4000,
      'dates': [8, 15, 22, 29],
    },
  ];

  // ============================================================
  // DATE AVAILABILITY
  // ============================================================

  bool _isDateAvailable(DateTime date) {
    if (date.month != _calendarMonth.month ||
        date.year != _calendarMonth.year) {
      return false;
    }

    final filteredServices =
    _allServices.where((service) {
      final location =
      service['location'] as String;

      final price =
      service['price'] as int;

      if (_selectedLocation != 'الكل' &&
          location != _selectedLocation) {
        return false;
      }

      if (!_priceMatches(price)) {
        return false;
      }

      return true;
    }).toList();

    if (filteredServices.isEmpty) {
      return false;
    }

    return filteredServices.any((service) {
      final dates =
      service['dates'] as List<int>;

      return dates.contains(date.day);
    });
  }

  // ============================================================
  // CATEGORY AVAILABILITY COUNT
  // ============================================================

  int _countAvailable({
    required String category,
    required DateTime date,
  }) {
    if (date.month != _calendarMonth.month ||
        date.year != _calendarMonth.year) {
      return 0;
    }

    final matches = _allServices.where((service) {
      if (service['category'] != category) {
        return false;
      }

      final location =
      service['location'] as String;

      if (_selectedLocation != 'الكل' &&
          location != _selectedLocation) {
        return false;
      }

      final price =
      service['price'] as int;

      if (!_priceMatches(price)) {
        return false;
      }

      return true;
    });

    return matches
        .where(
          (service) =>
          (service['dates'] as List<int>)
              .contains(date.day),
    )
        .length;
  }

  // ============================================================
  // PRICE
  // ============================================================

  bool _priceMatches(int price) {
    switch (_selectedPrice) {
      case 'أقل من 500 ₪':
        return price < 500;

      case '500 - 1000 ₪':
        return price >= 500 && price <= 1000;

      case '1000 - 2000 ₪':
        return price >= 1000 && price <= 2000;

      case '2000 - 3000 ₪':
        return price >= 2000 && price <= 3000;

      case 'أكثر من 3000 ₪':
        return price > 3000;

      case 'الكل':
      default:
        return true;
    }
  }
}