class ShippingAddressEntity {
  final String name;
  final String address;
  final String city;
  final String email;
  final String phone;
  final String addressDetails;

  ShippingAddressEntity(
      {required this.name,
      required this.address,
      required this.city,
      required this.email,
      required this.phone,
      required this.addressDetails});
}
