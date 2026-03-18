import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import './main_common.dart';
import './data/repositories/location/location_repository.dart';
import './data/repositories/location/location_repository_mock.dart';
import './data/repositories/ride/ride_repository.dart';
import './data/repositories/ride/ride_repository_mock.dart';
import './data/repositories/ride_preference/ride_preference_repository.dart';
import './data/repositories/ride_preference/ride_preference_repository_mock.dart';
import './ui/states/ride_preference_state.dart';
import './ui/screens/home/view_model/home_view_model.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepository>( create: (_) => RidePreferenceRepositoryMock(),),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),

    // inject ride pref state
    ChangeNotifierProvider<RidePreferencestate>(create: (context) => RidePreferencestate(context.read<RidePreferenceRepository>())..init(),),

    // inject home view model
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel(ridePreferencestate: (context.read<RidePreferencestate>()),),),
  ];
}

void main() {
  mainCommon(devProviders);
}
