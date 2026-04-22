import 'customer.dart';
import 'room.dart';

class Booking {
  Customer customer; 
  Room room; 
  DateTime checkInDate;  
  int stayDays; 


  Booking({
    required this.customer,
    required this.room,
    required this.checkInDate,
    required this.stayDays,
  });

  double get totalBill {
    return room.calculateTotal(stayDays);
  }

  DateTime get checkOutDate {
    return checkInDate.add(Duration(days: stayDays));
  }

  String displayBookingDetails() {
    return """
    HÓA ĐƠN ĐẶT PHÒNG
    Khách hàng: ${customer.fullName}
    Số phòng: ${room.roomNumber}
    Ngày nhận: ${checkInDate.day}/${checkInDate.month}/${checkInDate.year}
    Số ngày ở: $stayDays
    Tổng thanh toán: $totalBill VNĐ
    """;
  }
}