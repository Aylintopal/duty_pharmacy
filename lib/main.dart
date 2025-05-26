import 'package:duty_pharmacy/features/home/view/home_page.dart';
import 'package:duty_pharmacy/core/services/location_service.dart';
import 'package:duty_pharmacy/features/home/viewModel/cubit/pharmacy_cubit.dart';
import 'package:duty_pharmacy/features/home/viewModel/cubit/pharmacy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService().init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Duty Pharmacy App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
            secondary: Colors.blueAccent,
          ),
        ),
        home: BlocProvider(
          create: (context) => PharmacyCubit(PharmacyInitialState()),
          child: HomePage(),
        ),
      ),
    );
  }
}
