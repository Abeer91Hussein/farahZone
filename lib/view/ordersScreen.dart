import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
            'طلباتي',
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
            _orderCard(
              name: 'Four Seasons Hall',
              date: '12 سبتمبر 2026',
              status: 'مؤكد',
              statusColor: Colors.green,
              icon: Icons.event_available_outlined,
            ),
            const SizedBox(height: 16),
            _orderCard(
              name: 'باقة مكياج العروس',
              date: '20 سبتمبر 2026',
              status: 'قيد المراجعة',
              statusColor: gold,
              icon: Icons.face_retouching_natural,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderCard({
    required String name,
    required String date,
    required String status,
    required Color statusColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: gold.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: navy,
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LibertinusMath',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: navy.withOpacity(0.55),
                size: 15,
              ),
              const SizedBox(width: 6),
              Text(
                date,
                style: TextStyle(
                  color: navy.withOpacity(0.65),
                  fontSize: 12,
                  fontFamily: 'LibertinusMath',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}