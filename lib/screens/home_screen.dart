import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final username = await LocalStorageService.getUsername();
    setState(() {
      _username = username ?? 'Pengguna';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Tugas 7'),
      ),
      drawer: AppDrawer(username: _username),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, ${_username ?? ""} 👋',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Ini adalah halaman dashboard setelah login. '
                  'Data username diambil dari local storage menggunakan SharedPreferences.',
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Ringkasan'),
                subtitle: const Text(
                  'Aplikasi ini menggunakan routes, Drawer, login, dan local storage.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
