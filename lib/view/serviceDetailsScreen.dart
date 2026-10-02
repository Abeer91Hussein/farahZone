import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.location,
    required this.rating,
    required this.description,
    required this.price,
    this.availableDate,
    this.bookings,
    this.discount,
    this.features = const [],
  });

  final String image;
  final String name;
  final String category;
  final String location;
  final String rating;
  final String description;
  final String price;
  final String? availableDate;
  final String? bookings;
  final String? discount;
  final List<String> features;

  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: cream,
        appBar: AppBar(
          backgroundColor: cream,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: navy,
            ),
          ),
          title: const Text(
            'تفاصيل الخدمة',
            style: TextStyle(
              color: navy,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: 'LibertinusMath',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: navy,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageSection(),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  22,
                  24,
                  22,
                  30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: gold,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      name,
                      style: const TextStyle(
                        color: navy,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: gold,
                          size: 19,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          rating,
                          style: const TextStyle(
                            color: navy,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 18),

                        Icon(
                          Icons.location_on_outlined,
                          color: navy.withOpacity(0.55),
                          size: 18,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          location,
                          style: TextStyle(
                            color: navy.withOpacity(0.65),
                            fontSize: 13,
                            fontFamily: 'LibertinusMath',
                          ),
                        ),
                      ],
                    ),

                    if (bookings != null) ...[
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: navy.withOpacity(0.55),
                            size: 18,
                          ),

                          const SizedBox(width: 5),

                          Text(
                            bookings!,
                            style: TextStyle(
                              color: navy.withOpacity(0.70),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'LibertinusMath',
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    _sectionTitle('عن الخدمة'),

                    const SizedBox(height: 10),

                    Text(
                      description,
                      style: TextStyle(
                        color: navy.withOpacity(0.68),
                        fontSize: 14,
                        height: 1.7,
                        fontFamily: 'LibertinusMath',
                      ),
                    ),

                    if (features.isNotEmpty) ...[
                      const SizedBox(height: 28),

                      _sectionTitle('المميزات والخدمات'),

                      const SizedBox(height: 12),

                      ...features.map(
                            (feature) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: gold.withOpacity(0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: gold,
                                  size: 16,
                                ),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  feature,
                                  style: const TextStyle(
                                    color: navy,
                                    fontSize: 13,
                                    fontFamily: 'LibertinusMath',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    if (availableDate != null) ...[
                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: gold.withOpacity(0.10),
                          borderRadius:
                          BorderRadius.circular(14),
                          border: Border.all(
                            color: gold.withOpacity(0.18),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.event_available_outlined,
                              color: gold,
                              size: 21,
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                'متاح بتاريخ $availableDate',
                                style: const TextStyle(
                                  color: navy,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'LibertinusMath',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 28),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: navy.withOpacity(0.08),
                            blurRadius: 18,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            discount != null
                                ? 'العرض الحالي'
                                : 'السعر',
                            style: TextStyle(
                              color: navy.withOpacity(0.55),
                              fontSize: 11,
                              fontFamily: 'LibertinusMath',
                            ),
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  discount ?? price,
                                  style: const TextStyle(
                                    color: navy,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                    'LibertinusMath',
                                  ),
                                ),
                              ),

                              if (discount != null)
                                Text(
                                  price,
                                  style: TextStyle(
                                    color: navy.withOpacity(0.45),
                                    fontSize: 13,
                                    decoration:
                                    TextDecoration.lineThrough,
                                    fontFamily:
                                    'LibertinusMath',
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.event_available,
                          size: 19,
                        ),
                        label: const Text(
                          'طلب الخدمة',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LibertinusMath',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: gold,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(14),
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
    );
  }

  Widget _imageSection() {
    return SizedBox(
      height: 330,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: navy,
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      color: gold,
                      size: 55,
                    ),
                  ),
                );
              },
            ),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    navy.withOpacity(0.75),
                  ],
                ),
              ),
            ),
          ),

          if (discount != null)
            Positioned(
              top: 18,
              right: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: gold,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Text(
                  discount!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 21,
          decoration: BoxDecoration(
            color: gold,
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        const SizedBox(width: 9),

        Text(
          title,
          style: const TextStyle(
            color: navy,
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontFamily: 'LibertinusMath',
          ),
        ),
      ],
    );
  }
}