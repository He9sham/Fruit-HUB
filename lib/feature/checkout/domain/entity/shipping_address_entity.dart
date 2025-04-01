class ShippingAddressEntity {
  String? name;
  String? address;
  String? city;
  String? email;
  String? phone;
  String? post;
  String? floor;

  ShippingAddressEntity(
      {this.name,
      this.address,
      this.city,
      this.email,
      this.phone,
      this.post,
      this.floor});

  @override
  String toString() {
    return '$address $city $floor';
  }
}
