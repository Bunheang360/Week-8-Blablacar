import 'package:flutter/material.dart';
import '../../data/repositories/ride_preference/ride_preference_repository.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferencestate extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _preferenceHistory = [];

  RidePreferencestate(this._repository);

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get preferenceHistory => _preferenceHistory;
  int get maxSeatAllowed => _repository.maxSeatsAllowed;

  void init() {
    _preferenceHistory = _repository.fetchRidePreference();
    _selectedPreference = _repository.getSelectedPreference();
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    // Only update if different from current
    if (preference != _selectedPreference) {
      _repository.selectPreference(preference);

      // Update local state
      _preferenceHistory = _repository.fetchRidePreference();
      _selectedPreference = _repository.getSelectedPreference();

      notifyListeners();
    }
  }

}