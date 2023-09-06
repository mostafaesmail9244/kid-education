import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/view/screens/categories_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          useMaterial3: true,
        ),
        home:  child,
      ),
      child:  Scaffold(
          appBar: AppBar(leading: Icon(Icons.arrow_back),backgroundColor: Colors.purpleAccent,),
          body: CategoriesScreen()),
    );
  }
}
