import 'package:flutter/material.dart';
import 'package:farah/theme/appColors.dart';

class EventFilterSection extends StatefulWidget {
  const EventFilterSection({super.key});

  @override
  State<EventFilterSection> createState() => _EventFilterSectionState();
}

class _EventFilterSectionState extends State<EventFilterSection> {
  String? eventType;
  String? location;
  DateTime? selectedDate;

  String venueType = 'Any';

  double minPrice = 0;
  double maxPrice = 2000;

  int guests = 50;

  final List<String> cities = [
    'Ramallah',
    'Jerusalem',
    'Nablus',
    'Hebron',
    'Bethlehem',
  ];

  final List<String> venueTypes = [
    'Any',
    'Indoor',
    'Outdoor',
  ];

  final List<String> eventTypes = [
    'Wedding',
    'Birthday',
    'Graduation',
    'Engagement',
    'Corporate',
    'Other',
  ];

  String _advancedFilterLabel() {
    final venue = venueType == 'Any' ? 'Any venue' : venueType;

    final guestsText = '$guests guests';

    String priceText;

    if (minPrice == 0 && maxPrice == 2000) {
      priceText = 'Any price';
    } else if (maxPrice == 2000) {
      priceText = '\$${minPrice.round()}+';
    } else {
      priceText =
      '\$${minPrice.round()}–\$${maxPrice.round()}';
    }

    return '$venue • $guestsText • $priceText';
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void performSearch() {
    if (eventType == null &&
        location == null &&
        selectedDate == null &&
        venueType == 'Any' &&
        minPrice == 0 &&
        maxPrice == 2000 &&
        guests == 50) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select at least one filter',
          ),
          backgroundColor: AppColors.burgundy,
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Searching for the perfect venues...',
        ),
        backgroundColor: AppColors.burgundy,
      ),
    );
  }

  void _showAdvancedFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 45,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.cardBorder,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'More Filters',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Venue Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 10,
                      children: venueTypes.map((type) {
                        final selected = venueType == type;

                        return ChoiceChip(
                          label: Text(type),
                          selected: selected,
                          onSelected: (_) {
                            setSheetState(() {
                              venueType = type;
                            });

                            setState(() {});
                          },
                          selectedColor: AppColors.burgundy,
                          labelStyle: TextStyle(
                            color: selected
                                ? Colors.white
                                : AppColors.textDark,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Number of Guests',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),

                    Slider(
                      value: guests.toDouble(),
                      min: 10,
                      max: 1000,
                      divisions: 99,
                      activeColor: AppColors.burgundy,
                      onChanged: (value) {
                        setSheetState(() {
                          guests = value.round();
                        });

                        setState(() {});
                      },
                    ),

                    Center(
                      child: Text(
                        '$guests guests',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.burgundy,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Price Range',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),

                    RangeSlider(
                      values: RangeValues(
                        minPrice,
                        maxPrice,
                      ),
                      min: 0,
                      max: 2000,
                      divisions: 20,
                      activeColor: AppColors.burgundy,
                      onChanged: (values) {
                        setSheetState(() {
                          minPrice = values.start;
                          maxPrice = values.end;
                        });

                        setState(() {});
                      },
                    ),

                    Center(
                      child: Text(
                        '\$${minPrice.round()} - \$${maxPrice.round()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.burgundy,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.burgundy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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

  Widget _buildFilterItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.cardBorder,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.burgundy,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
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

  Widget _buildMobileItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.cardBorder,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.burgundy,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.cardBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 800;

          if (isWide) {
            return Column(
              children: [
                Row(
                  children: [
                    _buildFilterItem(
                      icon: Icons.celebration_outlined,
                      title: 'Event Type',
                      value: eventType ?? 'Any event',
                      onTap: () {
                        _showEventTypes();
                      },
                    ),

                    const SizedBox(width: 12),

                    _buildFilterItem(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      value: location ?? 'Any location',
                      onTap: () {
                        _showLocations();
                      },
                    ),

                    const SizedBox(width: 12),

                    _buildFilterItem(
                      icon: Icons.calendar_month_outlined,
                      title: 'Date',
                      value: selectedDate == null
                          ? 'Any date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                      onTap: _selectDate,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                _buildMobileItem(
                  icon: Icons.tune_rounded,
                  title: 'More Filters',
                  value: _advancedFilterLabel(),
                  onTap: _showAdvancedFilters,
                ),

                const SizedBox(height: 15),

                _searchButton(),
              ],
            );
          }

          return Column(
            children: [
              _buildMobileItem(
                icon: Icons.celebration_outlined,
                title: 'Event Type',
                value: eventType ?? 'Any event',
                onTap: _showEventTypes,
              ),

              const SizedBox(height: 10),

              _buildMobileItem(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: location ?? 'Any location',
                onTap: _showLocations,
              ),

              const SizedBox(height: 10),

              _buildMobileItem(
                icon: Icons.calendar_month_outlined,
                title: 'Date',
                value: selectedDate == null
                    ? 'Any date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                onTap: _selectDate,
              ),

              const SizedBox(height: 10),

              _buildMobileItem(
                icon: Icons.tune_rounded,
                title: 'More Filters',
                value: _advancedFilterLabel(),
                onTap: _showAdvancedFilters,
              ),

              const SizedBox(height: 15),

              _searchButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _searchButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: performSearch,
        icon: const Icon(Icons.search),
        label: const Text(
          'Search All',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.burgundy,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  void _showEventTypes() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cream,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: eventTypes.map((type) {
            return ListTile(
              leading: const Icon(
                Icons.celebration,
                color: AppColors.burgundy,
              ),
              title: Text(type),
              onTap: () {
                setState(() {
                  eventType = type;
                });

                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showLocations() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cream,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: cities.map((city) {
            return ListTile(
              leading: const Icon(
                Icons.location_on,
                color: AppColors.burgundy,
              ),
              title: Text(city),
              onTap: () {
                setState(() {
                  location = city;
                });

                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}