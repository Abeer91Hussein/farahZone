import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
            'المساعدة والدعم',
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
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.support_agent,
                    color: gold,
                    size: 48,
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'كيف يمكننا مساعدتك؟',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'فريق فرح زون جاهز لمساعدتك',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 12,
                      fontFamily: 'LibertinusMath',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _helpItem(
              icon: Icons.question_answer_outlined,
              title: 'الأسئلة الشائعة',
              onTap: () {},
            ),
            _helpItem(
              icon: Icons.chat_outlined,
              title: 'تواصل معنا',
              onTap: () {},
            ),
            _helpItem(
              icon: Icons.report_problem_outlined,
              title: 'الإبلاغ عن مشكلة',
              onTap: () {},
            ),
            _helpItem(
              icon: Icons.info_outline,
              title: 'عن فرح زون',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          size: 14,
        ),
      ),
    );
  }
}