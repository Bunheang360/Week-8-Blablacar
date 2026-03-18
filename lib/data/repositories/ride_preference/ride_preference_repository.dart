import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> fetchRidePreference();
  RidePreference? getSelectedPreference();
  int get maxSeatsAllowed;

  void selectPreference(RidePreference preference);
}
