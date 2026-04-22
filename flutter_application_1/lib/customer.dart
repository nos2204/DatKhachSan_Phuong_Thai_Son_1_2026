
class Customer {
  String fullName;
  String phoneNumber;
  String idCard;
  int age;


  Customer({
    required this.fullName,
    required this.phoneNumber,
    required this.idCard,
    this.age = 18,
  });

 
  void updateContact(String newPhone) {
    phoneNumber = newPhone;
  }

  String get customerSummary => "Khách hàng: $fullName - SĐT: $phoneNumber";

  bool isValid() {
    return phoneNumber.length >= 10 && fullName.isNotEmpty && idCard.isNotEmpty;
  }
}