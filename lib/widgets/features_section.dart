import 'package:flutter/material.dart';
import 'package:farah/theme/appColors.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  final List<Map<String, dynamic>> features = const [
    {
      'icon': Icons.search_rounded,
      'title': 'Easy Discovery',
      'description':
      'Find venues and event services in one place.',
    },
    {
      'icon': Icons.verified_rounded,
      'title': 'Verified Providers',
      'description':
      'Discover trusted venues and service providers.',
    },
    {
      'icon': Icons.calendar_month_rounded,
      'title': 'Easy Booking',
      'description':
      'Plan and book your event with ease.',
    },
    {
      'icon': Icons.favorite_rounded,
      'title': 'Made for You',
      'description':
      'Build the perfect event around your needs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 45,
      ),
      color: AppColors.softRose.withValues(alpha: 0.45),
      child: Column(
        children: [
          const Text(
            'Why Farah Zone?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Everything you need to plan your perfect event.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 30),

          LayoutBuilder(
            builder: (context, constraints) {
              int columns;

              if (constraints.maxWidth >= 1000) {
                columns = 4;
              } else if (constraints.maxWidth >= 600) {
                columns = 2;
              } else {
                columns = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 1.35,
                ),
                itemBuilder: (context, index) {
                  final feature = features[index];

                  return Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: AppColors.cream,
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.cardBorder,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.all(13),
                          decoration:
                          const BoxDecoration(
                            color: AppColors.burgundy,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            feature['icon'],
                            color: AppColors.gold,
                            size: 25,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          feature['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight:
                            FontWeight.bold,
                            color:
                            AppColors.textDark,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          feature['description'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color:
                            AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}