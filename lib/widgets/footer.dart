import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD9D9D9), // Fondo gris
      width: double.infinity, // 🔥 Ocupa todo el ancho
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 25,
      ), // Padding interno
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo + redes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', height: 30),
              Row(
                children: const [
                  Icon(Icons.tiktok, size: 20),
                  SizedBox(width: 12),
                  Icon(Icons.facebook, size: 20),
                  SizedBox(width: 12),
                  FaIcon(FontAwesomeIcons.instagram, size: 20),
                  SizedBox(width: 12),
                  Icon(Icons.close, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Secciones
          _FooterSection(
            title: 'About',
            content: const [
              Text("Travel is the only"),
              Text("thing you can buy"),
              Text("that makes you richer"),
            ],
          ),
          const SizedBox(height: 16),
          _FooterSection(
            title: 'Contact Information',
            content: const [
              Text("Let us know your comments"),
              Text("+01 (977) 2599 12"),
              Text("soporte@triptech.com.mx"),
              Text("Ogden, Utah"),
            ],
          ),
          const SizedBox(height: 16),
          _FooterSection(
            title: 'Menu',
            content: const [
              Text("Events"),
              Text("Categories"),
              Text("Hotels"),
              Text("Recently viewed"),
            ],
          ),
          const SizedBox(height: 16),
          _FooterSection(
            title: 'Subscribe Us',
            content: const [
              Text("Subscribe to receive"),
              Text("our newsletter"),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'XPERIENCE© 2024. ALL RIGHTS RESERVED.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String title;
  final List<Widget> content;

  const _FooterSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 40, color: AppColors.primaryBlue),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          ),
        ),
      ],
    );
  }
}
