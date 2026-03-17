import './ride_preference_repository.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../dummy_data.dart';

class RidePreferenceRepositoryMock implements  RidePreferenceRepository{
  @override
  List<RidePreference> fetchRidePreference() {
    return fakeRidePrefs;
  }
}