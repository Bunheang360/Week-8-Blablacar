import './ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../dummy_data.dart';
import '../../../model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  @override
  List<Ride> fetchRides() {
    return fakeRides;
  }

  @override
  List<Ride> getRidesFor(RidePreference preferences) {
    return fakeRides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}