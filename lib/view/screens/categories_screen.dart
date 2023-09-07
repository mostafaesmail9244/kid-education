import 'package:flutter/material.dart';
import 'package:kid_education/view/widgets/categorie_widget.dart';

import '../../shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  primaryScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(title: 'Categories'),
            const CategoriesWidget(title: 'Games', image: 'assets/images/games.png')
          ],
        ),
      ),
    );
  }
}
