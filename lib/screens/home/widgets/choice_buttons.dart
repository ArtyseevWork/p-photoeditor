
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pphotoeditor/blocs/home/home_bloc.dart';
import 'package:pphotoeditor/blocs/home/home_event.dart';
import 'package:pphotoeditor/screens/home/home_layout.dart';
import 'package:pphotoeditor/values/colors.dart';

class ChoiceButtons extends StatelessWidget {
  Widget rectangleWithBorder(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: HomeLayout.smallPadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: clrGreen,
        borderRadius: BorderRadius.circular(HomeLayout.radius),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HomeLayout.largePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: HomeLayout.mediumPadding
              ),
              child: TextButton(
                onPressed: () {
                  context.read<HomeBloc>().add(PickImageEvent(
                      ImageSource.gallery)
                  );
                },
                child: rectangleWithBorder(
                  SvgPicture.asset('assets/images/icn_gallery.svg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: HomeLayout.mediumPadding
              ),
              child: TextButton(
                onPressed: () {
                  context.read<HomeBloc>().add(
                      PickImageEvent(ImageSource.camera)
                  );
                },
                child: rectangleWithBorder(
                  SvgPicture.asset('assets/images/icn_photo.svg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
