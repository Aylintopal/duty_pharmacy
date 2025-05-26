import 'package:duty_pharmacy/features/home/model/pharmacy_model.dart';
import 'package:duty_pharmacy/features/home/viewModel/cubit/pharmacy_state.dart';
import 'package:duty_pharmacy/features/home/repository/pharmacy_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit(super.initialState);

  Future<List<PharmacyModel>?> loadPharmacies({
    required String city,
    String? state,
  }) async {
    emit(PharmacyLoadingState());
    try {
      final List<PharmacyModel> pharmacyList =
          await PharmacyRepository.getPharmacies(city: city, state: state);

      if (pharmacyList.isNotEmpty) {
        emit(PharmacyLoadedState(pharmacyList));
      } else {
        emit(PharmacyErrorState('No pharmacies found'));
      }
    } catch (e) {
      emit(PharmacyErrorState('Bir hata oluştu: $e'));
    }
    return [];
  }
}
