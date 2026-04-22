import 'package:flutter/material.dart';

class Customer {
  final String name;
  final String id;
  final String roomAssigned;

  Customer({required this.name, required this.id, required this.roomAssigned});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      home: const HotelManagementScreen(),
    );
  }
}

class HotelManagementScreen extends StatefulWidget {
  const HotelManagementScreen({super.key});

  @override
  State<HotelManagementScreen> createState() => _HotelManagementScreenState();
}

class _HotelManagementScreenState extends State<HotelManagementScreen> {
  final List<Customer> _customerList = [
    Customer(name: 'Nguyễn Hoàng Sơn', id: '001xxx', roomAssigned: 'P102'),
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  void _showAddCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thêm Khách Hàng"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Tên khách")),
            TextField(controller: _idController, decoration: const InputDecoration(labelText: "CCCD")),
            TextField(controller: _roomController, decoration: const InputDecoration(labelText: "Số phòng")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Hủy")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _customerList.add(Customer(
                  name: _nameController.text,
                  id: _idController.text,
                  roomAssigned: _roomController.text,
                ));
              });
              _nameController.clear();
              _idController.clear();
              _roomController.clear();
              Navigator.pop(context);
            },
            child: const Text("Thêm"),
          ),
        ],
      ),
    );
  }


  void _deleteCustomer(int index) {
    setState(() {
      _customerList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text("QUẢN LÝ KHÁCH SẠN", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("DANH SÁCH KHÁCH HÀNG ĐANG THUÊ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _customerList.length,
              itemBuilder: (context, index) {
                final customer = _customerList[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(customer.name),
                  subtitle: Text("CCCD: ${customer.id} | Phòng: ${customer.roomAssigned}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteCustomer(index), // Thực hiện DELETE
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCustomerDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}