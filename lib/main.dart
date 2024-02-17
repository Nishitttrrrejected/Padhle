import 'package:flutter/material.dart';
import 'package:padhle/routes.dart';
import 'package:padhle/screens/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Padhle',
          theme: ThemeData.light().copyWith(
            //scaffold default color
            scaffoldBackgroundColor: kPrimaryColor,
            primaryColor: kPrimaryColor,
            //input deoration theme for our whole app
            inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
               fontSize: 15,
                color: kTextLightColor,
                height: 0.5,
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                color: kTextBlackColor,
                height: 0.5,
              ),
              enabledBorder:UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.7,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kTextLightColor
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kTextLightColor
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kErrorBorderColor,
                    width: 1.2
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kErrorBorderColor,
                  width: 1.2,
                ),
              ),
            ),
          ),

          //first screen will be the splashScreen
          initialRoute: SplashScreen.routename,
          routes: routes, //define the routes file in order to access them anywhere in the app
        );
      },
    );
  }
}