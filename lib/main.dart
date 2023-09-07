import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/view/screens/login_screen.dart';
import 'package:kid_education/view/screens/onBoarding_screen.dart';
import 'shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');

  Widget widget;
  if (onBoarding != null) {
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
   MyApp({super.key,required this.startWidget,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
     builder: (context, child) => MaterialApp(
        title: 'Kid Education',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Grandstander',
          useMaterial3: true,
        ),
        home:  child,
      ),
      child: startWidget,
    );
  }
}
