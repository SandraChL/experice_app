import 'package:flutter/material.dart';

class HotelImportantInfoSection extends StatelessWidget {
  const HotelImportantInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(16), // 🧱 Padding alrededor de todo
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Important Recommendations:'),
          const SizedBox(height: 8),
          const BulletText(
            'The reservation holder must be present at check-in. A valid ID and a credit card are required.',
          ),
          const BulletText(
            'The guest must notify the hotel if the check-in time will be later than the one scheduled in the reservation, to avoid cancellation of the reservation.',
          ),
          const SizedBox(height: 20),

          const SectionTitle('Important Notes:'),
          const SizedBox(height: 8),
          const NumberedText(
            '1.1 The primary guest on the booking confirmation must be present at check-in and is expected to present the booking confirmation, a valid credit card and government-issued identification.',
          ),
          const NumberedText(
            '1.2 At least one of the guests on the reservation must be over 21 years of age or accompanied by a close family member who is able and willing to assume full responsibility in the event of damage to the property.',
          ),
          const NumberedText(
            '1.3 Maximum capacity is strictly controlled by the hotel at check-in.',
          ),
          const NumberedText(
            '1.4 The hotel reserves the right to assign a different room of the same capacity. Hotel services are subject to change and we assume no liability for such changes.',
          ),
          const NumberedText(
            '1.5 Some hotels may have additional charges for the use of certain services and facilities. Such charges are determined and collected at the hotel.',
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class NumberedText extends StatelessWidget {
  final String text;
  const NumberedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
    );
  }
}
