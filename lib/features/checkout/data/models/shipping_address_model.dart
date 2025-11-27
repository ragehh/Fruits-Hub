import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? addressDetails;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) =>
      ShippingAddressModel(
        name: entity.name,
        phone: entity.phone,
        email: entity.email,
        address: entity.address,
        city: entity.city,
        addressDetails: entity.addressDetails,
      );

  Map<String, String?> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
    };
  }
}
