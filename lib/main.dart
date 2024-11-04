import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Biodata'),
        centerTitle: true,
      ),
      body: Center(
        // Menggunakan SingleChildScrollView agar konten bisa di-scroll
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Container untuk foto profile
              Container(
                width: screenSize.width > 600 ? 200 : 150, // Responsive width
                height: screenSize.width > 600 ? 200 : 150, // Responsive height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS084I6ZRqBBIvSPpMuPEXaMaUcui_stNIBgw&s', // Ganti dengan URL foto Anda
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Informasi Biodata menggunakan Card
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama
                      const Center(
                        child: Text(
                          'Gede Adi Gunawan', // Ganti dengan nama Anda
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(height: 10),

                      // NIM
                      _buildInfoRow(Icons.numbers, 'NIM:', '42230005'),
                      const SizedBox(height: 10),

                      // Prodi
                      _buildInfoRow(
                        Icons.school,
                        'Program Studi:',
                        'Teknologi Informasi',
                      ),
                      const SizedBox(height: 20),

                      // Deskripsi Diri
                      const Text(
                        'Deskripsi Diri:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Saya adalah mahasiswa undiknas semester 5. '
                        'Saya senang belajar hal-hal baru. '
                        'Dan saya bekerja di bidang kreatif design dan produksi video',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat baris informasi
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
