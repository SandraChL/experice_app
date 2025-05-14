import 'package:flutter/material.dart';

class LanguageOption {
  final String label;
  final String iconPath;

  LanguageOption({required this.label, required this.iconPath});
}

class LanguageSelectorButton extends StatefulWidget {
  const LanguageSelectorButton({super.key});

  @override
  State<LanguageSelectorButton> createState() => _LanguageSelectorButtonState();
}

class _LanguageSelectorButtonState extends State<LanguageSelectorButton> {
  final List<LanguageOption> languages = [
    LanguageOption(label: 'Español', iconPath: 'assets/images/mx_flag.png'),
    LanguageOption(label: 'Francés', iconPath: 'assets/images/fr_flag.png'),
    LanguageOption(label: 'Inglés', iconPath: 'assets/images/us_flag.png'),
  ];

  late LanguageOption selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = languages[0]; // Idioma por defecto
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<LanguageOption>(
        value: selectedLanguage,
        items:
            languages.map((lang) {
              return DropdownMenuItem<LanguageOption>(
                value: lang,
                child: Row(
                  children: [
                    Image.asset(lang.iconPath, width: 15, height: 15),
                    const SizedBox(width: 10),
                    Text(
                      lang.label,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
        onChanged: (LanguageOption? newLang) {
          if (newLang != null) {
            setState(() {
              selectedLanguage = newLang;
              // Aquí puedes llamar una función para cambiar idioma global si usas intl o provider
            });
          }
        },
        icon: const Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
