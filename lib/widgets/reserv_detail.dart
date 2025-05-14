import 'package:flutter/material.dart';

class ReservationDetailsCard extends StatelessWidget {
  final String checkInDate;
  final String checkInTime;
  final String checkOutDate;
  final String checkOutTime;
  final int totalNights;
  final int rooms;
  final int people;

  const ReservationDetailsCard({
    super.key,
    required this.checkInDate,
    required this.checkInTime,
    required this.checkOutDate,
    required this.checkOutTime,
    required this.totalNights,
    required this.rooms,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reservation details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              'Check-in',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(checkInDate),
            Text(checkInTime),

            const SizedBox(height: 12),

            const Text(
              'Check-out',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(checkOutDate),
            Text(checkOutTime),

            const SizedBox(height: 12),

            const Text(
              'Total length of stay',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('$totalNights ${totalNights == 1 ? 'night' : 'nights'}'),

            const SizedBox(height: 12),

            const Text(
              'Booking',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '$rooms ${rooms == 1 ? 'room' : 'rooms'} - $people ${people == 1 ? 'person' : 'people'}',
            ),
          ],
        ),
      ),
    );
  }
}
