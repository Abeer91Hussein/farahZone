import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            'الملف الشخصي',
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
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: gold,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: navy,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'مرحباً بك',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'أديري معلومات حسابك من هنا',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 12,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            _profileItem(
              icon: Icons.person_outline,
              title: 'المعلومات الشخصية',
              onTap: () {},
            ),
            _profileItem(
              icon: Icons.email_outlined,
              title: 'البريد الإلكتروني',
              onTap: () {},
            ),
            _profileItem(
              icon: Icons.phone_outlined,
              title: 'رقم الهاتف',
              onTap: () {},
            ),
            _profileItem(
              icon: Icons.lock_outline,
              title: 'تغيير كلمة المرور',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: navy,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: navy,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'LibertinusMath',
          ),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: navy,
          size: 15,
        ),
      ),
    );
  }
}