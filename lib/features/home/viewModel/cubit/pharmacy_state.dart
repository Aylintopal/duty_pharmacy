import 'package:duty_pharmacy/features/home/model/pharmacy_model.dart';

abstract class PharmacyState {
  const PharmacyState();
}

class PharmacyInitialState extends PharmacyState {}

class PharmacyLoadingState extends PharmacyState {}

class PharmacyLoadedState extends PharmacyState {
  final List<PharmacyModel> pharmacies;

  PharmacyLoadedState(this.pharmacies);
}

class PharmacyErrorState extends PharmacyState {
  final String error;

  PharmacyErrorState(this.error);
}
