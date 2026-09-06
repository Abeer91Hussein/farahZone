import 'package:flutter/material.dart';
import 'package:farah/theme/appColors.dart';

class PopularServicesSection extends StatelessWidget {
  const PopularServicesSection({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'image': 'assets/images/service1.jpg',
      'name': 'Wedding Photography',
      'category': 'Photography',
      'rating': 4.9,
      'price': 'From \$250',
    },
    {
      'image': 'assets/images/service2.jpg',
      'name': 'Event Decoration',
      'category': 'Decoration',
      'rating': 4.8,
      'price': 'From \$300',
    },
    {
      'image': 'assets/images/service3.jpg',
      'name': 'Catering Service',
      'category': 'Catering',
      'rating': 4.7,
      'price': 'From \$400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Popular Services',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ),

            TextButton(
              onPressed: () {},
              child: const Text(
                'View all →',
                style: TextStyle(
                  color: AppColors.burgundy,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Column(
          children: services.map((service) {
            return Container(
              margin: const EdgeInsets.only(
                bottom: 12,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.cardBorder,
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(12),
                    child: Image.asset(
                      service['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stack) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: AppColors.softRose,
                          child: const Icon(
                            Icons.image_outlined,
                            color: AppColors.burgundy,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          service['name'],
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                            AppColors.textDark,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          service['category'],
                          style: const TextStyle(
                            fontSize: 12,
                            color:
                            AppColors.textMuted,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.gold,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              '${service['rating']}',
                              style: const TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Text(
                          service['price'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                            AppColors.burgundy,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.softRose,
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: AppColors.burgundy,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}