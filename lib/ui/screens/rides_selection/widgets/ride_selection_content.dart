import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import '../view_model/ride_selection_view_model.dart';
import 'ride_preference_modal.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  const RideSelectionContent({super.key});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed(BuildContext context) async {
    final vm = context.read<RideSelectionViewModel>();

    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: vm.currentPreference),
          ),
        );

    if (newPreference != null) {
      vm.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RideSelectionViewModel>();
    final RidePreference? selectedRidePreference = vm.currentPreference;

    if (selectedRidePreference == null) {
      return const Scaffold(
        body: Center(child: Text('No Ride Preference Selected')),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: selectedRidePreference,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(context),
            ),
            SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: vm.rides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: vm.rides[index],
                  onPressed: () => onRideSelected(vm.rides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
