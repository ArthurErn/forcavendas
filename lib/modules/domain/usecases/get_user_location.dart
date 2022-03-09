import 'package:geolocator/geolocator.dart';

class GetUserLocation {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future<double?> getCurrentLat() async {
    var position = await _geolocatorPlatform.getLastKnownPosition();
    return position?.latitude;
  }

  Future<double?> getCurrentLong() async {
    var position = await _geolocatorPlatform.getLastKnownPosition();
    return position?.longitude;
  }
}
