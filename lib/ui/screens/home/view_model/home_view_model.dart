import 'package:flutter/material.dart';
import '../../../states/ride_preference_state.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencestate ridePreferencestate;

  HomeViewModel({required this.ridePreferencestate}) {
    ridePreferencestate.addListener(_onStateChanged); // Listen to changes in the state and notify listeners of this view model
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePreferencestate.removeListener(_onStateChanged); // Clean up the listener when the view model is disposed
    super.dispose();
  }

  RidePreference? get selectedRidePreference => ridePreferencestate.selectedPreference;
  List<RidePreference> get ridePreferenceHistory => ridePreferencestate.preferenceHistory;

  void selectPreference(RidePreference preference) {
    ridePreferencestate.selectPreference(preference);
  }
}