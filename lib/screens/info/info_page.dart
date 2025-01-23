import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pphotoeditor/docs.dart';
import 'package:pphotoeditor/screens/doc/doc_page.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';
import 'info_layout.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          header(context),
          mainArea(context),
          Container(),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: clrBlack,
      child: SafeArea(
        child: Container(
          height: InfoLayout.headerHeight,
          child: Row(
            children: [
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.only(
                      right: InfoLayout.mediumMargin,
                      top: InfoLayout.smallMargin),
                  padding: EdgeInsets.all(InfoLayout.mediumPadding),
                  decoration: const BoxDecoration(
                      color: clrWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(InfoLayout.docCloseRadius),
                          topRight: Radius.circular(InfoLayout.docCloseRadius))),
                  child: SvgPicture.asset(
                    'assets/images/icn_close.svg',
                    height: InfoLayout.iconSize,
                    width: InfoLayout.iconSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainArea(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/images/logo.png")),
        docButton(context, Localizer.get('about'), DocType.about),
        docButton(context, Localizer.get('terms'), DocType.terms),
        docButton(context, Localizer.get('support'), DocType.privacy),
      ],
    );
  }

  void goTo(BuildContext context, String title, DocType docType) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DocPage(
            title: title,
            docType: docType,
          )),
    );
  }

  Widget docButton(BuildContext context, String title, DocType docType) {
    return GestureDetector(
      onTap: () {
        goTo(context, title, docType);
      },
      child: Container(
        margin: const EdgeInsets.only(
            bottom: InfoLayout.mediumMargin,
            left: InfoLayout.largeMargin,
            right: InfoLayout.largeMargin),
        padding: EdgeInsets.all(InfoLayout.smallPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: clrActive,
          borderRadius: BorderRadius.circular(InfoLayout.docButtonRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: InfoLayout.fontSize,
                fontFamily: "TimesNewRoman",
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
