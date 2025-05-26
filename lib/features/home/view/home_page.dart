import 'package:duty_pharmacy/core/services/location_service.dart';
import 'package:duty_pharmacy/features/home/widgets/pharmacy_card.dart';
import 'package:duty_pharmacy/features/home/viewModel/cubit/pharmacy_cubit.dart';
import 'package:duty_pharmacy/features/home/viewModel/cubit/pharmacy_state.dart';
import 'package:duty_pharmacy/core/constants/string_constants.dart';
import 'package:duty_pharmacy/features/home/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final userCity = LocationService().city;
  final userDistrict = LocationService().district;

  @override
  void initState() {
    super.initState();
    context.read<PharmacyCubit>().loadPharmacies(
      city: userCity ?? '',
      state: '',
    );
  }

  @override
  void dispose() {
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopContainer(
              onLocationTap:
                  () => context.read<PharmacyCubit>().loadPharmacies(
                    city: userCity ?? '',
                    state: userDistrict ?? '',
                  ),
              onSearchTap:
                  () => context.read<PharmacyCubit>().loadPharmacies(
                    city: cityController.text,
                    state: stateController.text,
                  ),
              userCity: userCity ?? '',
              userDistrict: userDistrict ?? '',
              cityController: cityController,
              stateController: stateController,
            ),
            24.verticalSpace,
            Expanded(
              child: BlocBuilder<PharmacyCubit, PharmacyState>(
                builder: (context, state) {
                  if (state is PharmacyLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffF2FAFB),
                      ),
                    );
                  } else if (state is PharmacyErrorState) {
                    return Center(
                      child: Text(
                        StringConstants.errorText,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is PharmacyLoadedState) {
                    final pharmacies = state.pharmacies;
                    if (pharmacies.isEmpty) {
                      return Center(
                        child: Text(StringConstants.pharmacyNotFound),
                      );
                    }
                    return ListView.builder(
                      itemCount: pharmacies.length,
                      itemBuilder: (context, index) {
                        final pharmacy = pharmacies[index];
                        return PharmacyCard(
                          pharmacyName: pharmacy.name,
                          pharmacyDist: pharmacy.dist,
                          pharmacyPhone: pharmacy.phone,
                          pharmacyAddress: pharmacy.address,
                        );
                      },
                    );
                  }
                  return const Center(child: Text('No data available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
