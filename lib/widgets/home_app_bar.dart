import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';
import 'package:farah/view/favoritesScreen.dart';
import 'package:farah/view/ordersScreen.dart';
import 'package:farah/view/profileScreen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HomeScreen.cream,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: HomeScreen.navy,
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: HomeScreen.navy,
            ),
            child: const Center(
              child: Text(
                'FZ',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: HomeScreen.gold,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // const Text(
          //   'فرح زون',
          //   textDirection: TextDirection.ltr,
          //   style: TextStyle(
          //     color: HomeScreen.navy,
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 1.2,
          //   ),
          // ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'المفضلة',
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const FavoritesScreen(),
              ),
            );
          },
        ),
        IconButton(
          tooltip: 'طلباتي',
          icon: const Icon(Icons.event_note_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const OrdersScreen(),
              ),
            );
          },
        ),
        IconButton(
          tooltip: 'الملف الشخصي',
          icon: const Icon(Icons.person_outline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}