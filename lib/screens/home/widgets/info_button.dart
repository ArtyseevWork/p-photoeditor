
import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/info/info_page.dart';

class InfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => InfoPage()),
          );
        },
        child: Image.asset("assets/images/button_info.png"),
      ),
    );
  }
}
