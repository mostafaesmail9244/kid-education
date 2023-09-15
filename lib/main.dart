import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/shared/network/local/cache_helper.dart';
import 'package:kid_education/view/screens/onBoarding_screen.dart';
import 'package:kid_education/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');

  Widget widget;
  if (onBoarding != null) {
    widget = const WelcomeScreen();
  } else {
    widget = OnBoardingScreen();
  }
  print(widget);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp(startWidget: widget)));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Kid Education',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: scaffoldMixedColor),
        ),
        home: child,
      ),
      child:  startWidget,
    );
  }
}
