import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_event.dart';
import 'package:pphotoeditor/screens/login/login_layout.dart';
import 'package:pphotoeditor/values/colors.dart';

import 'key_button.dart';

class Keyboard extends StatelessWidget {
  final double margin = 5;
  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['C', '0', 'OK']
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: keys
            .map((row) => Padding(
          padding: EdgeInsets.only(bottom: margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row
                .map((key) => Expanded(
                  child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: margin / 2),
                              child: KeyButton(
                  char: key,
                  onPressed: () {
                    if (key == "C") {
                      bloc.add(LoginNumberClearPressed());
                    } else if (key == "OK") {
                      bloc.add(LoginNumberSubmitPressed());
                    } else {
                      bloc.add(LoginNumberKeyPressed(key));
                    }
                  },
                              ),
                            ),
                ))
                .toList(),
          ),
        ))
            .toList(),
      ),
    );
  }
}

