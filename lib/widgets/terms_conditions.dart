import 'package:flutter/material.dart';

class HotelPolicies extends StatelessWidget {
  const HotelPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> policies = [
      {
        'title': 'Age Limit',
        'content':
            'At least one guest must be 18 or older. In some U.S. states, the minimum age is higher. Guests under 25 should confirm with the hotel directly.',
      },
      {
        'title': 'Room Types',
        'content':
            "It's the User's responsibility to book suitable room types. Hotels may refuse entry or charge extra if the number of guests exceeds the room capacity. Room types (e.g., double vs. twin) are based on availability at check-in.",
      },
      {
        'title': 'Special Requests',
        'content':
            'Requests such as smoking preference, bed types, or specific room features are not guaranteed and are subject to availability.',
      },
      {
        'title': 'Late Check-in',
        'content':
            'Guests arriving after 6 PM should inform the hotel directly to avoid cancellation.',
      },
      {
        'title': 'Early Checkout',
        'content':
            'Refunds for early checkouts require hotel-issued permission but are not guaranteed. Refunds depend on whether the hotel invoices Tukmein.',
      },
      {
        'title': 'Resort Fees:',
        'content':
            'Many U.S. hotels charge a resort fee, payable directly at the hotel. These fees are not controlled by Tukmein.',
      },
      {
        'title': 'Duplicate Bookings',
        'content':
            'Tukmein does not guarantee confirmation of duplicate bookings. Users are responsible for resolving duplicates according to voucher terms.',
      },
      {
        'title': 'Rate Issues',
        'content':
            'Tukmein may correct pricing or display errors. Users can choose to keep the booking at the correct rate, cancel, or choose an alternative if available.',
      },
      {
        'title': 'Special Event Periods',
        'content':
            'Cancellation policies and rates may vary during special events or peak dates. Tukmein will inform Users of changes once notified.',
      },

      {
        'title': 'Climate & Energy Policies',
        'content':
            'Heating and pool access may be limited due to local energy regulations or weather. Tukmein is not responsible for these limitations.',
      },
      {
        'title': 'Reservation Details',
        'content':
            'Users must verify all booking details (guest names, nationality, hotel location, etc.) are correct. Tukmein’s cancellation and refund policies apply once a booking is confirmed.',
      },
      {
        'title': 'Additional & Incidental Charges',
        'content':
            'Extra charges like minibar, safe, A/C, spa, luggage storage, and Gala dinners during holidays may apply and must be paid directly to the hotel. Tukmein has no control over these charges.',
      },
      {
        'title': 'Parking',
        'content':
            'Some hotels may charge additional fees for parking. These are **not included** in the nightly rate and must be paid **directly to the hotel or resort**.',
      },
      {
        'title': 'Local Market Rates',
        'content':
            'Hotel rates may not apply to certain nationalities. Users must accurately declare the End User’s nationality when booking. Incorrect information may result in penalties.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tukmein Hotel Booking Terms & Conditions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...policies.map(
            (policy) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    policy['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    policy['content']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
