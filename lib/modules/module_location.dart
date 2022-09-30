import 'package:get/get.dart';

class LocationModule {
  final RxString nameLocation;
  final RxDouble x;
  final RxDouble y;
  final RxString nameCity;
  final RxString nameTown;
  final RxString namePoint;
  final RxString phoneNumber;
  bool valid = false;

  LocationModule({
    required String nameLocation,
    required String nameCity,
    required String nameTown,
    required String namePoint,
    required String phoneNumber,
    required bool valid,
    required double x,
    required double y,
  })  : nameLocation = nameLocation.obs,
        nameCity = nameCity.obs,
        nameTown = nameTown.obs,
        namePoint = namePoint.obs,
        phoneNumber = phoneNumber.obs,
        valid = valid,
        x = x.obs,
        y = y.obs;

  static add(String nameLocation, String namecity, String nametown,
      String namepoint, String location, bool valid, double x, double y) {
    LocationModule location1 = LocationModule(
      nameLocation: nameLocation,
      nameCity: namecity,
      nameTown: nametown,
      namePoint: namepoint,
      phoneNumber: location,
      valid: valid,
      x: x,
      y: y,
    );
    locations.add(location1);
  }

  static RxList<LocationModule> locations = <LocationModule>[].obs;
}
