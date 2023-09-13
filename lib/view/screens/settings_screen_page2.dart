import 'package:flutter/material.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/widgets/primary_scaffold_widget.dart';
import 'package:kid_education/view/widgets/settings_page2_widgwt.dart';

class SettingScreenPage2 extends StatelessWidget {
  const SettingScreenPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBar: defaultAppBar(context: context,isLeading: true,),
      body: const SettingsPage2Widget(),
    );
  }
}

