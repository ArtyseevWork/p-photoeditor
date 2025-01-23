
import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/home/home_layout.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Localizer.get("main_page_text"),
      style: const TextStyle(
        fontFamily: "Pompiere",
        color: clrYellow,
        fontSize: HomeLayout.fontSize,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
