import 'package:flutter/material.dart';
import '../widgets/bar_search.dart';
import '../widgets/booking_summary.dart';
import '../widgets/card_hotel.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/form.dart';
import '../widgets/payment_amount.dart';
import '../widgets/reserv_detail.dart';
import '../widgets/step_indicator.dart';

class FormBookingPage extends StatelessWidget {
  const FormBookingPage({super.key});

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
            BookingSummaryCard(
              location: 'Cancún',
              dates: '2025-04-25 – 2025-04-26',
              occupancy: '1 room – 2 people',
            ),
            const SizedBox(height: 20),
            const StepIndicator(currentStep: 1),
            const SizedBox(height: 20),
            HotelCard(
              hotelName: 'Hotel Example',
              imagePath: 'assets/images/H6.png',
              price: 120,
              totalPrice: 150,
              ratingLabel: 'Excellent',
              refundPolicy: 'Refundable',
              isRated: true,
              showSelectButton: false, // Aquí ocultas el botón
            ),
            const SizedBox(height: 20),
            ReservationDetailsCard(
              checkInDate: '29 - May - 2025',
              checkInTime: '15:00 - 15:30',
              checkOutDate: '30 - May - 2025',
              checkOutTime: '12:00 - 12:30',
              totalNights: 1,
              rooms: 1,
              people: 2,
            ),

            PaymentAmountCard(
              totalPrice: 424,
              nights: 1,
              toPayAtHotel: 61,
              payNow: 363,
            ),
            const SizedBox(height: 20),
            BookingForm(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
