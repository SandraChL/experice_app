import 'package:flutter/material.dart';

class CurrencyOption {
  final String label;
  final String iconPath;

  CurrencyOption({required this.label, required this.iconPath});
}

class CurrencySelectorButton extends StatefulWidget {
  const CurrencySelectorButton({super.key});

  @override
  State<CurrencySelectorButton> createState() => _CurrencySelectorButtonState();
}

class _CurrencySelectorButtonState extends State<CurrencySelectorButton> {
  final List<CurrencyOption> currencies = [
    CurrencyOption(label: 'EUR (€)', iconPath: 'assets/images/es_flag.png'),
    CurrencyOption(label: 'MXN (\$)', iconPath: 'assets/images/mx_flag.png'),
    CurrencyOption(label: 'USD (\$)', iconPath: 'assets/images/us_flag.png'),
  ];

  late CurrencyOption selectedCurrency;

  @override
  void initState() {
    super.initState();
    selectedCurrency = currencies[0]; // default
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<CurrencyOption>(
        value: selectedCurrency,
        items: currencies.map((currency) {
          return DropdownMenuItem<CurrencyOption>(
            value: currency,
            child: Row(
              children: [
                Image.asset(
                  currency.iconPath,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  currency.label,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (CurrencyOption? newCurrency) {
          if (newCurrency != null) {
            setState(() {
              selectedCurrency = newCurrency;
            });
          }
        },
        style: const TextStyle(color: Colors.black),
        icon: const Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
