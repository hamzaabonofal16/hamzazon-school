import 'package:flutter/material.dart';

void main() {
  runApp(const HamzazonApp());
}

class HamzazonApp extends StatelessWidget {
  const HamzazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamzazon',
      locale: const Locale('ar'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<String> titles = [
    'الرئيسية',
    'جدول الحصص',
    'الواجبات',
    'الإعدادات',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hamzazon 🎓',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            DashboardPage(),
            SchedulePage(),
            HomeworkPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'الجدول',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book),
              label: 'الواجبات',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 15),
        const Icon(
          Icons.school,
          size: 90,
          color: Colors.indigo,
        ),
        const SizedBox(height: 15),
        const Text(
          'أهلاً بك في Hamzazon',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'نظّم يومك الدراسي وكن مستعداً للنجاح',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),
        const FeatureCard(
          icon: Icons.calendar_month,
          title: 'جدول الحصص',
          subtitle: 'تعرّف على حصصك الدراسية',
        ),
        const FeatureCard(
          icon: Icons.assignment,
          title: 'الواجبات المدرسية',
          subtitle: 'تابع واجباتك اليومية',
        ),
        const FeatureCard(
          icon: Icons.notifications_active,
          title: 'التذكيرات
