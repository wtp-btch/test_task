import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'company_entity.freezed.dart';

@freezed
class CompanyEntity with _$CompanyEntity {
  const factory CompanyEntity({
    required String id,
    required String name,
    required String fullName,
    required String phone,
    required String email,
    required String website,
    required Address address,
  }) = _CompanyEntity;
  factory CompanyEntity.create({
    required String name,
    required String fullName,
    required String phone,
    required String email,
    required String website,
    required Address address,
  }){
    final uuid = const Uuid().v4();
    return CompanyEntity(
      id: uuid,
      name: name,
      fullName: fullName,
      phone: phone,
      email: email,
      website: website,
      address: address,
    );
  }
}

@freezed
class Address with _$Address {
  const factory Address({
    required String postCode,
    required String city,
    required String street,
    required String house,
    required Geolocation geolocation,
  }) = _Address;

  factory Address.create({
    required String postCode,
    required String city,
    required String street,
    required String house,
    required Geolocation geolocation,
  }){
    return Address(
      postCode: postCode,
      city: city,
      street: street,
      house: house,
      geolocation: geolocation,
    );
  }
}

@freezed
class Geolocation with _$Geolocation {
  const factory Geolocation ({
    required double latitude,
    required double longitude,
  }) = _Geolocation;
  factory Geolocation.create({
    required double latitude,
    required double longitude,
  }) {
    return Geolocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}