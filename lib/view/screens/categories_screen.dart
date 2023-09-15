import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kid_education/view/screens/games_screen.dart';
import 'package:kid_education/view/widgets/categorie_widget.dart';

import '../../shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          customText(title: 'Categories'),
          SizedBox(
            height: 24.0.h,
          ),
          InkWell(
              onTap: () {
                navigateTo(context, const GamesScreen());
              },
              child: const CategoriesWidget(
                title: 'Games',
                image: 'assets/images/games.png',
              )),
          const CategoriesWidget(
            title: 'Videos',
            image: 'assets/images/videos.png',
          ),
          const CategoriesWidget(
            title: 'Read',
            image: 'assets/images/read.png',
          ),
        ],
      ),
    );
  }
}
