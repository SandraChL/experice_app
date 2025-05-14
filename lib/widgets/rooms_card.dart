import 'package:flutter/material.dart';

import '../screens/form_booking.dart';
import '../utils/colors.dart';

import 'refund_badge.dart';

class RoomCard extends StatefulWidget {
  const RoomCard({super.key});

  @override
  State<RoomCard> createState() => _RoomCardSliderState();
}

class _RoomCardSliderState extends State<RoomCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/H5.png',
    'assets/images/H6.png',
    'assets/images/H3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Slider de imágenes
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 120,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder:
                        (_, index) => Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index
                                ? Colors.white
                                : Colors.white54,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          // 🔹 Título y descripción
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deluxe Room, 1 King Bed, Balcony, Ocean View...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BulletText('Non-smoking rooms'),
                    BulletText('Lift / Elevator'),
                    BulletText('Spa/wellness center'),
                    BulletText('Minimarket on site'),
                    BulletText('Sanitized tableware & silverware'),
                    BulletText('Currency exchange'),
                    BulletText('Sun terrace'),
                    BulletText('Private check-in/check-out'),
                    BulletText('Hand sanitizer in guest room and key areas'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Cancellation Policies',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Learn more about policy options',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const Divider(height: 20),
              ],
            ),
          ),

          // 🔹 Precio y botón
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Number of people',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Text('2 x'),
                          SizedBox(width: 4),
                          Icon(Icons.person, size: 18),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '\$442 per night',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Without taxes or fees',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 70,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RefundBadge(isRefundable: true), // o false
                      const SizedBox(height: 6),
                      const Text(
                        'Total \$441 USD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'includes taxes & fees',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormBookingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              child: const Text('Reserve'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [const Text('• '), Expanded(child: Text(text))]);
  }
}
