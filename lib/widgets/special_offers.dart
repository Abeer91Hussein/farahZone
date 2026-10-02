import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';
import 'service_cards.dart';
import 'package:farah/view/offersScreen.dart';

class SpecialOffersSection extends StatelessWidget {
  const SpecialOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
      child: Column(
        children: [
          sectionHeader(
            title: 'عروض خاصة',
            action: 'عرض الكل',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 18),

          LayoutBuilder(
            builder: (context, constraints) {
              final cards = [
                _offerCard(
                  context: context,
                  image: 'assets/images/fourSesones.jpg',
                  category: 'قاعات الأفراح',
                  title: 'خصم 20% على باقات الأفراح',
                  description:
                  'احجزي باقة احتفالك واستفيدي من خصم خاص.',
                  discount: 'خصم 20%',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/fourSesones.jpg',
                      name: 'باقة أفراح Four Seasons',
                      category: 'قاعات الأفراح',
                      location: 'رام الله',
                      rating: '4.8',
                      price: 'ابتداءً من 2000 ₪',
                      discount: 'خصم 20%',
                      description:
                      'احجزي باقة احتفالك واستفيدي من خصم خاص.',
                      features: [
                        'حجز القاعة',
                        'تنسيق الطاولات',
                        'إضاءة وصوت',
                        'خدمات الضيافة',
                        'إمكانية تخصيص الديكور',
                      ],
                    );
                  },
                ),
                _offerCard(
                  context: context,
                  image: 'assets/images/makeup.jpg',
                  category: 'التجميل والمكياج',
                  title: 'باقة مكياج العروس',
                  description:
                  'باقة مكياج خاصة للعروس بسعر حصري.',
                  discount: 'خصم 15%',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image: 'assets/images/makeup.jpg',
                      name: 'باقة مكياج العروس',
                      category: 'صالونات التجميل',
                      location: 'رام الله',
                      rating: '4.9',
                      price: 'ابتداءً من 300 ₪',
                      discount: 'خصم 15%',
                      description:
                      'باقة مكياج خاصة للعروس بسعر حصري.',
                      features: [
                        'مكياج عروس',
                        'تجربة قبل الزفاف',
                        'مستحضرات عالية الجودة',
                        'اختيار الإطلالة',
                        'تجهيز خاص ليوم الزفاف',
                      ],
                    );
                  },
                ),
                _offerCard(
                  context: context,
                  image: 'assets/images/wedding-decor.jpg',
                  category: 'الديكور',
                  title: 'ديكور حفلات الزفاف',
                  description:
                  'اصنعي الأجواء التي تحلمين بها مع باقة الديكور الخاصة بنا.',
                  discount: 'خصم 10%',
                  onDetails: () {
                    openServiceDetails(
                      context,
                      image:
                      'assets/images/wedding-decor.jpg',
                      name: 'باقة ديكور حفلات الزفاف',
                      category: 'التزيين والديكور',
                      location: 'رام الله',
                      rating: '4.8',
                      price: 'ابتداءً من 800 ₪',
                      discount: 'خصم 10%',
                      description:
                      'اصنعي الأجواء التي تحلمين بها مع باقة الديكور الخاصة بنا.',
                      features: [
                        'تنسيق الطاولات',
                        'ديكور المسرح',
                        'تنسيق الورود',
                        'الإضاءة والزينة',
                        'تصميم حسب الطلب',
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

  // ========================= OFFER CARD =========================

  Widget _offerCard({
    required BuildContext context,
    required String image,
    required String category,
    required String title,
    required String description,
    required String discount,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: HomeScreen.gold,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: HomeScreen.navy,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
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
                  category,
                  style: const TextStyle(
                    color: HomeScreen.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  title,
                  style: const TextStyle(
                    color: HomeScreen.navy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: HomeScreen.navy.withOpacity(.55),
                    fontSize: 12,
                    height: 1.5,
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