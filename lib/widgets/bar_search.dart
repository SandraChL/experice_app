import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'currency_selector_button.dart';

class CustomBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const CustomBarSearch({super.key});

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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
