
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/blocs/home/home_bloc.dart';
import 'package:pphotoeditor/blocs/home/home_state.dart';
import 'package:pphotoeditor/image_repo.dart';
import 'package:pphotoeditor/screens/editor/page/page_editor.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'widgets/choice_buttons.dart';
import 'widgets/info_button.dart';
import 'widgets/main_image.dart';
import 'widgets/main_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ImageRepo()),
      child: Scaffold(
        backgroundColor: clrBlack,
        body: SafeArea(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is ImagePickedState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditorPage(imagePath: state.imagePath),
                  ),
                );
              } else if (state is ImagePickErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InfoButton(),
                  MainText(),
                  MainImage(),
                  ChoiceButtons(),
                  Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
