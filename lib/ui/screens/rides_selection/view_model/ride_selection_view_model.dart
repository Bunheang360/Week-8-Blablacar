import 'package:flutter/material.dart';
import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferencestate ridePreferencesState;
  final RideRepository rideRepository;

  List<Ride> _rides = [];

  RideSelectionViewModel({
    required this.ridePreferencesState,
    required this.rideRepository,
  }) {
    ridePreferencesState.addListener(_onPreferencesChanged);
  }

  List<Ride> get rides => _rides;
  RidePreference? get currentPreference =>
      ridePreferencesState.selectedPreference;
  List<RidePreference> get preferenceHistory =>
      ridePreferencesState.preferenceHistory;

  Future<void> init() async {
    _onPreferencesChanged();
  }

  void selectPreference(RidePreference preference) {
    ridePreferencesState.selectPreference(preference);
  }

  void _onPreferencesChanged() {
    final RidePreference? preference = currentPreference;
    _rides = preference == null
        ? rideRepository.fetchRides()
        : rideRepository.getRidesFor(preference);
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferencesState.removeListener(_onPreferencesChanged);
    super.dispose();
  }
}