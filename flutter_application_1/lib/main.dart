import 'package:flutter/material.dart';

// 1. Model đối tượng: Chuyển từ Member thành Customer
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
      title: 'Quản lý Khách sạn ABC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HotelManagementScreen(),
    );
  }
}

class HotelManagementScreen extends StatelessWidget {
  const HotelManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String hotelName = "Khách Sạn ABC";
    String address = "Hà Nội";

    List<Map<String, dynamic>> roomList = [
      {"id": "P101", "type": "Bình dân", "price": 1500, "status": "Trống"},
      {"id": "P102", "type": "Bình dân", "price": 1200, "status": "Đang ở"},
      {"id": "P201", "type": "Vip", "price": 2500, "status": "Trống"},
    ];

    final List<Customer> customerList = [
      Customer(name: 'Nguyễn Hoàng Sơn', id: 'CCCD: 001xxx', roomAssigned: 'P102'),
      Customer(name: 'Nguyễn Minh Phương', id: 'CCCD: 002xxx', roomAssigned: 'P205'),
      Customer(name: 'Nguyễn Việt Thái', id: 'CCCD: 003xxx', roomAssigned: 'P301'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text(hotelName, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Địa chỉ: $address", style: const TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 15),
                const Text("DANH SÁCH PHÒNG", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: roomList.length,
              itemBuilder: (context, index) {
                var room = roomList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phòng: ${room['id']}", style: const 
                        TextStyle(fontWeight: FontWeight.bold)),
                        Text("Loại: ${room['type']}"),
                        Text("\$${room['price']}", style: const 
                        TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                        Text("${room['status']}", style: 
                        TextStyle(color: room['status'] == "Trống" ? Colors.green : Colors.red)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue[50],
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Text(
              "DANH SÁCH KHÁCH HÀNG ĐANG THUÊ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          
          Expanded(
            flex: 2,
            child: ListView(
              children: customerList.map((customer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(customer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(customer.id, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Phòng: ${customer.roomAssigned}",
                         style: const TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}