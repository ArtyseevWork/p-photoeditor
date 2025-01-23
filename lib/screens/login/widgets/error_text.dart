import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_state.dart';
import 'package:pphotoeditor/screens/login/login_layout.dart';

class ErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginBlocState>(
        builder: (context, state) {
          String errorText = "";
          if (state is LoginErrorState) {
            errorText = state.errorMessage;
          }
          return Text(
            errorText,
            style: LoginLayout.textStyleSubTitle,
          );
        }
    );
  }
}