import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_bloc.dart';
import 'package:pphotoeditor/blocs/login/login_state.dart';
import 'package:pphotoeditor/screens/home/home_page.dart';
import 'package:pphotoeditor/screens/loader.dart';
import 'package:pphotoeditor/screens/login/widgets/error_text.dart';
import 'package:pphotoeditor/screens/login/widgets/phone_number_field.dart';
import 'package:pphotoeditor/screens/login/widgets/keyboard.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';
import 'login_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginBlocState>(
          builder: (context, state) {
            final bool showLoader = (
                  state is LoginLoading
               || state is LoginSuccess
            );
            return Scaffold(
              backgroundColor: clrBlack,
              body: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            Localizer.get("app_name"),
                            style: LoginLayout.textStyleTitle,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 180,
                            height: 180,
                          ),
                          ErrorText(),
                          PhoneNumberField(),
                          Keyboard(),
                        ],
                      ),
                    ),
                  ),
                  if (showLoader) const Loader(), // Отображение загрузчика
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
