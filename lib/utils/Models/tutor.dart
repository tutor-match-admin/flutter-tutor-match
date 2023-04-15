class Tutor {
  String name;
  String email;
  String phone;
  String pincode;
  String? fees;
  String? domain;
  String? pastexperience;

  Tutor(
      {required this.name,
      required this.email,
      required this.phone,
      required this.pincode,
      this.fees,
      this.domain,
      this.pastexperience});
}
