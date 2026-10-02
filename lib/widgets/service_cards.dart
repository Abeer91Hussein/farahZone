import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';
import 'package:farah/view/serviceDetailsScreen.dart';

// ========================= SHARED HELPERS =========================
// These are shared across the "Available Soon", "Most Booked" and
// "Special Offers" sections, so they live here and get imported by
// most_booked.dart and special_offers.dart as well.

Widget sectionHeader({
  required String title,
  required String action,
  required VoidCallback onTap,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: const TextStyle(
            color: HomeScreen.navy,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              action,
              style: const TextStyle(
                color: HomeScreen.gold,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_back,
              color: HomeScreen.gold,
              size: 17,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget cardImage({
  required String image,
  required double height,
}) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: HomeScreen.navy.withOpacity(.32),
          blurRadius: 18,
          spreadRadius: 1,
          offset: const Offset(0, 7),
        ),
      ],
    ),
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
}

Widget cardActionButton({
  required String label,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 44,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: HomeScreen.navy,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

void openServiceDetails(
    BuildContext context, {
      required String image,
      required String name,
      required String category,
      required String location,
      required String rating,
      required String description,
      required String price,
      String? availableDate,
      String? bookings,
      String? discount,
      List<String> features = const [],
    }) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ServiceDetailsScreen(
        image: image,
        name: name,
        category: category,
        location: location,
        rating: rating,
        description: description,
        price: price,
        availableDate: availableDate,
        bookings: bookings,
        discount: discount,
        features: features,
      ),
    ),
  );
}

// ========================= AVAILABLE SOON =========================

class ServiceCards extends StatelessWidget {
  const ServiceCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
      child: Column(
        children: [
          sectionHeader(
            title: 'متاح قريباً',
            action: 'عرض الكل',
            onTap: () {},
          ),

          const SizedBox(height: 5),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'أقرب المواعيد',
              style: TextStyle(
                color: HomeScreen.navy.withOpacity(.65),
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(height: 18),

          LayoutBuilder(
            builder: (context, constraints) {
              final cards = [
                _hallCard(
                  context: context,
                  image: 'assets/images/fourSesones.jpg',
                  name: 'Four Seasons Hall',
                  location: 'رام الله',
                  rating: '4.8',
                  date: '12 سبتمبر 2026',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/fourSesones.jpg',
                      name: 'Four Seasons Hall',
                      category: 'قاعات الأفراح',
                      location: 'رام الله',
                      rating: '4.8',
                      availableDate: '12 سبتمبر 2026',
                      price: 'ابتداءً من 2500 ₪',
                      description:
                      'قاعة أفراح مميزة في رام الله، تتميز بتصميم أنيق ومساحة واسعة مناسبة لحفلات الزفاف والمناسبات الخاصة.',
                      features: [
                        'قاعة واسعة ومجهزة بالكامل',
                        'مواقف سيارات',
                        'ديكور أنيق',
                        'خدمة تنظيم الحفلات',
                        'نظام صوت وإضاءة',
                      ],
                    );
                  },
                ),
                _hallCard(
                  context: context,
                  image: 'assets/images/جلوريا.jpg',
                  name: 'Gloria Hall',
                  location: 'نابلس',
                  rating: '4.7',
                  date: '15 سبتمبر 2026',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/جلوريا.jpg',
                      name: 'Gloria Hall',
                      category: 'قاعات الأفراح',
                      location: 'نابلس',
                      rating: '4.7',
                      availableDate: '15 سبتمبر 2026',
                      price: 'ابتداءً من 2200 ₪',
                      description:
                      'قاعة أفراح راقية في نابلس توفر أجواء مميزة لحفلات الزفاف والمناسبات العائلية مع خدمات متكاملة.',
                      features: [
                        'تصميم داخلي فاخر',
                        'قاعة مناسبة للأعداد الكبيرة',
                        'مواقف سيارات',
                        'إضاءة احترافية',
                        'خدمات ضيافة',
                      ],
                    );
                  },
                ),
                _hallCard(
                  context: context,
                  image: 'assets/images/مزايا.jpg',
                  name: 'Mazaya Hall',
                  location: 'رام الله',
                  rating: '4.6',
                  date: '18 سبتمبر 2026',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/مزايا.jpg',
                      name: 'Mazaya Hall',
                      category: 'قاعات الأفراح',
                      location: 'رام الله',
                      rating: '4.6',
                      availableDate: '18 سبتمبر 2026',
                      price: 'ابتداءً من 2000 ₪',
                      description:
                      'قاعة مناسبات عصرية في رام الله، مثالية لحفلات الزفاف والخطوبة والمناسبات الخاصة.',
                      features: [
                        'تصميم عصري',
                        'مساحة واسعة',
                        'مواقف سيارات',
                        'نظام صوت وإضاءة',
                        'إمكانية تخصيص الديكور',
                      ],
                    );
                  },
                ),
              ];

              if (constraints.maxWidth >= 850) {
                return Row(
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 16),
                    Expanded(child: cards[1]),
                    const SizedBox(width: 16),
                    Expanded(child: cards[2]),
                  ],
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 300, child: cards[0]),
                    const SizedBox(width: 16),
                    SizedBox(width: 300, child: cards[1]),
                    const SizedBox(width: 16),
                    SizedBox(width: 300, child: cards[2]),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ========================= HALL CARD =========================

  Widget _hallCard({
    required BuildContext context,
    required String image,
    required String name,
    required String location,
    required String rating,
    required String date,
    required VoidCallback onDetails,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: HomeScreen.navy.withOpacity(.10),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardImage(
            image: image,
            height: 190,
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: HomeScreen.navy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: HomeScreen.navy,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        color:
                        HomeScreen.navy.withOpacity(.55),
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: HomeScreen.gold,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: HomeScreen.navy,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: HomeScreen.gold.withOpacity(.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.event_available_outlined,
                        color: HomeScreen.gold,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: const TextStyle(
                          color: HomeScreen.navy,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                cardActionButton(
                  label: 'عرض التفاصيل',
                  onPressed: onDetails,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}