import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const Color cream = Color(0xFFF3EDE2);
  static const Color navy = Color(0xFF1B2A4A);
  static const Color gold = Color(0xFFD4AF37);

  bool notifications = true;
  bool emailNotifications = true;

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
            'الإعدادات',
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
            _settingCard(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              subtitle: 'استقبال إشعارات التطبيق',
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
            const SizedBox(height: 12),
            _settingCard(
              icon: Icons.email_outlined,
              title: 'إشعارات البريد الإلكتروني',
              subtitle: 'استقبال آخر العروض والتحديثات',
              value: emailNotifications,
              onChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            const SizedBox(height: 12),
            _normalCard(
              icon: Icons.language_outlined,
              title: 'اللغة',
              value: 'العربية',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _normalCard(
              icon: Icons.lock_outline,
              title: 'الخصوصية والأمان',
              value: '',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: navy,
            size: 23,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: navy.withOpacity(0.55),
                    fontSize: 10,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: gold,
            activeTrackColor: navy.withOpacity(0.30),
          ),
        ],
      ),
    );
  }

  Widget _normalCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
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
            fontWeight: FontWeight.w700,
            fontFamily: 'LibertinusMath',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value.isNotEmpty)
              Text(
                value,
                style: TextStyle(
                  color: navy.withOpacity(0.55),
                  fontSize: 11,
                  fontFamily: 'LibertinusMath',
                ),
              ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_back_ios_new,
              color: navy,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}