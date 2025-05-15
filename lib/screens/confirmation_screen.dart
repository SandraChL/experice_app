import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/bar_search.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/hotel_confirmation.dart';
import '../widgets/important_recommendations.dart';
import '../widgets/payment_amount.dart';
import '../widgets/reserv_detail.dart';

class ConfirmationPage extends StatelessWidget {
  final String city;

  const ConfirmationPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomBarSearch(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.successGreen,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thank you!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your reservation in $city is confirmed',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            HotelConfirmationCard(
              imageUrl: 'assets/images/H6.png',
              hotelName:
                  'Le Blanc Spa Resort Cancun – Adults Only – All Inclusive',
              ranking: 'Excellent Overall Ranking',
              description: 'Good for sightseeing and has a beach nearby.',
              checkIn: '25 June 2025 | 15:00 - 15:30',
              checkOut: '26 June 2025 | 12:00 - 12:30',
              nights: '1 night',
              bookingInfo: '1 room - 2 people',
              cancellationPolicy: [
                'This rate is non-refundable. If you change or cancel your reservation, you will not receive a refund or credit to use for a future stay.',
                'No refunds will be given for late check-in or early check-out.',
                'Extending your stay requires a new reservation.',
              ],
            ),
           
            // ReservationDetailsCard(
            //   checkInDate: '29 - May - 2025',
            //   checkInTime: '15:00 - 15:30',
            //   checkOutDate: '30 - May - 2025',
            //   checkOutTime: '12:00 - 12:30',
            //   totalNights: 1,
            //   rooms: 1,
            //   people: 2,
            // ),
            
            PaymentAmountCard(
              totalPrice: 424,
              nights: 1,
              toPayAtHotel: 61,
              payNow: 363,
            ),
            const HotelImportantInfoSection(),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
