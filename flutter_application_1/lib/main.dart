import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Hotel App', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Booking Hotel App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Danh sách thành viên nhóm
  final List<Map<String, String>> teamMembers = [
    {'name': 'Nguyễn Hoàng Sơn', 'id': '23010100'},
    {'name': 'Nguyễn Minh Phương', 'id': '23010190'},
    {'name': 'Nguyễn Việt Thái', 'id': '23017239'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hotel_class, size: 50, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'DANH SÁCH THÀNH VIÊN NHÓM:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            Column(
              children: teamMembers.map((member) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(
                      member['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('MSV: ${member['id']}'),
                  ),
                );
              }).toList(),
            ),
            
            const SizedBox(height: 30),
            const Text(
              '08/04/2026',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}