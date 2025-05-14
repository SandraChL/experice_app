import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AccommodationCarousel extends StatefulWidget {
  const AccommodationCarousel({super.key});

  @override
  State<AccommodationCarousel> createState() => _AccommodationCarouselState();
}

class _AccommodationCarouselState extends State<AccommodationCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> accommodations = [
    {
      'image': 'assets/images/H3.png',
      'title': 'The Westin Resort',
      'price': '\$80 - \$250',
    },
    {
      'image': 'assets/images/H5.png',
      'title': 'Beach Paradise Hotel',
      'price': '\$120 - \$320',
    },
    {
      'image': 'assets/images/H6.png',
      'title': 'City Lights Inn',
      'price': '\$90 - \$190',
    },
  ];

  void _next() {
    if (_currentPage < accommodations.length - 1) {
      _currentPage++;
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previous() {
    if (_currentPage > 0) {
      _currentPage--;
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: AppColors.graysection, // Fondo gris para todo el contenido
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Special offers on accommodations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _controller,
                itemCount: accommodations.length,
                itemBuilder: (context, index) {
                  final item = accommodations[index];
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(item['image']!, fit: BoxFit.cover),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Text(
                          item['price']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildArrowButton(icon: Icons.arrow_back, onTap: _previous),
              const SizedBox(width: 20),
              _buildArrowButton(icon: Icons.arrow_forward, onTap: _next),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.graysection),
        ),
        child: Icon(icon, size: 20, color: AppColors.graysection),
      ),
    );
  }
}
