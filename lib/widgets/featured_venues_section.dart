import 'package:flutter/material.dart';
import 'package:farah/theme/appColors.dart';

class FeaturedVenuesSection extends StatelessWidget {
  const FeaturedVenuesSection({super.key});

  final List<Map<String, dynamic>> venues = const [
    {
      'image': 'assets/images/venue1.jpg',
      'name': 'Royal Palace',
      'location': 'Ramallah',
      'price': 'From \$800',
      'rating': 4.9,
    },
    {
      'image': 'assets/images/venue2.jpg',
      'name': 'Golden Hall',
      'location': 'Bethlehem',
      'price': 'From \$650',
      'rating': 4.8,
    },
    {
      'image': 'assets/images/venue3.jpg',
      'name': 'Rose Garden',
      'location': 'Nablus',
      'price': 'From \$500',
      'rating': 4.7,
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
                'Featured Venues',
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

        SizedBox(
          height: 330,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: venues.length,
            separatorBuilder: (_, __) =>
            const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final venue = venues[index];

              return SizedBox(
                width: 280,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.cardBorder,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.asset(
                                venue['image'],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stack) {
                                  return Container(
                                    color: AppColors.softRose,
                                    child: const Icon(
                                      Icons.image_outlined,
                                      size: 50,
                                      color:
                                      AppColors.burgundy,
                                    ),
                                  );
                                },
                              ),

                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.burgundy,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 14,
                                        color: AppColors.gold,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${venue['rating']}',
                                        style:
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                        .withValues(alpha: 0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                    ),
                                    color:
                                    AppColors.burgundy,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                venue['name'],
                                maxLines: 1,
                                overflow:
                                TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                  AppColors.textDark,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                    color:
                                    AppColors.textMuted,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    venue['location'],
                                    style: const TextStyle(
                                      color:
                                      AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      venue['price'],
                                      style: const TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        color:
                                        AppColors.burgundy,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 12,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                      AppColors.burgundy,
                                      borderRadius:
                                      BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    child: const Text(
                                      'View',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}