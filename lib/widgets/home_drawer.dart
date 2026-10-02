import 'package:flutter/material.dart';
import 'package:farah/view/homeScreen.dart';
// import 'package:farah/view/categoriesScreen.dart';
import 'package:farah/view/favoritesScreen.dart';
import 'package:farah/view/ordersScreen.dart';
import 'package:farah/view/offersScreen.dart';
import 'package:farah/view/profileScreen.dart';
import 'package:farah/view/settingsScreen.dart';
import 'package:farah/view/helpScreen.dart';
import 'package:farah/view/mainScreen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: HomeScreen.cream,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            'تسجيل الخروج',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: HomeScreen.navy,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: HomeScreen.navy,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  color: HomeScreen.navy,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainScreen(),
                  ),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'خروج',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HomeScreen.cream,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 28,
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: HomeScreen.navy,
              ),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: HomeScreen.gold,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'FZ',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: HomeScreen.navy,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'FARAH ZONE',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'كل ما تحتاجه لاحتفالك',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.75),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            _drawerItem(
              context: context,
              icon: Icons.home_outlined,
              title: 'الرئيسية',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // _drawerItem(
            //   context: context,
            //   icon: Icons.category_outlined,
            //   title: 'الأقسام',
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const CategoriesScreen(),
            //       ),
            //     );
            //   },
            // ),

            _drawerItem(
              context: context,
              icon: Icons.favorite_border,
              title: 'المفضلة',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FavoritesScreen(),
                  ),
                );
              },
            ),

            _drawerItem(
              context: context,
              icon: Icons.event_note_outlined,
              title: 'طلباتي',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrdersScreen(),
                  ),
                );
              },
            ),

            _drawerItem(
              context: context,
              icon: Icons.local_offer_outlined,
              title: 'العروض',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OffersScreen(),
                  ),
                );
              },
            ),

            _drawerItem(
              context: context,
              icon: Icons.person_outline,
              title: 'الملف الشخصي',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
            ),

            const Divider(
              color: Color(0x221B2A4A),
              indent: 20,
              endIndent: 20,
            ),

            _drawerItem(
              context: context,
              icon: Icons.settings_outlined,
              title: 'الإعدادات',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },
            ),

            _drawerItem(
              context: context,
              icon: Icons.help_outline,
              title: 'المساعدة',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HelpScreen(),
                  ),
                );
              },
            ),

            const Spacer(),

            _drawerItem(
              context: context,
              icon: Icons.logout,
              title: 'تسجيل الخروج',
              color: Colors.red.shade700,
              onTap: () => _showLogoutConfirmation(context),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      leading: Icon(
        icon,
        color: color ?? HomeScreen.navy,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? HomeScreen.navy,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}