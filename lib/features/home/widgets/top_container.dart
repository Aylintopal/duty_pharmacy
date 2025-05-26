import 'package:duty_pharmacy/core/constants/color_constants.dart';
import 'package:duty_pharmacy/shared/widgets/custom_tff.dart';
import 'package:duty_pharmacy/core/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopContainer extends StatelessWidget {
  final VoidCallback onLocationTap;
  final VoidCallback onSearchTap;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final String? userCity;
  final String? userDistrict;

  const TopContainer({
    super.key,
    required this.onLocationTap,
    required this.onSearchTap,
    required this.userCity,
    required this.userDistrict,
    required this.cityController,
    required this.stateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onLocationTap,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.blue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.my_location, size: 18.w, color: Color(0xFF4AB6CD)),
                  6.horizontalSpace,
                  Text(
                    '${StringConstants.yourLocation} ${userCity ?? ''} , ${userDistrict ?? ''}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: CustomTextFormField(
                  controller: cityController,
                  hintText: StringConstants.enterCity,
                ),
              ),
              Flexible(
                flex: 2,
                child: CustomTextFormField(
                  controller: stateController,
                  hintText: StringConstants.enterState,
                ),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onSearchTap,
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity(horizontal: -4),
                    padding: EdgeInsets.zero,
                    backgroundColor: ColorConstants.darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide.none,
                    ),
                    elevation: 0,
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    size: 20.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
