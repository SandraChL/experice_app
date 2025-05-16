import 'package:flutter/material.dart';
//import '../screens/home_screen.dart';
import '../screens/login.dart';
import 'currency_selector_button.dart';
import 'language_selector_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4,
      toolbarHeight: 60,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Builder(
        builder:
            (context) => Row(
              children: [
                // Image.asset(
                //   'assets/images/logo.png',
                //   height: 26,
                //   width: 90,
                //   fit: BoxFit.contain,
                //   alignment: Alignment.centerLeft,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 26,
                    width: 90,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),

                const Spacer(),
                const SizedBox(height: 36, child: CurrencySelectorButton()),

                const SizedBox(height: 36, child: LanguageSelectorButton()),

                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ],
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
