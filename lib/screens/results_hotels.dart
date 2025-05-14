import 'package:flutter/material.dart';
import '../widgets/bar_search.dart';
import '../widgets/booking_summary.dart';
import '../widgets/card_hotel.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/similar_hotel.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de tarjetas simuladas
    final List<HotelCard> hotelCards = List.generate(5, (index) {
      return HotelCard(
        hotelName: 'Hotel ${index + 1}',
        imagePath: 'assets/images/H6.png',
        price: 40 + index * 5,
        totalPrice: 45 + index * 5,
        ratingLabel: 'Great Stay!',
        refundPolicy: 'Non refundable',
        isRated: index % 2 == 0,
      );
    });

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomBarSearch(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BookingSummaryCard(
              location: 'Cancún',
              dates: '2025-04-25 – 2025-04-26',
              occupancy: '1 room – 2 people',
            ),
            const SizedBox(height: 20),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.separated(
                itemCount: hotelCards.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => hotelCards[index],
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
              ),
            ),
            const SizedBox(height: 20),
            const SimilarHotelsCarousel(),
            const SizedBox(height: 20),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
