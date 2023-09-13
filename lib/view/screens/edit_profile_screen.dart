import 'package:flutter/material.dart';
import 'package:kid_education/view/widgets/edit_profile_widget.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';
import '../../shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        appBar: defaultAppBar(context: context, isLeading: true,),
        body: EditProfileWidget());
  }
}
