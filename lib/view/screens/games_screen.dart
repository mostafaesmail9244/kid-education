import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/components.dart';
import '../widgets/categorie_widget.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return primaryScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0,),
            customText(title: 'Games'),
            SizedBox(height: 24.0.h,),
            InkWell(onTap: (){
             // navigateTo(context, const GamesScreen());
            },
                child: const CategoriesWidget(title: 'Letters', image: 'assets/images/letters.png', )),
            const CategoriesWidget(title: 'Numbers', image: 'assets/images/numbers.png', ),
            const CategoriesWidget(title: 'Color&shape', image: 'assets/images/color & shape.png',),
          ],
        ),
      ),
    );
  }
}