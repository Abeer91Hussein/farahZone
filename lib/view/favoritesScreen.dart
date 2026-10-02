import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
          iconTheme: const IconThemeData(color: navy),
          title: const Text(
            'المفضلة',
            style: TextStyle(
              color: navy,
              fontSize: 21,
              fontWeight: FontWeight.w700,
              fontFamily: 'LibertinusMath',
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            _favoriteCard(
              image: 'assets/images/fourSesones.jpg',
              name: 'Four Seasons Hall',
              location: 'Ramallah',
              rating: '4.9',
            ),
            const SizedBox(height: 18),
            _favoriteCard(
              image: 'assets/images/جلوريا.jpg',
              name: 'Gloria Hall',
              location: 'Nablus',
              rating: '4.8',
            ),
          ],
        ),
      ),
    );
  }

  Widget _favoriteCard({
    required String image,
    required String name,
    required String location,
    required String rating,
  }) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(20),
            ),
            child: Image.asset(
              image,
              width: 125,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: navy,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'LibertinusMath',
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: gold,
                        size: 19,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: navy.withOpacity(0.55),
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(
                          color: navy.withOpacity(0.60),
                          fontSize: 11,
                          fontFamily: 'LibertinusMath',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: gold,
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          color: navy,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}