import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  String? selectedDateFormatted;
  bool isForAnotherPerson = false;
  String? selectedCountry;
  String? selectedNationality;
  bool showPaymentSection = false;
  bool acceptTerms = false;
  bool acceptPromos = false;

  final List<String> countries = ['Mexico', 'USA', 'Canada'];
  final List<String> nationalities = ['Mexican', 'American', 'Canadian'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('1. Enter your details'),
          const SizedBox(height: 12),
          const Text(
            'We will use these details to share your booking information',
          ),
          const SizedBox(height: 12),
          _buildReservationCheckbox(),
          _buildTextLabel('First Name*'),
          _buildInputField('Enter your first name'),
          _buildTextLabel('Last Name*'),
          _buildInputField('Enter your last name'),
          _buildTextLabel('Mobile Number*'),
          _buildPhoneField(),
          _buildTextLabel('Email Address*'),
          _buildInputField(
            'Enter your email address',
            type: TextInputType.emailAddress,
          ),
          _buildTextLabel('Country *'),
          _buildDropdownField(
            countries,
            selectedCountry,
            (val) => setState(() => selectedCountry = val),
          ),
          _buildTextLabel('Nationality *'),
          _buildDropdownField(
            nationalities,
            selectedNationality,
            (val) => setState(() => selectedNationality = val),
          ),
          _buildTextLabel('Date of birth (+18) *'),
          _buildDatePickerField(),
          const SizedBox(height: 20),
          _buildTextLabel('Special / accessibility request (not guaranteed)'),
          const Text(
            'Special/accessibility requests (e.g., roll-away beds, late check-in, and accessible rooms) are not guaranteed. '
            'If you don’t hear back from the property, contact them directly.',
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 12),
          _buildMultilineInput('Enter your request here'),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => setState(() => showPaymentSection = true),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnoranges,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Continue'),
            ),
          ),
          if (showPaymentSection) _buildPaymentSection(),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 30),
      _buildSectionHeader('2. Complete your booking'),
      const SizedBox(height: 20),
      _buildTextLabel('Promo code'),
      _buildInputField('Enter it below'),
      _buildTextLabel('Reference Code'),
      _buildInputField('Enter it below'),
      const SizedBox(height: 30),
      _buildTextLabel('Email'),
      _buildRoundedField('Email address'),
      _buildTextLabel('Card number'),
      _buildRoundedField(
        '1234 1234 1234 1234',
        inputType: TextInputType.number,
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLabel('Expiration'),
                _buildRoundedField(
                  'MM / YY',
                  inputType: TextInputType.datetime,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLabel('CVC'),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'CVC',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      _buildTextLabel('Country'),
      _buildDropdownField(
        countries,
        selectedCountry,
        (val) => setState(() => selectedCountry = val),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Checkbox(
            value: acceptTerms,
            onChanged: (val) => setState(() => acceptTerms = val ?? false),
          ),
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Accept '),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                  TextSpan(text: '   '),
                  TextSpan(
                    text: 'Frequent Questions',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: acceptPromos,
            onChanged: (val) => setState(() => acceptPromos = val ?? false),
          ),
          const Expanded(
            child: Text(
              'I Agree to be contacted about news, special offers and promotions',
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      _buildSectionHeader('3. Detalles de la reserva'),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Reservation details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            BulletText(
              'This rate is non-refundable. If you change or cancel your reservation, you will not receive a refund or credit for a future stay. This policy applies regardless of COVID-19, unless otherwise provided by local law.',
            ),
            SizedBox(height: 8),
            BulletText(
              'No refunds will be issued for late check-in or early check-out.',
            ),
            SizedBox(height: 8),
            BulletText('To extend your stay, you must make a new reservation.'),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Important information',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      const Text(
        'The reception staff will greet guests upon arrival.\n'
        'Check-in time: Tuesday, June 24, 3:00 PM\n'
        'Check-out time: Wednesday, June 25, 12:00 PM\n'
        '(1-night stay)',
      ),
      const SizedBox(height: 8),
      const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'By clicking on “Finalize Payment” I place an order with payment obligation, I accept the ',
            ),
            TextSpan(
              text: 'terms and conditions .',
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Center(
        child: ElevatedButton(
          onPressed: () {
            // Acción para finalizar reserva
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.btnoranges,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Complete reservation'),
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Important Recommendations:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      BulletText(
        'The reservation holder must be present at check-in. A valid ID and a credit card are required.',
      ),
      BulletText(
        'The guest must notify the hotel if the check-in time will be later than the one scheduled in the reservation, to avoid cancellation of the reservation.',
      ),
      const SizedBox(height: 24),
      const Text(
        'Important Notes:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      const NumberedText(
        '1.1 The primary guest on the booking confirmation must be present at check-in and is expected to present the booking confirmation, a valid credit card and government-issued identification.',
      ),
      const SizedBox(height: 6),
      const NumberedText(
        '1.2 At least one of the guests on the reservation must be over 21 years of age or accompanied by a close family member who is able and willing to assume full responsibility in the event of damage to the property.',
      ),
      const SizedBox(height: 6),
      const NumberedText(
        '1.3 Maximum capacity is strictly controlled by the hotel at check-in.',
      ),
      const SizedBox(height: 6),
      const NumberedText(
        '1.4 The hotel reserves the right to assign a different room of the same capacity. Hotel services are subject to change and we assume no liability for such changes.',
      ),
      const SizedBox(height: 6),
      const NumberedText(
        '1.5 Some hotels may have additional charges for the use of certain services and facilities. Such charges are determined and collected at the hotel.',
      ),
        const SizedBox(height: 30),
    ],
  );

  Widget _buildTextLabel(String text) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 12),
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
    ],
  );

  Widget _buildInputField(
    String hint, {
    TextInputType type = TextInputType.text,
  }) => TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    ),
    keyboardType: type,
  );

  Widget _buildMultilineInput(String hint) => TextField(
    maxLines: 5,
    decoration: InputDecoration(
      hintText: hint,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
  );

  Widget _buildDropdownField(
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) => DropdownButtonFormField<String>(
    value: selectedValue,
    items:
        items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
    onChanged: onChanged,
    decoration: const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      hintText: 'Select',
    ),
  );

  Widget _buildPhoneField() => TextField(
    decoration: InputDecoration(
      prefixIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('🇲🇽'),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
      hintText: 'Enter your mobile number',
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    ),
    keyboardType: TextInputType.phone,
  );

  Widget _buildSectionHeader(String title) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.gray,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
  );

  Widget _buildReservationCheckbox() => Row(
    children: [
      Checkbox(
        value: isForAnotherPerson,
        onChanged:
            (value) => setState(() => isForAnotherPerson = value ?? false),
        checkColor: Colors.white,
        activeColor: AppColors.primaryBlue,
        side: const BorderSide(color: AppColors.primaryBlue),
      ),
      const Text('The reservation is for another person'),
    ],
  );

  Widget _buildDatePickerField() => GestureDetector(
    onTap: _selectDate,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        selectedDateFormatted ?? 'MM/DD/YYYY',
        style: TextStyle(
          color: selectedDateFormatted == null ? Colors.grey : Colors.black,
        ),
      ),
    ),
  );

  Widget _buildRoundedField(
    String hint, {
    TextInputType inputType = TextInputType.text,
  }) => TextField(
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF0F0F0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide.none,
      ),
    ),
    keyboardType: inputType,
  );

  void _selectDate() {
    final currentYear = DateTime.now().year;
    final maxDate = DateTime(currentYear - 18, 12, 31);
    final minDate = DateTime(currentYear - 80);

    showDatePicker(
      context: context,
      initialDate: maxDate,
      firstDate: minDate,
      lastDate: maxDate,
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          selectedDateFormatted =
              '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}';
        });
      }
    });
  }
}

// Widget auxiliar para los bullets
class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class NumberedText extends StatelessWidget {
  final String text;
  const NumberedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
        ),
      ],
    );
  }
}
