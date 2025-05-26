import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  String? city;
  String? district;

  Future<void> init() async {
    try {
      // Konum izni iste
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Konum izni reddedildi");
      }

      // Konumu al
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // İl ve ilçe bilgisi al
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final place = placemarks.first;
      city = place.administrativeArea;
      district = place.subAdministrativeArea;

      print('Şehir: $city, İlçe: $district');
    } catch (e) {
      print('Konum alınırken hata oluştu: $e');
    }
  }
}
