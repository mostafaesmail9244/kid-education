import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:kid_education/view/screens/categories_screen.dart';
import 'package:kid_education/view/screens/profile_screen.dart';
import 'package:kid_education/view/screens/settings_screen.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';
import 'package:kid_education/view/widgets/welcome_widget.dart';
import '../../shared/components/components.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 1;
  List<IconData> listOfIcons = [
    IconlyLight.profile,
    IconlyLight.home,
    IconlyLight.setting
  ];
  List<Widget> screens = [
    const ProfileScreen(),
    const CategoriesScreen(),
     const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PrimaryScaffold(
        appBar: WelcomeWidget.skip?( defaultAppBar(context: context,isLeading: true)):( defaultAppBar(context: context,isLeading: false,)),
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          height: screenWidth * .155,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE2F4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(listOfIcons.length, (index) =>InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: screenWidth * .1125,
                alignment: Alignment.center,
                child: Icon(
                  listOfIcons[index],
                  size: screenWidth * .076,
                  color: index == currentIndex
                      ? const Color(0xFF007BFF)
                      :const Color(0xFF007BFF).withOpacity(0.4),
                ),
              ),
            )),),
        )
    );
  }
}
