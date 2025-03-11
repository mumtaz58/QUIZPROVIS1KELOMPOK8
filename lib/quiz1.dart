import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const UPISuperApp());
}

class UPISuperApp extends StatelessWidget {
  const UPISuperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI SuperApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color.fromARGB(255, 241, 161, 188),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/mental_health': (context) => const MentalHealthScreen(),
        '/akademik': (context) => const AkademikScreen(),
        '/keuangan': (context) => const KeuanganScreen(),
        '/medsos': (context) => const MedsosScreen(),
        '/elearning': (context) => const ElearningScreen(),
        '/jadwaltodo': (context) => const JadwalTodoScreen(),
        '/pesangroup': (context) => const PesanGroupScreen(),
        '/notifikasi': (context) => const NotifikasiScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of all navigation items
    final List<Map<String, String>> navItems = [
      {'title': 'Main screen', 'route': '/main'},
      {'title': 'Mental health', 'route': '/mental_health'},
      {'title': 'Akademik', 'route': '/akademik'},
      {'title': 'Keuangan', 'route': '/keuangan'},
      {'title': 'Medsos', 'route': '/medsos'},
      {'title': 'E-learning', 'route': '/elearning'},
      {'title': 'Jadwal & Todo', 'route': '/jadwaltodo'},
      {'title': 'Pesan & Group', 'route': '/pesangroup'},
      {'title': 'Notifikasi', 'route': '/notifikasi'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz 1',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menggunakan SingleChildScrollView agar bisa di-scroll jika tombol terlalu banyak
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(navItems.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildNavigationButton(
                  navItems[index]['title']!,
                  navItems[index]['route']!,
                  context,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(String title, String route, BuildContext context) {
    // Membuat tombol dengan lebar penuh
    return Container(
      height: 60,
      width: double.infinity, // Lebar penuh
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, // Ukuran font sedikit diperbesar
                color: Colors.purple.shade300,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Screen implementations
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UPI SuperApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color(0xFF1E5EA8),
      ),
      body: Column(
        children: [
          // Profile and Welcome Banner
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1E5EA8),
            child: Row(
              children: [
                // Menggunakan CircleAvatar dengan warna latar belakang saja, tanpa gambar
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Armelia Syahraini',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NIM: 2307411',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Semester 4',
                    style: TextStyle(
                      color: Color(0xFF1E5EA8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Feature Grid
                  const Text(
                    'Fitur Utama',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildFeatureItem(
                        context,
                        'Mental Health',
                        Icons.favorite,
                        Colors.red.shade100,
                        Colors.red,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MentalHealthScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Akademik',
                        Icons.school,
                        Colors.blue.shade100,
                        Colors.blue,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AkademikScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Keuangan',
                        Icons.account_balance_wallet,
                        Colors.green.shade100,
                        Colors.green,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const KeuanganScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Medsos',
                        Icons.public,
                        Colors.purple.shade100,
                        Colors.purple,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MedsosScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Elearning',
                        Icons.computer,
                        Colors.orange.shade100,
                        Colors.orange,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ElearningScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Jadwal & Todo',
                        Icons.calendar_today,
                        Colors.teal.shade100,
                        Colors.teal,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JadwalTodoScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Pesan & Group',
                        Icons.chat,
                        Colors.indigo.shade100,
                        Colors.indigo,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PesanGroupScreen()),
                        ),
                      ),
                      _buildFeatureItem(
                        context,
                        'Notifikasi',
                        Icons.notifications,
                        Colors.amber.shade100,
                        Colors.amber,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotifikasiScreen()),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Upcoming Schedule
                  const Text(
                    'Jadwal Hari Ini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildUpcomingSchedule(),
                  
                  const SizedBox(height: 24),
                  
                  // Latest Announcements
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pengumuman Terbaru',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Semua'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildLatestAnnouncements(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1E5EA8),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Jelajah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingSchedule() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildScheduleItem(
            '08:00 - 09:40',
            'Pemrograman Mobile',
            'R.3.2.01',
            'Dr. Enjang Ali Nurdin, M.Kom',
          ),
          const Divider(height: 1),
          _buildScheduleItem(
            '10:00 - 11:40',
            'Data Mining',
            'R.2.3.05',
            'Dr. Yaya Wihardi, M.Kom',
          ),
          const Divider(height: 1),
          _buildScheduleItem(
            '13:00 - 14:40',
            'Machine Learning',
            'R.3.2.04',
            'Dr. Eki Nugraha, M.Kom',
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(
    String time,
    String subject,
    String room,
    String lecturer,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E5EA8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xFF1E5EA8),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      room,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      lecturer,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestAnnouncements() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildAnnouncementItem(
            'Pengisian KRS Semester Ganjil 2024/2025',
            'Mahasiswa diharapkan segera mengisi KRS untuk semester ganjil 2024/2025. Batas waktu pengisian adalah 15 Maret 2025.',
            '10 Mar 2025',
          ),
          const Divider(height: 1),
          _buildAnnouncementItem(
            'Seminar Nasional Teknologi Informasi',
            'UPI akan mengadakan Seminar Nasional Teknologi Informasi pada tanggal 20 Maret 2025 di Auditorium UPI.',
            '08 Mar 2025',
          ),
          const Divider(height: 1),
          _buildAnnouncementItem(
            'Pembaruan Sistem Elearning UPI',
            'Sistem Elearning UPI telah diperbarui dengan fitur baru. Silakan login untuk melihat pembaruan.',
            '05 Mar 2025',
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(
    String title,
    String content,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Mental Health
class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health'),
        backgroundColor: const Color(0xFF1E5EA8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Warna latar sebagai pengganti gambar
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red.shade300,
                          Colors.pink.shade200,
                        ],
                      ),
                    ),
                  ),
                  // Overlay text
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Kesehatan mental sama pentingnya dengan kesehatan fisik',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Hotline Section
            const Text(
              'Hotline Bantuan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildHotlineCard(
              'UPI Mental Health Center',
              'Konsultasi dengan psikolog kampus',
              '022-12345678',
              Icons.phone,
              Colors.blue,
            ),
            
            _buildHotlineCard(
              'Hotline Kesehatan Mental Nasional',
              'Layanan 24 jam untuk situasi krisis',
              '119',
              Icons.health_and_safety,
              Colors.red,
            ),
            
            _buildHotlineCard(
              'Layanan Konseling Online UPI',
              'Konsultasi online via aplikasi',
              'Buat Janji Temu',
              Icons.calendar_today,
              Colors.green,
            ),
            
            const SizedBox(height: 24),
            
            // Information Section
            const Text(
              'Artikel Kesehatan Mental',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildArticleCard(
              'Mengelola Stres Saat Ujian',
              'Tips untuk mengelola stres selama periode ujian dan tugas akhir',
              '5 min read',
            ),
            
            _buildArticleCard(
              'Pentingnya Dukungan Sosial',
              'Bagaimana teman dan keluarga dapat menjadi sistem pendukung yang baik',
              '8 min read',
            ),
            
            _buildArticleCard(
              'Teknik Relaksasi untuk Mahasiswa',
              'Teknik pernapasan dan meditasi singkat untuk meredakan kecemasan',
              '6 min read',
            ),
            
            const SizedBox(height: 24),
            
            // Mental Health Assessment
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.psychology,
                        color: Colors.purple,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Cek Kesehatan Mental',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Luangkan waktu 5 menit untuk mengisi kuesioner kesehatan mental dan dapatkan hasil secara langsung.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Mulai Kuesioner',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHotlineCard(
    String title,
    String subtitle,
    String contact,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            contact,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard(
    String title,
    String description,
    String readTime,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      readTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Baca Selengkapnya',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class AkademikScreen extends StatelessWidget {
  const AkademikScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transkrip Akademik'),
        backgroundColor: const Color(0xFF1E5EA8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Information Card
            _buildStudentInfoCard(),
            
            const SizedBox(height: 24),
            
            // Academic Summary
            _buildAcademicSummaryCard(),
            
            const SizedBox(height: 24),
            
            // Transcript Tabs
            _buildTranscriptTabs(),
            
            const SizedBox(height: 24),
            
            // Academic Progress Chart
            _buildAcademicProgressChart(),
            
            const SizedBox(height: 24),
            
            // Academic Achievement
            _buildAcademicAchievement(),
            
            const SizedBox(height: 24),
            
            // Download Actions
            _buildDownloadActions(),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E5EA8).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF1E5EA8),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Armelia Syahraini',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'NIM: 2307411',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ilmu Komputer - Semester 4',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStudentInfoItem(
                icon: Icons.school,
                title: 'Program',
                value: 'S1',
              ),
              _buildStudentInfoItem(
                icon: Icons.calendar_today,
                title: 'Angkatan',
                value: '2022',
              ),
              _buildStudentInfoItem(
                icon: Icons.person_outline,
                title: 'Dosen Wali',
                value: 'Dr. Harsa',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStudentInfoItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF1E5EA8),
          size: 20,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade800,
            Colors.blue.shade600,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Transkrip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAcademicStat('3.65', 'IPK'),
              _buildAcademicStat('87', 'SKS Lulus'),
              _buildAcademicStat('140', 'Total SKS'),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGradeCount('A', '12'),
              _buildGradeCount('B', '8'),
              _buildGradeCount('C', '3'),
              _buildGradeCount('D', '0'),
              _buildGradeCount('E', '0'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildGradeCount(String grade, String count) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              grade,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTranscriptTabs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Transkrip Mata Kuliah',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildTabHeader(),
              _buildSemesterTranscript('Semester 4 (Genap 2023/2024)'),
              _buildCourseTranscriptItem(
                'IK237',
                'Analisis dan Desain Algoritma',
                '3',
                'A-',
                'Yaya Wihardi, S.Kom., M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK250',
                'Sistem Operasi',
                '3',
                'B+',
                'Herbert, S.Kom., M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK290',
                'Desain dan Pemrograman Berorientasi Objek',
                '3',
                'A',
                'Rosa Ariani Sukamto, M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK300',
                'Pemrograman Visual dan Piranti Bergerak',
                '3',
                'B',
                'Dr. Yudi Wibisono, S.T., M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK400',
                'Metodologi Penelitian',
                '3',
                'A',
                'Rizky Rachman Judhie Putra, M.Kom.',
              ),
              _buildSemesterSummary('15', '3.78'),
              
              _buildSemesterTranscript('Semester 3 (Ganjil 2023/2024)'),
              _buildCourseTranscriptItem(
                'IK220',
                'Struktur Data',
                '3',
                'A',
                'Dr. Yaya Wihardi, S.Kom., M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK233',
                'Basis Data',
                '3',
                'B+',
                'Dr. Munir, M.IT.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK245',
                'Jaringan Komputer',
                '3',
                'A-',
                'Dr. Enjang, M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK255',
                'Rekayasa Perangkat Lunak',
                '3',
                'B',
                'Rizky Rachman Judhie Putra, M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK260',
                'Kecerdasan Buatan',
                '3',
                'A',
                'Dr. Lala Septem Riza, M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK274',
                'Grafika Komputer',
                '3',
                'B+',
                'Dr. Yudi Wibisono, S.T., M.T.',
              ),
              _buildSemesterSummary('18', '3.65'),
              
              _buildSemesterTranscript('Semester 2 (Genap 2022/2023)'),
              _buildCourseTranscriptItem(
                'IK120',
                'Algoritma dan Pemrograman',
                '4',
                'A',
                'Rosa Ariani Sukamto, M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK130',
                'Matematika Diskrit',
                '3',
                'B+',
                'Dr. Mumuh Muharam, M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK140',
                'Organisasi Komputer',
                '3',
                'B',
                'Herbert, S.Kom., M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK150',
                'Statistika',
                '3',
                'A-',
                'Dr. Lala Septem Riza, M.T.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'UNI102',
                'Bahasa Inggris',
                '2',
                'A',
                'Dr. Wawan Setiawan, M.Kom.',
              ),
              _buildSemesterSummary('15', '3.58'),
              
              _buildSemesterTranscript('Semester 1 (Ganjil 2022/2023)'),
              _buildCourseTranscriptItem(
                'IK110',
                'Pengantar Ilmu Komputer',
                '3',
                'A',
                'Dr. Munir, M.IT.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK111',
                'Kalkulus',
                '3',
                'B+',
                'Dr. Yulianti, M.Pd.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'IK114',
                'Fisika Dasar',
                '3',
                'B',
                'Dr. Enjang, M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'UNI101',
                'Pancasila',
                '2',
                'A',
                'Dr. Wawan Setiawan, M.Kom.',
              ),
              const Divider(height: 1),
              _buildCourseTranscriptItem(
                'UNI103',
                'Bahasa Indonesia',
                '2',
                'A-',
                'Dr. Yanti, M.Pd.',
              ),
              _buildSemesterSummary('13', '3.45'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Kode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Mata Kuliah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'SKS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Nilai',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterTranscript(String semester) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: const Color(0xFF1E5EA8).withOpacity(0.1),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            size: 16,
            color: Color(0xFF1E5EA8),
          ),
          const SizedBox(width: 8),
          Text(
            semester,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF1E5EA8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseTranscriptItem(
    String code,
    String courseName,
    String credit,
    String grade,
    String lecturer,
  ) {
    Color gradeColor;
    
    switch(grade) {
      case 'A':
        gradeColor = Colors.green;
        break;
      case 'A-':
        gradeColor = Colors.green.shade600;
        break;
      case 'B+':
        gradeColor = Colors.blue;
        break;
      case 'B':
        gradeColor = Colors.blue.shade600;
        break;
      case 'C':
        gradeColor = Colors.orange;
        break;
      default:
        gradeColor = Colors.red;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  code,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lecturer,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  credit,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: gradeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    grade,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: gradeColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterSummary(String credits, String gpa) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total SKS: $credits  |  ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            'IP Semester: $gpa',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF1E5EA8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicProgressChart() {
    // This would be a simplified chart representation
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Perkembangan Akademik',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'IP per Semester',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E5EA8).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tren Naik',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E5EA8),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Simple chart representation
              SizedBox(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildChartBar('Sem 1', 3.45, 0.86),
                    _buildChartBar('Sem 2', 3.58, 0.89),
                    _buildChartBar('Sem 3', 3.65, 0.91),
                    _buildChartBar('Sem 4', 3.78, 0.94),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChartBar(String label, double value, double height) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xFF1E5EA8),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 120 * height,
            width: 30,
            decoration: BoxDecoration(
              color: Color(0xFF1E5EA8).withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicAchievement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Prestasi Akademik',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildAchievementItem(
                'Mahasiswa Berprestasi Tingkat Fakultas',
                '2023',
                Icons.emoji_events,
                Colors.amber,
              ),
              const Divider(height: 1),
              _buildAchievementItem(
                'Juara 2 Kompetisi Pemrograman Tingkat Nasional',
                '2023',
                Icons.code,
                Colors.blue,
              ),
              const Divider(height: 1),
              _buildAchievementItem(
                'Dean\'s List - 3 Semester Berturut-turut',
                '2022-2023',
                Icons.star,
                Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementItem(
    String title,
    String year,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  year,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadActions() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E5EA8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Unduh Transkrip',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF1E5EA8)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.print,
                    color: Color(0xFF1E5EA8),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Cetak Transkrip',
                    style: TextStyle(
                      color: Color(0xFF1E5EA8),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class KeuanganScreen extends StatefulWidget {
  const KeuanganScreen({Key? key}) : super(key: key);

  @override
  State<KeuanganScreen> createState() => _KeuanganScreenState();
}

class _KeuanganScreenState extends State<KeuanganScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan'),
        backgroundColor: const Color(0xFF1E5EA8),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Ringkasan'),
            Tab(text: 'Pembayaran'),
            Tab(text: 'Beasiswa'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSummaryTab(),
          _buildPaymentsTab(),
          _buildScholarshipTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementasi fungsi untuk melakukan pembayaran
        },
        backgroundColor: const Color(0xFF1E5EA8),
        child: const Icon(Icons.payment),
      ),
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Financial Summary Card
          _buildFinancialSummaryCard(),
          
          const SizedBox(height: 24),
          
          // Payment Due Alert
          _buildPaymentDueAlert(),
          
          const SizedBox(height: 24),
          
          // Recent Transactions
          const Text(
            'Transaksi Terakhir',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildRecentTransactions(),
          
          const SizedBox(height: 24),
          
          // Financial Stats
          const Text(
            'Statistik Keuangan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildFinancialStats(),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFinancialSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade800,
            Colors.green.shade600,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ringkasan Keuangan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Semester 4',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Biaya Semester',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Rp 8.000.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dibayar: Rp 6.000.000 (75%)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'Sisa: Rp 2.000.000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFinancialStatItem('15 Mar', 'Jatuh Tempo'),
              _buildFinancialStatItem('3', 'Cicilan'),
              _buildFinancialStatItem('2', 'Terbayar'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentDueAlert() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.access_time,
              color: Colors.orange.shade800,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran UKT Jatuh Tempo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.orange.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Cicilan ke-3 senilai Rp 2.000.000 akan jatuh tempo pada 15 Maret 2025',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.orange.shade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildTransactionItem(
            'Pembayaran UKT Cicilan 2',
            '10 Jan 2025',
            'Rp 2.000.000',
            Colors.green,
            Icons.check_circle,
          ),
          const Divider(height: 1),
          _buildTransactionItem(
            'Pembayaran UKT Cicilan 1',
            '05 Nov 2024',
            'Rp 4.000.000',
            Colors.green,
            Icons.check_circle,
          ),
          const Divider(height: 1),
          _buildTransactionItem(
            'Denda Keterlambatan',
            '06 Nov 2024',
            'Rp 150.000',
            Colors.red,
            Icons.error,
          ),
          const Divider(height: 1),
          _buildTransactionItem(
            'Pembayaran Praktikum',
            '20 Oct 2024',
            'Rp 500.000',
            Colors.green,
            Icons.check_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    String title,
    String date,
    String amount,
    Color amountColor,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: amountColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: amountColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: amountColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildStatItem('UKT Semester Genap', 'Rp 8.000.000', 0.75),
          const SizedBox(height: 16),
          _buildStatItem('Biaya Praktikum', 'Rp 1.200.000', 1.0),
          const SizedBox(height: 16),
          _buildStatItem('Biaya Asrama', 'Rp 4.800.000', 0.5),
          const SizedBox(height: 16),
          _buildStatItem('Total Beasiswa', 'Rp 5.000.000', 1.0),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String amount, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1E5EA8)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          progress == 1.0 ? 'Lunas' : '${(progress * 100).toInt()}% dibayar',
          style: TextStyle(
            fontSize: 12,
            color: progress == 1.0 ? Colors.green : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Methods
          const Text(
            'Metode Pembayaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentMethods(),
          
          const SizedBox(height: 24),
          
          // Upcoming Payments
          const Text(
            'Pembayaran Mendatang',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildUpcomingPayments(),
          
          const SizedBox(height: 24),
          
          // Payment History
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Riwayat Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildPaymentHistory(),
          
          const SizedBox(height: 24),
          
          // Payment Instructions
          const Text(
            'Petunjuk Pembayaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentInstructions(),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPaymentMethodCard(
            'Virtual Account',
            'Bank BNI',
            Icons.account_balance,
            Colors.orange,
          ),
          _buildPaymentMethodCard(
            'E-Wallet',
            'DANA',
            Icons.account_balance_wallet,
            Colors.blue,
          ),
          _buildPaymentMethodCard(
            'Transfer Bank',
            'Bank Mandiri',
            Icons.sync_alt,
            Colors.green,
          ),
          _buildPaymentMethodCard(
            'QRIS',
            'Scan untuk Bayar',
            Icons.qr_code,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingPayments() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildUpcomingPaymentItem(
            'UKT Cicilan 3',
            'Rp 2.000.000',
            '15 Mar 2025',
            Colors.orange,
            'Belum Dibayar',
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingPaymentItem(
    String title,
    String amount,
    String dueDate,
    Color statusColor,
    String status,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumlah',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jatuh Tempo',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        dueDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E5EA8),
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Bayar Sekarang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentHistory() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildPaymentHistoryItem(
            'UKT Cicilan 2',
            'Rp 2.000.000',
            '10 Jan 2025',
            Colors.green,
            'Lunas',
            'Virtual Account BNI',
          ),
          const Divider(height: 1),
          _buildPaymentHistoryItem(
            'UKT Cicilan 1',
            'Rp 4.000.000',
            '05 Nov 2024',
            Colors.green,
            'Lunas',
            'Virtual Account BNI',
          ),
          const Divider(height: 1),
          _buildPaymentHistoryItem(
            'Praktikum Semester 4',
            'Rp 500.000',
            '20 Oct 2024',
            Colors.green,
            'Lunas',
            'DANA',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentHistoryItem(
    String title,
    String amount,
    String date,
    Color statusColor,
    String status,
    String method,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: statusColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Via $method • $date',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentInstructions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info,
                color: Colors.blue.shade700,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Cara Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInstructionStep(
            '1',
            'Pilih metode pembayaran yang tersedia',
          ),
          _buildInstructionStep(
            '2',
            'Catat nomor Virtual Account atau QR Code',
          ),
          _buildInstructionStep(
            '3',
            'Lakukan pembayaran melalui ATM, Mobile Banking, atau E-Wallet',
          ),
          _buildInstructionStep(
            '4',
            'Simpan bukti pembayaran sebagai referensi',
          ),
          _buildInstructionStep(
            '5',
            'Status pembayaran akan diperbarui dalam 1x24 jam',
          ),
          const SizedBox(height: 16),
          Text(
            'Kontak Bantuan: keuangan@upi.edu atau (022) 2013163 ext. 128',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.blue.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Active Scholarships
          const Text(
            'Beasiswa Aktif',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildActiveScholarships(),
          
          const SizedBox(height: 24),
          
          // Scholarship Opportunities
          const Text(
            'Peluang Beasiswa',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildScholarshipOpportunities(),
          
          const SizedBox(height: 24),
          
          // Application History
          const Text(
            'Riwayat Aplikasi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildApplicationHistory(),
          
          const SizedBox(height: 24),
          
          // Scholarship Guidelines
          const Text(
            'Panduan Beasiswa',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildScholarshipGuidelines(),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildActiveScholarships() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildActiveScholarshipItem(
            'Beasiswa Prestasi UPI',
            'Rp 5.000.000',
            'Jan 2025 - Jun 2025',
            Icons.school,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildActiveScholarshipItem(
    String title,
    String amount,
    String period,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
  period,
  style: TextStyle(
    fontSize: 13,
    color: Colors.grey.shade700,
  ),
),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Aktif',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumlah Beasiswa',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Detail',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Periode penggunaan: 50% dari total',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipOpportunities() {
    return Container(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildScholarshipOpportunityCard(
            'Beasiswa KIP Kuliah',
            'Deadline: 20 Apr 2025',
            'Beasiswa dari pemerintah untuk mahasiswa kurang mampu',
            Colors.blue,
            Icons.account_balance,
          ),
          _buildScholarshipOpportunityCard(
            'Beasiswa LPDP',
            'Deadline: 15 May 2025',
            'Beasiswa pendidikan untuk program sarjana dan pascasarjana',
            Colors.orange,
            Icons.school,
          ),
          _buildScholarshipOpportunityCard(
            'Beasiswa Bank Indonesia',
            'Deadline: 30 Apr 2025',
            'Beasiswa prestasi untuk mahasiswa jurusan ekonomi dan bisnis',
            Colors.green,
            Icons.monetization_on,
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipOpportunityCard(
    String title,
    String deadline,
    String description,
    Color color,
    IconData icon,
  ) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                deadline,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Daftar Sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationHistory() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildApplicationHistoryItem(
            'Beasiswa Prestasi UPI',
            '10 Dec 2024',
            Colors.green,
            'Diterima',
            Icons.check_circle,
          ),
          const Divider(height: 1),
          _buildApplicationHistoryItem(
            'Beasiswa Djarum',
            '05 Oct 2024',
            Colors.red,
            'Ditolak',
            Icons.cancel,
          ),
          const Divider(height: 1),
          _buildApplicationHistoryItem(
            'Beasiswa PPA',
            '20 Aug 2024',
            Colors.blue,
            'Sedang Diproses',
            Icons.hourglass_empty,
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationHistoryItem(
    String title,
    String date,
    Color statusColor,
    String status,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: statusColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tanggal Aplikasi: $date',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipGuidelines() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Syarat dan Ketentuan Umum',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildGuidelineItem(
            'Mahasiswa aktif dengan IPK minimal 3.00',
          ),
          _buildGuidelineItem(
            'Tidak sedang menerima beasiswa dari sumber lain',
          ),
          _buildGuidelineItem(
            'Melampirkan surat keterangan tidak mampu (untuk beasiswa bantuan)',
          ),
          _buildGuidelineItem(
            'Aktif dalam kegiatan kemahasiswaan (untuk beasiswa prestasi)',
          ),
          _buildGuidelineItem(
            'Mendapat rekomendasi dari dosen pembimbing akademik',
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.blue.shade700,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Persyaratan dapat berbeda untuk setiap program beasiswa. Pastikan untuk memeriksa detail persyaratan pada masing-masing beasiswa.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Unduh Panduan Lengkap'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 225, 248, 170),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelineItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MedsosScreen extends StatefulWidget {
  const MedsosScreen({Key? key}) : super(key: key);

  @override
  State<MedsosScreen> createState() => _MedsosScreenState();
}

class _MedsosScreenState extends State<MedsosScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _statusController = TextEditingController();
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Sosial UPI'),
        backgroundColor: const Color(0xFF1E5EA8),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Timeline'),
            Tab(text: 'Trending'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: _isComposing
          ? _buildComposeWidget()
          : TabBarView(
              controller: _tabController,
              children: [
                _buildTimeline(),
                _buildTrendingSection(),
              ],
            ),
      floatingActionButton: !_isComposing
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF1E5EA8),
              onPressed: () {
                setState(() {
                  _isComposing = true;
                });
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildTimeline() {
    return RefreshIndicator(
      onRefresh: () async {
        // Simulate refresh
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10, // Mock data count
        itemBuilder: (context, index) {
          // Generate post types randomly for demo
          final postType = index % 3;
          return _buildPostCard(postType);
        },
      ),
    );
  }

  Widget _buildTrendingSection() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5, // Mock data count for trending
      itemBuilder: (context, index) {
        return _buildTrendingCard(index);
      },
    );
  }

  Widget _buildPostCard(int type) {
    // Types: 0 = status, 1 = image, 2 = video
    final postUser = _getRandomUser();
    final isLiked = Random().nextBool();
    final likes = Random().nextInt(100) + 1;
    final comments = Random().nextInt(20);
    final timeAgo = '${Random().nextInt(12) + 1} jam yang lalu';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: postUser.color,
                  radius: 20,
                  child: Text(
                    postUser.name[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postUser.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        timeAgo,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    // Show options menu
                  },
                ),
              ],
            ),
          ),
          
          if (type == 0) // Status post
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                _getRandomStatus(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            
          if (type == 1) // Image post
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    _getRandomImageCaption(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ],
            ),
            
          if (type == 2) // Video post
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    _getRandomVideoCaption(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey.shade800,
                      child: const Icon(
                        Icons.videocam,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          // Play video
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text('$likes'),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text('$comments'),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
          
          const Divider(height: 1),
          
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Handle like
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text('Suka'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Show comment dialog
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text('Komentar'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Show share options
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text('Bagikan'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCard(int index) {
    final topic = _getTrendingTopics()[index % _getTrendingTopics().length];
    final postCount = Random().nextInt(500) + 100;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E5EA8).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: const Text(
                    'Trending',
                    style: TextStyle(
                      color: Color(0xFF1E5EA8),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '#${topic.replaceAll(' ', '')}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$postCount posts dalam 24 jam terakhir',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                3,
                (i) => Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComposeWidget() {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              setState(() {
                _isComposing = false;
                _statusController.clear();
              });
            },
          ),
          title: const Text(
            'Buat Postingan',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle post submission
                setState(() {
                  _isComposing = false;
                  _statusController.clear();
                });
                
                // Show confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Postingan berhasil dibuat!'),
                    backgroundColor: Color(0xFF1E5EA8),
                  ),
                );
              },
              child: const Text(
                'POST',
                style: TextStyle(
                  color: Color(0xFF1E5EA8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _statusController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Apa yang sedang Kamu pikirkan?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMediaButton(Icons.photo, 'Foto', Colors.green),
              _buildMediaButton(Icons.videocam, 'Video', Colors.red),
              _buildMediaButton(Icons.emoji_emotions, 'Feelings', Colors.amber),
              _buildMediaButton(Icons.location_on, 'Lokasi', Colors.blue),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Show audience selector
                  },
                  icon: const Icon(Icons.public),
                  label: const Text('Publik'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMediaButton(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        // Handle media button tap
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }

  // Helper methods to generate mock data
  MockUser _getRandomUser() {
    final users = [
      MockUser('Ahmad Rizki', Colors.blue),
      MockUser('Siti Fatimah', Colors.purple),
      MockUser('Budi Santoso', Colors.orange),
      MockUser('Dewi Lestari', Colors.pink),
      MockUser('Arif Setiawan', Colors.teal),
    ];
    return users[Random().nextInt(users.length)];
  }

  String _getRandomStatus() {
    final statuses = [
      'Akhirnya selesai tugas Data Mining! 😴 Waktunya istirahat.',
      'Ada yang mau jadi partner projek Machine Learning? DM ya!',
      'UTS minggu depan, semangat belajar teman-teman! 📚',
      'Jangan lupa kumpul tugas pemrograman mobile hari ini!',
      'Workshop AI besok di Auditorium UPI, yang mau ikut comment ya.',
    ];
    return statuses[Random().nextInt(statuses.length)];
  }

  String _getRandomImageCaption() {
    final captions = [
      'Suasana kelas hari ini. Learning is fun! 📸',
      'Bukti sudah mengerjakan tugas praktikum 😁',
      'Bersama teman-teman di lab komputer #Coding #ITLife',
      'Momen saat berhasil mengerjakan soal yg susah 🎉',
      'View dari perpustakaan UPI pagi ini. Selamat belajar!',
    ];
    return captions[Random().nextInt(captions.length)];
  }

  String _getRandomVideoCaption() {
    final captions = [
      'Demo aplikasi untuk tugas akhir semester',
      'Tutorial pemrograman mobile part 1 #Flutter',
      'Dokumentasi presentasi kelompok Data Mining',
      'Cuplikan acara workshop teknologi kemarin',
      'Live dari seminar teknologi di kampus UPI',
    ];
    return captions[Random().nextInt(captions.length)];
  }

  List<String> _getTrendingTopics() {
    return [
      'Seminar Teknologi',
      'Tugas Akhir',
      'Workshop AI',
      'Mobile Programming',
      'Lomba Coding',
    ];
  }
}

class MockUser {
  final String name;
  final Color color;

  MockUser(this.name, this.color);
}



class ElearningScreen extends StatelessWidget {
  const ElearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Learning'),
        backgroundColor: const Color(0xFF1E5EA8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with welcome message
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Selamat Datang di Platform E-Learning',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E5EA8),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Akses materi pembelajaran dan tugas Anda di sini',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Course section
            const Text(
              'Kursus Terbaru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCoursesList(),
            
            const SizedBox(height: 32),
            
            // Assignment section
            const Text(
              'Tugas Mendatang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildAssignmentsList(),
            
            const SizedBox(height: 32),
            
            // Resources section
            const Text(
              'Materi Tambahan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildResourcesList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1E5EA8),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Kursus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Tugas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesList() {
    // Updated course data based on the provided table
    final courses = [
      {
        'title': 'IK300 - Pemrograman Visual dan Piranti Bergerak',
        'instructor': 'Dr. Yudi Wibisono, S.T., M.T.',
        'progress': 0.7,
        'icon': Icons.phone_android,
        'color': Colors.blue,
      },
      {
        'title': 'IK290 - Desain dan Pemrograman Berorientasi Objek',
        'instructor': 'Rosa Ariani Sukamto, M.T.',
        'progress': 0.4,
        'icon': Icons.code,
        'color': Colors.green,
      },
      {
        'title': 'IK237 - Analisis dan Desain Algoritma',
        'instructor': 'Yaya Wihardi, S.Kom., M.Kom.',
        'progress': 0.9,
        'icon': Icons.analytics,
        'color': Colors.orange,
      },
      {
        'title': 'IK250 - Sistem Operasi',
        'instructor': 'Herbert, S.Kom., M.T.',
        'progress': 0.5,
        'icon': Icons.computer,
        'color': Colors.purple,
      },
      {
        'title': 'IK545 - Big Data Platforms',
        'instructor': 'Prof. Dr. Lala Septem Riza, M.T.',
        'progress': 0.3,
        'icon': Icons.storage,
        'color': Colors.red,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: course['color'] as Color,
              child: Icon(
                course['icon'] as IconData,
                color: Colors.white,
              ),
            ),
            title: Text(
              course['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(course['instructor'] as String),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: course['progress'] as double,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    const Color(0xFF1E5EA8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${((course['progress'] as double) * 100).toInt()}% selesai',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to course detail
            },
          ),
        );
      },
    );
  }

  Widget _buildAssignmentsList() {
    // Updated assignment data based on the courses in the table
    final assignments = [
      {
        'title': 'UTS Pemrograman Visual dan Piranti Bergerak',
        'course': 'IK300 - Pemrograman Visual dan Piranti Bergerak',
        'dueDate': '25 Maret 2025, 23:59',
        'status': 'Belum Dikerjakan',
      },
      {
        'title': 'Project Desain dan Pemrograman Berorientasi Objek',
        'course': 'IK290 - Desain dan Pemrograman Berorientasi Objek',
        'dueDate': '30 Maret 2025, 23:59',
        'status': 'Belum Dikerjakan',
      },
      {
        'title': 'Quiz Analisis dan Desain Algoritma',
        'course': 'IK237 - Analisis dan Desain Algoritma',
        'dueDate': '22 Maret 2025, 23:59',
        'status': 'Belum Dikerjakan',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              assignment['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Kursus: ${assignment['course']}'),
                const SizedBox(height: 4),
                Text('Tenggat: ${assignment['dueDate']}'),
                const SizedBox(height: 4),
                Text(
                  'Status: ${assignment['status']}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E5EA8),
              ),
              onPressed: () {
                // Navigate to assignment detail
              },
              child: const Text(
                'Lihat',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              // Navigate to assignment detail
            },
          ),
        );
      },
    );
  }

  Widget _buildResourcesList() {
    // Updated resources data based on the courses in the table
    final resources = [
      {
        'title': 'Modul Pemrograman Visual',
        'type': 'PDF',
        'size': '2.5 MB',
        'icon': Icons.picture_as_pdf,
        'color': Colors.red,
        'course': 'IK300 - Pemrograman Visual dan Piranti Bergerak',
      },
      {
        'title': 'Tutorial OOP Java',
        'type': 'Video',
        'size': '45 Menit',
        'icon': Icons.video_library,
        'color': Colors.purple,
        'course': 'IK290 - Desain dan Pemrograman Berorientasi Objek',
      },
      {
        'title': 'Materi Algoritma Kompleksitas',
        'type': 'ZIP',
        'size': '5.8 MB',
        'icon': Icons.folder_zip,
        'color': Colors.amber,
        'course': 'IK237 - Analisis dan Desain Algoritma',
      },
      {
        'title': 'Slide Big Data Processing',
        'type': 'PDF',
        'size': '3.2 MB',
        'icon': Icons.picture_as_pdf,
        'color': Colors.green,
        'course': 'IK545 - Big Data Platforms',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resources.length,
      itemBuilder: (context, index) {
        final resource = resources[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: CircleAvatar(
              backgroundColor: resource['color'] as Color,
              child: Icon(
                resource['icon'] as IconData,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text(
              resource['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${resource['type']} • ${resource['size']}'),
                const SizedBox(height: 2),
                Text(
                  resource['course'] as String,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.download, color: Color(0xFF1E5EA8)),
              onPressed: () {
                // Download logic
              },
            ),
            onTap: () {
              // Open resource
            },
          ),
        );
      },
    );
  }
}

class JadwalTodoScreen extends StatefulWidget {
  const JadwalTodoScreen({Key? key}) : super(key: key);

  @override
  State<JadwalTodoScreen> createState() => _JadwalTodoScreenState();
}

class _JadwalTodoScreenState extends State<JadwalTodoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _todoController = TextEditingController();
  final List<Map<String, dynamic>> _todos = [];
  DateTime _selectedDate = DateTime.now();

  // Custom date formatter to replace intl.DateFormat
  String formatDate(DateTime date) {
    final List<String> monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    
    String day = date.day.toString().padLeft(2, '0');
    String month = monthNames[date.month - 1];
    String year = date.year.toString();
    
    return '$day $month $year';
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Add a listener to update state when tab changes
    _tabController.addListener(() {
      setState(() {
        // This will trigger a rebuild when tab changes
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todos.add({
          'title': _todoController.text,
          'date': _selectedDate,
          'completed': false,
        });
        _todoController.clear();
      });
    }
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index]['completed'] = !_todos[index]['completed'];
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal & Todo'),
        backgroundColor: const Color(0xFF1E5EA8),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.black, // Changed tab text color to black
          unselectedLabelColor: Colors.black54, // Changed unselected tab text to dark gray
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, // Made selected tab text bold for better visibility
          ),
          tabs: const [
            Tab(text: 'Jadwal Kuliah'),
            Tab(text: 'Jadwal Tugas'),
            Tab(text: 'Todo List'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildJadwalKuliahTab(),
          _buildJadwalTugasTab(),
          _buildTodoListTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 2 
        ? FloatingActionButton(
            backgroundColor: const Color(0xFF1E5EA8),
            onPressed: () {
              _showAddTodoDialog(context);
            },
            child: const Icon(Icons.add),
          )
        : null,
    );
  }

  Widget _buildJadwalKuliahTab() {
    // Updated data for class schedule based on provided table
    final List<Map<String, dynamic>> jadwalKuliah = [
      {
        'hari': 'Senin',
        'mataKuliah': [
          {'nama': 'ANALISIS DAN DESAIN ALGORITMA', 'kode': 'IK237', 'waktu': '08:00 - 09:40', 'ruang': 'Ruang 3.2', 'dosen': 'Yaya Wihardi, S.Kom., M.Kom.'},
          {'nama': 'METODOLOGI PENELITIAN', 'kode': 'IK400', 'waktu': '13:00 - 14:40', 'ruang': 'Ruang 2.1', 'dosen': 'Rizky Rachman Judhie Putra, M.Kom.'},
        ],
      },
      {
        'hari': 'Selasa',
        'mataKuliah': [
          {'nama': 'SISTEM OPERASI', 'kode': 'IK250', 'waktu': '10:00 - 11:40', 'ruang': 'Lab Komputer 2', 'dosen': 'Herbert, S.Kom., M.T.'},
          {'nama': 'BIG DATA PLATFORMS', 'kode': 'IK545', 'waktu': '14:30 - 16:10', 'ruang': 'Lab Komputer 1', 'dosen': 'Prof. Dr. Lala Septem Riza, M.T.'},
        ],
      },
      {
        'hari': 'Rabu',
        'mataKuliah': [
          {'nama': 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK', 'kode': 'IK290', 'waktu': '07:30 - 09:10', 'ruang': 'Lab Komputer 3', 'dosen': 'Rosa Ariani Sukamto, M.T.'},
          {'nama': 'PROYEK KONSULTANSI', 'kode': 'PT502', 'waktu': '13:00 - 16:10', 'ruang': 'Ruang 4.3', 'dosen': 'Eddy Prasetyo Nugroho, M.T.'},
        ],
      },
      {
        'hari': 'Kamis',
        'mataKuliah': [
          {'nama': 'PEMROGRAMAN VISUAL DAN PIRANTI BERGERAK', 'kode': 'IK300', 'waktu': '09:30 - 11:10', 'ruang': 'Lab Komputer 1', 'dosen': 'Dr. Yudi Wibisono, S.T., M.T.'},
        ],
      },
      {
        'hari': 'Jumat',
        'mataKuliah': [
          {'nama': 'SOFTWARE QUALITY ASSURANCE', 'kode': 'IK581', 'waktu': '13:00 - 14:40', 'ruang': 'Ruang 1.1', 'dosen': 'Yudi Ahmad Hambali, S.Kom., M.T.'},
        ],
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: jadwalKuliah.length,
      itemBuilder: (context, index) {
        final jadwal = jadwalKuliah[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E5EA8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                child: Text(
                  jadwal['hari'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jadwal['mataKuliah'].length,
                itemBuilder: (context, idx) {
                  final matkul = jadwal['mataKuliah'][idx];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    title: Text(
                      '${matkul['kode']} - ${matkul['nama']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(matkul['waktu']),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.room, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(matkul['ruang']),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(matkul['dosen']),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.alarm_add),
                      onPressed: () {
                        // Add reminder logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Pengingat ditambahkan untuk ${matkul['nama']}'))
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJadwalTugasTab() {
    // Updated assignment schedule to match the courses from the table
    final List<Map<String, dynamic>> jadwalTugas = [
      {
        'judul': 'UTS ANALISIS DAN DESAIN ALGORITMA',
        'mataKuliah': 'ANALISIS DAN DESAIN ALGORITMA',
        'kode': 'IK237',
        'tenggat': DateTime(2025, 3, 25),
        'deskripsi': 'Menganalisis kompleksitas algoritma sorting dan membuat implementasinya',
        'prioritas': 'Tinggi',
      },
      {
        'judul': 'Project DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        'mataKuliah': 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        'kode': 'IK290',
        'tenggat': DateTime(2025, 3, 30),
        'deskripsi': 'Membuat aplikasi menggunakan prinsip OOP dengan minimal 5 kelas',
        'prioritas': 'Tinggi',
      },
      {
        'judul': 'Makalah METODOLOGI PENELITIAN',
        'mataKuliah': 'METODOLOGI PENELITIAN',
        'kode': 'IK400',
        'tenggat': DateTime(2025, 4, 5),
        'deskripsi': 'Membuat proposal penelitian dengan metode kuantitatif',
        'prioritas': 'Sedang',
      },
      {
        'judul': 'Presentasi SOFTWARE QUALITY ASSURANCE',
        'mataKuliah': 'SOFTWARE QUALITY ASSURANCE',
        'kode': 'IK581',
        'tenggat': DateTime(2025, 4, 10),
        'deskripsi': 'Presentasi mengenai penerapan metode testing dalam pengembangan software',
        'prioritas': 'Sedang',
      },
      {
        'judul': 'Project BIG DATA PLATFORMS',
        'mataKuliah': 'BIG DATA PLATFORMS',
        'kode': 'IK545',
        'tenggat': DateTime(2025, 4, 15),
        'deskripsi': 'Implementasi hadoop untuk analisis dataset besar',
        'prioritas': 'Tinggi',
      },
    ];

    // Sort assignments by due date
    jadwalTugas.sort((a, b) => a['tenggat'].compareTo(b['tenggat']));

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: jadwalTugas.length,
      itemBuilder: (context, index) {
        final tugas = jadwalTugas[index];
        final bool isNearDeadline = tugas['tenggat'].difference(DateTime.now()).inDays < 7;
        
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: tugas['prioritas'] == 'Tinggi' ? Colors.red : 
                    tugas['prioritas'] == 'Sedang' ? Colors.orange : Colors.green,
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: tugas['prioritas'] == 'Tinggi' ? Colors.red : 
                               tugas['prioritas'] == 'Sedang' ? Colors.orange : Colors.green,
                  child: const Icon(Icons.assignment, color: Colors.white),
                ),
                title: Text(
                  tugas['judul'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('${tugas['kode']} - ${tugas['mataKuliah']}'),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          'Tenggat: ${formatDate(tugas['tenggat'])}',
                          style: TextStyle(
                            color: isNearDeadline ? Colors.red : null,
                            fontWeight: isNearDeadline ? FontWeight.bold : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    // Detail logic
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(tugas['deskripsi']),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Prioritas: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: tugas['prioritas'] == 'Tinggi' ? Colors.red : 
                                  tugas['prioritas'] == 'Sedang' ? Colors.orange : Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tugas['prioritas'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E5EA8),
                        ),
                        onPressed: () {
                          // Add to todo list logic
                          setState(() {
                            _todos.add({
                              'title': 'Kerjakan ${tugas['judul']}',
                              'date': tugas['tenggat'],
                              'completed': false,
                            });
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${tugas['judul']} ditambahkan ke Todo List'))
                          );
                        },
                        child: const Text(
                          'Tambah ke Todo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTodoListTab() {
    return Column(
      children: [
        Expanded(
          child: _todos.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Belum ada tugas',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tekan tombol + untuk menambahkan',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _todos.length,
                  itemBuilder: (context, index) {
                    final todo = _todos[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        leading: Checkbox(
                          value: todo['completed'],
                          activeColor: const Color(0xFF1E5EA8),
                          onChanged: (_) => _toggleTodoStatus(index),
                        ),
                        title: Text(
                          todo['title'],
                          style: TextStyle(
                            decoration: todo['completed'] ? TextDecoration.lineThrough : null,
                            color: todo['completed'] ? Colors.grey : null,
                          ),
                        ),
                        subtitle: Text(
                          'Tenggat: ${formatDate(todo['date'])}',
                          style: TextStyle(
                            decoration: todo['completed'] ? TextDecoration.lineThrough : null,
                            color: todo['completed'] ? Colors.grey : todo['date'].isBefore(DateTime.now()) ? Colors.red : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTodo(index),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _todoController,
                decoration: const InputDecoration(
                  labelText: 'Tugas',
                  hintText: 'Masukkan tugas yang akan dikerjakan',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Tenggat: '),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(formatDate(_selectedDate)),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E5EA8),
              ),
              onPressed: () {
                _addTodo();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Tambah',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}


class PesanGroupScreen extends StatefulWidget {
  const PesanGroupScreen({Key? key}) : super(key: key);

  @override
  State<PesanGroupScreen> createState() => _PesanGroupScreenState();
}

class _PesanGroupScreenState extends State<PesanGroupScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching 
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Cari berdasarkan NIM/Nama...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
            )
          : const Text('Pesan & Group'),
        backgroundColor: const Color(0xFF1E5EA8),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu options
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'new_group',
                  child: Text('Grup Baru'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Pengaturan'),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'CHAT'),
            Tab(text: 'GROUP'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Chat tab content
          _buildChatList(),
          
          // Group tab content
          _buildGroupList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewMessageDialog(context);
        },
        backgroundColor: const Color(0xFF1E5EA8),
        child: const Icon(Icons.message),
      ),
    );
  }

  Widget _buildChatList() {
    // Mock data for chats
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Dr. Yudi Wibisono',
        'nim_nip': 'NIP: 198506152010121002',
        'message': 'Tolong kirimkan tugas minggu depan',
        'time': '10:30',
        'isUnread': true,
        'unreadCount': 2,
      },
      {
        'name': 'Ravy Nugraha',
        'nim_nip': 'NIM: 2307411023',
        'message': 'Kapan jadwal bimbingan berikutnya?',
        'time': '09:15',
        'isUnread': false,
        'unreadCount': 0,
      },
      {
        'name': 'Pak Yudi Hambali',
        'nim_nip': 'NIP: 197304202005011001',
        'message': 'Kelas hari ini ditunda ke jam 14.00',
        'time': 'Kemarin',
        'isUnread': false,
        'unreadCount': 0,
      },
      {
        'name': 'Yusuf Yadin',
        'nim_nip': 'NIM: 2307411045',
        'message': 'Apakah kamu sudah mengumpulkan tugas PBO?',
        'time': 'Kemarin',
        'isUnread': true,
        'unreadCount': 1,
      },
    ];

    return Container(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF1E5EA8),
              child: Text(
                chat['name'].substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              chat['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat['nim_nip'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  chat['message'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: SizedBox(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    chat['time'],
                    style: TextStyle(
                      color: chat['isUnread'] ? const Color(0xFF1E5EA8) : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (chat['isUnread'])
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E5EA8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unreadCount'].toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
            onTap: () {
              // Navigate to chat detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(
                    name: chat['name'],
                    nimNip: chat['nim_nip'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildGroupList() {
    // Mock data for groups
    final List<Map<String, dynamic>> groups = [
      {
        'name': 'Kelas IF-42-01',
        'participants': '32 Anggota',
        'message': 'Bu Rossa: Tugas sudah saya upload di e-learning',
        'time': '11:45',
        'isUnread': true,
        'unreadCount': 5,
      },
      {
        'name': 'Asisten Dosen PBO',
        'participants': '8 Anggota',
        'message': 'Pak Joko: Praktikum hari Rabu jam 13.00',
        'time': '08:30',
        'isUnread': false,
        'unreadCount': 0,
      },
      {
        'name': 'Kelompok Tugas Akhir',
        'participants': '4 Anggota',
        'message': 'Ravy: Sudah saya revisi bagian metodologi',
        'time': 'Kemarin',
        'isUnread': true,
        'unreadCount': 3,
      },
      {
        'name': 'BEM FPMIPA',
        'participants': '25 Anggota',
        'message': 'Ketua: Rapat hari Jumat jam 16.00 di Aula',
        'time': '23/05',
        'isUnread': false,
        'unreadCount': 0,
      },
    ];

    return Container(
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade600,
              child: const Icon(Icons.group, color: Colors.white),
            ),
            title: Text(
              group['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group['participants'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  group['message'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: SizedBox(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    group['time'],
                    style: TextStyle(
                      color: group['isUnread'] ? Colors.green.shade600 : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (group['isUnread'])
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        group['unreadCount'].toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
            onTap: () {
              // Navigate to group chat detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(
                    name: group['name'],
                    nimNip: group['participants'],
                    isGroup: true,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showNewMessageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          // Remove the Column and use a SizedBox with fixed height for the list
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pesan Baru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari berdasarkan NIM atau nama...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kontak Terbaru',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // The key fix: use a SizedBox with fixed height instead of Expanded
              SizedBox(
                height: 250, // Fixed height for contacts list
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildContactTile('Dr. Yudi Wibisono', 'NIP: 198506152010121002'),
                    _buildContactTile('Ravy Nugraha', 'NIM: 2307411023'),
                    _buildContactTile('Pak Yudi Hambali', 'NIP: 197304202005011001'),
                    _buildContactTile('Yusuf Yadin', 'NIM: 2307411045'),
                    _buildContactTile('Prodi Ilmu Komputer', 'Admin'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  Widget _buildContactTile(String name, String nimNip) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF1E5EA8),
        child: Text(
          name.substring(0, 1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(name),
      subtitle: Text(nimNip),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: name,
              nimNip: nimNip,
            ),
          ),
        );
      },
    );
  }
}

// Chat Detail Screen
class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String nimNip;
  final bool isGroup;

  const ChatDetailScreen({
    Key? key,
    required this.name,
    required this.nimNip,
    this.isGroup = false,
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load mock messages
    _loadMockMessages();
  }

  void _loadMockMessages() {
    // Add some mock messages for demonstration
    _messages.addAll([
      {
        'text': 'Halo, bagaimana kabarnya?',
        'time': '10:30',
        'isMe': false,
      },
      {
        'text': 'Baik, terima kasih. Ada yang bisa saya bantu?',
        'time': '10:32',
        'isMe': true,
      },
      {
        'text': 'Saya ingin menanyakan tentang jadwal kuliah besok',
        'time': '10:33',
        'isMe': false,
      },
      {
        'text': 'Jadwal kuliah besok dimulai jam 08.00 untuk kelas Algoritma',
        'time': '10:35',
        'isMe': true,
      },
    ]);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'time': '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
          'isMe': true,
        });
        _messageController.clear();
      });
      
      // Scroll to bottom after sending message
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
      
      // Simulate reply for demo purposes
      if (!widget.isGroup) {
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _messages.add({
              'text': 'Baik, akan saya proses segera.',
              'time': '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
              'isMe': false,
            });
          });
          
          // Scroll to bottom after receiving message
          Future.delayed(const Duration(milliseconds: 100), () {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E5EA8),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.isGroup ? Colors.green.shade600 : const Color(0xFF1E5EA8),
              child: widget.isGroup 
                ? const Icon(Icons.group, color: Colors.white)
                : Text(
                    widget.name.substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.nimNip,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Video call functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Voice call functionality
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu options
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'view_profile',
                  child: Text('Lihat Profil'),
                ),
                if (widget.isGroup)
                  const PopupMenuItem(
                    value: 'group_info',
                    child: Text('Info Grup'),
                  ),
                const PopupMenuItem(
                  value: 'search',
                  child: Text('Cari'),
                ),
                const PopupMenuItem(
                  value: 'clear',
                  child: Text('Hapus Chat'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages area
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(
                  message['text'],
                  message['time'],
                  message['isMe'],
                );
              },
            ),
          ),
          
          // Message input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {
                    // Attachment functionality
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    maxLines: null,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF1E5EA8)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: const Color(0xFF1E5EA8),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.black,
          tabs: const [
            Tab(text: 'Jadwal Kuliah', icon: Icon(Icons.calendar_today, color: Colors.black)),
            Tab(text: 'Todo Kuliah', icon: Icon(Icons.assignment, color: Colors.black)),
            Tab(text: 'Pengumuman', icon: Icon(Icons.campaign, color: Colors.black)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildJadwalKuliahTab(),
          _buildTugasTab(),
          _buildPengumumanTab(),
        ],
      ),
    );
  }
  
  Widget _buildJadwalKuliahTab() {
    // Data jadwal kuliah berdasarkan data yang diberikan
    final jadwalItems = [
      NotifikasiItem(
        title: 'ANALISIS DAN DESAIN ALGORITMA',
        time: '08:00 - 09:40',
        date: 'Hari ini',
        description: 'Ruang 301, Gedung Teknik. Dosen: Yaya Wihardi, S.Kom., M.Kom.',
        isNew: true,
        mataKuliah: 'ANALISIS DAN DESAIN ALGORITMA',
        kodeKelas: 'IK237',
        sks: '3',
        kodeDosen: '2878',
        namaDosen: 'Yaya Wihardi, S.Kom., M.Kom.',
      ),
      NotifikasiItem(
        title: 'SISTEM OPERASI',
        time: '10:00 - 11:40',
        date: 'Hari ini',
        description: 'Lab Komputer 2, Gedung Informatika. Dosen: Herbert, S.Kom., M.T.',
        isNew: true,
        mataKuliah: 'SISTEM OPERASI',
        kodeKelas: 'IK250',
        sks: '3',
        kodeDosen: '2591',
        namaDosen: 'Herbert, S.Kom., M.T.',
      ),
      NotifikasiItem(
        title: 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        time: '13:00 - 14:40',
        date: 'Besok',
        description: 'Ruang 405, Gedung Teknik. Dosen: Rosa Ariani Sukamto, M.T.',
        isNew: false,
        mataKuliah: 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        kodeKelas: 'IK290',
        sks: '3',
        kodeDosen: '2658',
        namaDosen: 'Rosa Ariani Sukamto, M.T.',
      ),
      NotifikasiItem(
        title: 'PEMROGRAMAN VISUAL DAN PIRANTI BERGERAK',
        time: '08:00 - 09:40',
        date: '15 Maret 2025',
        description: 'Lab Mobile, Gedung Informatika. Dosen: Dr. Yudi Wibisono, S.T., M.T.',
        isNew: false,
        mataKuliah: 'PEMROGRAMAN VISUAL DAN PIRANTI BERGERAK',
        kodeKelas: 'IK300',
        sks: '3',
        kodeDosen: '2231',
        namaDosen: 'Dr. Yudi Wibisono, S.T., M.T.',
      ),
    ];
    
    return _buildNotificationList(jadwalItems, NotifikasiJenis.jadwal);
  }
  
  Widget _buildTugasTab() {
    // Data tugas kuliah berdasarkan data yang diberikan
    final tugasItems = [
      NotifikasiItem(
        title: 'Tugas ANALISIS DAN DESAIN ALGORITMA',
        time: 'Deadline: 23:59',
        date: 'Hari ini',
        description: 'Implementasi algoritma sorting dan searching',
        isNew: true,
        mataKuliah: 'ANALISIS DAN DESAIN ALGORITMA',
        kodeKelas: 'IK237',
        sks: '3',
        kodeDosen: '2878',
        namaDosen: 'Yaya Wihardi, S.Kom., M.Kom.',
      ),
      NotifikasiItem(
        title: 'Project BIG DATA PLATFORMS',
        time: 'Deadline: 12:00',
        date: 'Besok',
        description: 'Implementasi sistem big data dengan Hadoop',
        isNew: true,
        mataKuliah: 'BIG DATA PLATFORMS',
        kodeKelas: 'IK545',
        sks: '2',
        kodeDosen: '2585',
        namaDosen: 'Prof. Dr. Lala Septem Riza, M.T.',
      ),
      NotifikasiItem(
        title: 'Laporan METODOLOGI PENELITIAN',
        time: 'Deadline: 23:59',
        date: '20 Maret 2025',
        description: 'Proposal penelitian tentang topik yang dipilih',
        isNew: false,
        mataKuliah: 'METODOLOGI PENELITIAN',
        kodeKelas: 'IK400',
        sks: '3',
        kodeDosen: '2401',
        namaDosen: 'Rizky Rachman Judhie Putra, M.Kom.',
      ),
      NotifikasiItem(
        title: 'Presentasi PROYEK KONSULTANSI',
        time: 'Deadline: 16:00',
        date: '18 Maret 2025',
        description: 'Presentasi kemajuan proyek konsultansi',
        isNew: false,
        mataKuliah: 'PROYEK KONSULTANSI',
        kodeKelas: 'PT502',
        sks: '4',
        kodeDosen: '2556',
        namaDosen: 'Eddy Prasetyo Nugroho, M.T.',
      ),
    ];
    
    return _buildNotificationList(tugasItems, NotifikasiJenis.tugas);
  }
  
  Widget _buildPengumumanTab() {
    // Data pengumuman kampus
    final pengumumanItems = [
      NotifikasiItem(
        title: 'Jadwal UTS Semester Genap 2025',
        time: '14:30',
        date: 'Hari ini',
        description: 'Jadwal UTS untuk semua mata kuliah telah dipublikasikan. Silakan cek di website fakultas.',
        isNew: true,
        mataKuliah: '',
        kodeKelas: '',
        sks: '',
        kodeDosen: '',
        namaDosen: '',
      ),
      NotifikasiItem(
        title: 'Workshop SOFTWARE QUALITY ASSURANCE',
        time: '10:00',
        date: '17 Maret 2025',
        description: 'Workshop khusus untuk mahasiswa yang mengambil mata kuliah SOFTWARE QUALITY ASSURANCE dengan Bapak Yudi Ahmad Hambali, S.Kom., M.T.',
        isNew: true,
        mataKuliah: 'SOFTWARE QUALITY ASSURANCE',
        kodeKelas: 'IK581',
        sks: '2',
        kodeDosen: '3138',
        namaDosen: 'Yudi Ahmad Hambali, S.Kom., M.T.',
      ),
      NotifikasiItem(
        title: 'Batas Akhir Pembayaran UTS',
        time: '16:00',
        date: '21 Maret 2025',
        description: 'Harap menyelesaikan pembayaran UTS sebelum tenggat waktu untuk dapat mengikuti ujian',
        isNew: false,
        mataKuliah: '',
        kodeKelas: '',
        sks: '',
        kodeDosen: '',
        namaDosen: '',
      ),
      NotifikasiItem(
        title: 'Seminar DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        time: '12:00',
        date: '14 Maret 2025',
        description: 'Seminar khusus topik OOP dengan pembicara tamu dari industri. Diwajibkan untuk mahasiswa kelas Ibu Rosa Ariani Sukamto, M.T.',
        isNew: false,
        mataKuliah: 'DESAIN DAN PEMROGRAMAN BERORIENTASI OBJEK',
        kodeKelas: 'IK290',
        sks: '3',
        kodeDosen: '2658',
        namaDosen: 'Rosa Ariani Sukamto, M.T.',
      ),
    ];
    
    return _buildNotificationList(pengumumanItems, NotifikasiJenis.pengumuman);
  }
  
  Widget _buildNotificationList(List<NotifikasiItem> items, NotifikasiJenis jenis) {
    return items.isEmpty
        ? const Center(child: Text('Tidak ada notifikasi'))
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: item.isNew ? const Color(0xFF1E5EA8) : Colors.grey,
                        child: Icon(
                          _getIconForItem(jenis),
                          color: Colors.white,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              if (item.isNew)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Baru',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                            ],
                          ),
                          if (item.kodeKelas.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      item.kodeKelas,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  if (item.sks.isNotEmpty)
                                    Container(
                                      margin: const EdgeInsets.only(left: 4),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE0F2F1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        "${item.sks} SKS",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(item.time, style: const TextStyle(color: Colors.grey)),
                              const SizedBox(width: 16),
                              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(item.date, style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                          if (item.namaDosen.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  const Icon(Icons.person, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      item.namaDosen,
                                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (jenis == NotifikasiJenis.tugas)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle lihat tugas
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(249, 249, 197, 1),
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                    ),
                                    child: const Text('Lihat Tugas'),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      onTap: () {
                        // Handle notification tap
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Detail: ${item.title}')),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
  }
  
  IconData _getIconForItem(NotifikasiJenis jenis) {
    switch (jenis) {
      case NotifikasiJenis.jadwal:
        return Icons.school;
      case NotifikasiJenis.tugas:
        return Icons.assignment;
      case NotifikasiJenis.pengumuman:
        return Icons.campaign;
      default:
        return Icons.notifications;
    }
  }
}

enum NotifikasiJenis {
  jadwal,
  tugas,
  pengumuman,
}

class NotifikasiItem {
  final String title;
  final String time;
  final String date;
  final String description;
  final bool isNew;
  final String mataKuliah;
  final String kodeKelas;
  final String sks;
  final String kodeDosen;
  final String namaDosen;
  
  NotifikasiItem({
    required this.title,
    required this.time,
    required this.date,
    required this.description,
    required this.isNew,
    required this.mataKuliah,
    required this.kodeKelas,
    required this.sks,
    required this.kodeDosen,
    required this.namaDosen,
  });
}