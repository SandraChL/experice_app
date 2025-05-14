import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔷 Encabezado con usuario
          DrawerHeader(
            decoration: const BoxDecoration( color: AppColors.primaryBlue, ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.account_circle, size: 50, color: Colors.white),
                SizedBox(width: 12),
                Text(
                  'Angel Aquino',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts_outlined),
            title: const Text('Administrar cuentas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.backpack_outlined),
            title: const Text('Reservas'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Registro'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Categorías de eventos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text('Alojamiento'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Ayuda y soporte'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
