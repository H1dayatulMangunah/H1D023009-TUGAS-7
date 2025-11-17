import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _focusMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Pengaturan Aplikasi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Mode belajar fokus'),
            subtitle: const Text(
              'Jika aktif, beberapa notifikasi di dalam aplikasi dapat disederhanakan.',
            ),
            value: _focusMode,
            onChanged: (value) {
              setState(() {
                _focusMode = value;
              });
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Halaman ini hanya contoh sederhana pengaturan. '
                'Anda bisa mengembangkan lagi misalnya menyimpan preferensi ke local storage.',
          ),
        ],
      ),
    );
  }
}
