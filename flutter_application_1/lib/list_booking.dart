// ignore_for_file: avoid_print
import 'booking.dart';

class ListBooking {
  final List<Booking> _items = [];


  List<Booking> getAllBookings() {
    return _items;
  }

  void createBooking(Booking newBooking) {
    _items.add(newBooking);
    print(" Đã thêm: ${newBooking.customer.fullName} - Phòng: ${newBooking.room.roomNumber}");
  }

  bool editBooking(String idCardToSearch, Booking updatedBooking) {
    final index = _items.indexWhere((item) => item.customer.idCard == idCardToSearch);

    if (index != -1) {
      _items[index] = updatedBooking;
      print(" Cập nhật thành công CCCD: $idCardToSearch");
      return true;
    }
    print(" Không tìm thấy CCCD: $idCardToSearch để sửa");
    return false;
  }

  void deleteBooking(String idCardToDelete) {
    int lengthBefore = _items.length;
    _items.removeWhere((item) => item.customer.idCard == idCardToDelete);
    
    if (_items.length < lengthBefore) {
      print(" Đã xóa bản ghi CCCD: $idCardToDelete");
    } else {
      print(" Không có bản ghi nào để xóa");
    }
  }

  Booking? findByIdCard(String idCard) {
    try {
      return _items.firstWhere((item) => item.customer.idCard == idCard);
    } catch (e) {
      return null;
    }
  }
}