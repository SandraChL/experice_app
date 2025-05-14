import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HotelDetailCard extends StatefulWidget {
  const HotelDetailCard({super.key});

  @override
  State<HotelDetailCard> createState() => _HotelDetailCardState();
}

class _HotelDetailCardState extends State<HotelDetailCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imagePaths = [
    'assets/images/H3.png',
    'assets/images/H5.png',
    'assets/images/H6.png',
  ];

  final List<Map<String, dynamic>> amenities = [
    {'icon': Icons.pool, 'label': 'Swimming Pool'},
    {'icon': Icons.wifi, 'label': 'WiFi'},
    {'icon': Icons.local_parking, 'label': 'Parking Free'},
    {'icon': Icons.fitness_center, 'label': 'Gym'},
    {'icon': Icons.spa, 'label': 'Spa'},
    {'icon': Icons.restaurant, 'label': 'Restaurant'},
    {'icon': Icons.beach_access, 'label': 'Beach Access'},
    {'icon': Icons.child_friendly, 'label': 'Kids Friendly'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Grand Residences Riviera Cancún',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(Icons.location_on, color: AppColors.primaryBlue, size: 18),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Quinta Ariadna s/n. - Manhattan, Ara / 15128',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 🔵 Imagen slider
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (_, index) {
                  return Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imagePaths.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🔵 Tags
          Row(
            children: [
              _buildTag('Business'),
              const SizedBox(width: 8),
              _buildTag('Luxury'),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            '"Welcome to our tranquil beachside retreat. Enjoy leisure, gastronomy, and wellness in the heart of (CN) resort.',
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 12),
          const Text(
            'Hotel Surroundings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          _buildNearbyPlace('Tequila Museum - 0.1 km / 0.1 mi'),
          _buildNearbyPlace('La Isla Shopping Mall - 0.2 km / 0.1 mi'),
          _buildNearbyPlace('Hotel Zone Beaches - 0.3 km / 0.2 mi'),
          _buildNearbyPlace('Isla Dorada - 0.3 km / 0.2 mi'),

          const SizedBox(height: 12),
          const Text(
            'Amenities',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _buildAmenity(Icons.pool, 'Swimming Pool'),
              _buildAmenity(Icons.wifi, 'WiFi'),
              _buildAmenity(Icons.local_parking, 'Parking Free'),
              _buildAmenity(Icons.fitness_center, 'Gym'),

              // 🔵 Botón pequeño
              TextButton(
                onPressed: _showMoreAmenities,
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(fontSize: 12),
                ),
                child: const Text('See More'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(label, style: TextStyle(color: AppColors.primaryBlue)),
    );
  }

  Widget _buildNearbyPlace(String text) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: AppColors.primaryBlue, size: 16),
        const SizedBox(width: 4),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
      ],
    );
  }

  Widget _buildAmenity(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: AppColors.primaryBlue),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  void _showMoreAmenities() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'More Amenities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...amenities.map(
                (amenity) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Icon(amenity['icon'], color: AppColors.primaryBlue),
                      const SizedBox(width: 10),
                      Text(amenity['label']),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
