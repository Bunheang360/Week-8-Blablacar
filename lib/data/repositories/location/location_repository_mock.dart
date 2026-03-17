import './location_repository.dart';
import '../../../model/ride/locations.dart';
import '../../dummy_data.dart';

class LocationRepositoryMock implements LocationRepository {

  @override
  List<Location> fetchLocations() {
    return fakeLocations;
  }
}