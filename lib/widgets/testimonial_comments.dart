import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TestimonialCarousel extends StatefulWidget {
  const TestimonialCarousel({super.key});

  @override
  State<TestimonialCarousel> createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  final PageController _controller = PageController();

  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Manjeet Singh testimonial 2',
      'avatar': 'assets/images/C1.png', // 🖼️ tu imagen local
      'text': 'Amazing experience I have here.\nThanks Travel Surity',
      'rating': 3.3,
    },
    {
      'name': 'Ana López testimonial',
      'avatar': 'assets/images/C3.png',
      'text': 'Great customer service and smooth booking!',
      'rating': 4.5,
    },
    // Agrega más si quieres
  ];

  void _scrollLeft() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Row(
        children: [
          IconButton(
            onPressed: _scrollLeft,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryBlue,
              size: 22,
            ),
          ),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(testimonial['avatar']),
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              testimonial['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        testimonial['text'],
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: AppColors.primaryBlue),
                          const SizedBox(width: 4),
                          Text(
                            testimonial['rating'].toString(),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: _scrollRight,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryBlue,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
