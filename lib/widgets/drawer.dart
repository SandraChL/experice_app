import 'package:flutter/material.dart';
import '../screens/login.dart';
import '../utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool showPersonalData = false;
  bool showEventCategories = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔷 Encabezado con usuario
          DrawerHeader(
            // decoration: const BoxDecoration(color: AppColors.primaryBlue),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/Wallpaper.png",
                ), // ruta de tu imagen
                fit: BoxFit.cover,
              ),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.account_circle, size: 50, color: Colors.black),
                SizedBox(width: 12),
                Text(
                  'Angel Aquino',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.manage_accounts_outlined),
            title: const Text('Manage Accounts'),
            trailing: Icon(
              showPersonalData ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                showPersonalData = !showPersonalData;
              });
            },
          ),
          if (showPersonalData)
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Personal data'),
                onTap: () {
                  Navigator.pop(context); // Cierra el drawer
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => const PersonalDataBottomSheet(),
                  );
                },
              ),
            ),

          ListTile(
            leading: const Icon(Icons.backpack_outlined),
            title: const Text('Reservations'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Register'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Events categories'),
            trailing: Icon(
              showEventCategories ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                showEventCategories = !showEventCategories;
              });
            },
          ),
          if (showEventCategories) ...[
            _buildEventSubItem("Sports"),
            _buildEventSubItem("Concerts"),
            _buildEventSubItem("Festivals"),
            _buildEventSubItem("Culture"),
            _buildEventSubItem("Theater"),
            _buildEventSubItem("Other Events"),
          ],

          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text('Accomodation'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help and support'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  //events categories
  Widget _buildEventSubItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0),
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

//personal data
class PersonalDataBottomSheet extends StatelessWidget {
  const PersonalDataBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Personal Data",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),

            _buildField("Name"),
            _buildField("User Name"),
            _buildField("Email", hint: "Select"),
            _buildField("Recovery Email", hint: "Select"),
            _buildField("Phone Number"),
            _buildField("Date of Birth"),
            _buildField("Address", hint: "Select"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, {String hint = ""}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint.isNotEmpty ? hint : null,
              suffixIcon: const Icon(Icons.copy),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
