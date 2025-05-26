import 'package:duty_pharmacy/core/constants/color_constants.dart';
import 'package:duty_pharmacy/features/home/widgets/custom_list_tile.dart';
import 'package:duty_pharmacy/core/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyCard extends StatelessWidget {
  final String pharmacyName;
  final String pharmacyDist;
  final String pharmacyPhone;
  final String pharmacyAddress;
  const PharmacyCard({
    super.key,
    required this.pharmacyName,
    required this.pharmacyDist,
    required this.pharmacyPhone,
    required this.pharmacyAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 5.h),
      color: ColorConstants.blue,
      elevation: 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  pharmacyName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  pharmacyDist,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            5.verticalSpace,
            CustomListTile(
              title: StringConstants.phone,
              subtitle: pharmacyPhone,
              icon: CupertinoIcons.phone,
            ),
            CustomListTile(
              title: StringConstants.adress,
              subtitle: pharmacyAddress,
              icon: CupertinoIcons.map_pin_ellipse,
            ),
          ],
        ),
      ),
    );
  }
}
