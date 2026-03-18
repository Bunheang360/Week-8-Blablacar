import 'package:provider/provider.dart';
import './main_common.dart';
import './data/repositories/location/location_repository.dart';
import './data/repositories/location/location_repository_mock.dart';
import './data/repositories/ride/ride_repository.dart';
import './data/repositories/ride/ride_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './ui/states/ride_preference_state.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepository>( create: (_) => RidePreferenceRepositoryMock(),),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),

    // inject ride pref state
    ChangeNotifierProvider<RidePreferencestate>(create: (context) => RidePreferencestate(context.read<RidePreferenceRepository>())..init(),),
  ];
}

void main() {
  mainCommon(devProviders);
}
