import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_education/core/helper/get_asset.dart';
import 'package:kid_education/shared/components/components.dart';
import 'package:kid_education/view/widgets/edit_profile_widget.dart';

class SettingsPage2Widget extends StatelessWidget {
  const SettingsPage2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30.0,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(
              title: 'Settings',
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 29.h,
            ),
            const ChangeableProfilePicture(),
            SizedBox(
              height: 55.h,
            ),
            const EditField(
              title: 'Name',
              text: 'Ali Arsany',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const EditField(
                text: 'Email',
                title: 'ali@gmail.com',
              ),
            ),
            const EditField(
              title: 'Password',
              text: '***************',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const EditField(
                text: 'Code number',
                title: '345678',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditField extends StatelessWidget {
  const EditField({
    super.key,
    required this.text,
    required this.title,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F6F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DefaultSettingsText(
                text: title,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  getPngAsset('editIcon'),
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultSettingsText(
            text: text,
          ),
        ],
      ),
    );
  }
}

class DefaultSettingsText extends StatelessWidget {
  const DefaultSettingsText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.almarai(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF595959),
      ),
    );
  }
}
