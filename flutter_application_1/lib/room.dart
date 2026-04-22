
class Room {
  String roomNumber;
  String type;
  double price;
  bool isAvailable;

  Room({
    required this.roomNumber,
    required this.type,
    required this.price,
    this.isAvailable = true,
  });

  void updateStatus(bool status) {
    isAvailable = status;
  }

  double calculateTotal(int days) {
    return price * days;
  }

  String displayInfo() {
    String status = isAvailable ? "Đang trống" : "Đã có khách";
    return "Phòng: $roomNumber | Loại: $type | Giá: $price | Trạng thái: $status";
  }
}