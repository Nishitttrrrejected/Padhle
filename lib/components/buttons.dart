import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton({Key? key, required this.onPress, required this.title, required this.iconData});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: EdgeInsets.only(right: kDefaultPadding),
        width: 100.w,
        height: SizerUtil.deviceType == DeviceType.tablet ? 9.h : 7.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kSecondaryColor,kPrimaryColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(title, style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
            Spacer(),
            Icon(iconData,
              size: 26.sp,
              color: kOtherColor,)
          ],
        ),
      ),
    );
  }
}