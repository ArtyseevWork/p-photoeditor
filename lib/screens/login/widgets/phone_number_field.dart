import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_state.dart';
import 'package:pphotoeditor/screens/login/login_layout.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';

class PhoneNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginBlocState>(
      buildWhen: (previous, current) {
        return current is LoginNumberUpdated;
      },
      builder: (context, state) {
        String phoneNumber = "";
        if (state is LoginNumberUpdated) {
          phoneNumber = state.phoneNumber;
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: clrWhite,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: clrGreenDark,
              width: 3.0,
            ),
          ),
          child: Text(
            phoneNumber.isEmpty ? Localizer.get("enter_phone") : phoneNumber,
            textAlign: TextAlign.center,
            style: LoginLayout.textStyleKeyBoard,
          ),
        );
      },
    );
  }
}
