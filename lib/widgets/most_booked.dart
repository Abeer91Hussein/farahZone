import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';
import 'service_cards.dart';

class MostBookedSection extends StatelessWidget {
  const MostBookedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
      child: Column(
        children: [
          sectionHeader(
            title: 'الأكثر حجزاً',
            action: 'عرض الكل',
            onTap: () {},
          ),

          const SizedBox(height: 18),

          LayoutBuilder(
            builder: (context, constraints) {
              final cards = [
                _mostBookedCard(
                  context: context,
                  image: 'assets/images/fourSesones.jpg',
                  name: 'Four Seasons Hall',
                  location: 'رام الله',
                  rating: '4.9',
                  bookings: '124 حجز',
                  rank: 1,
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/fourSesones.jpg',
                      name: 'Four Seasons Hall',
                      category: 'قاعات الأفراح',
                      location: 'رام الله',
                      rating: '4.9',
                      bookings: '124 حجز',
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
                _mostBookedCard(
                  context: context,
                  image: 'assets/images/جلوريا.jpg',
                  name: 'Gloria Hall',
                  location: 'نابلس',
                  rating: '4.8',
                  bookings: '108 حجز',
                  rank: 2,
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/جلوريا.jpg',
                      name: 'Gloria Hall',
                      category: 'قاعات الأفراح',
                      location: 'نابلس',
                      rating: '4.8',
                      bookings: '108 حجز',
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
                _mostBookedCard(
                  context: context,
                  image: 'assets/images/مزايا.jpg',
                  name: 'Mazaya Hall',
                  location: 'رام الله',
                  rating: '4.7',
                  bookings: '96 حجز',
                  rank: 3,
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/مزايا.jpg',
                      name: 'Mazaya Hall',
                      category: 'قاعات الأفراح',
                      location: 'رام الله',
                      rating: '4.7',
                      bookings: '96 حجز',
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

  // ========================= MOST BOOKED CARD =========================

  Widget _mostBookedCard({
    required BuildContext context,
    required String image,
    required String name,
    required String location,
    required String rating,
    required String bookings,
    required int rank,
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
          Stack(
            children: [
              cardImage(
                image: image,
                height: 190,
              ),

              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: HomeScreen.gold,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '#$rank',
                      style: const TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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

                Row(
                  children: [
                    const Icon(
                      Icons.event_available,
                      color: HomeScreen.gold,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      bookings,
                      style: const TextStyle(
                        color: HomeScreen.navy,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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