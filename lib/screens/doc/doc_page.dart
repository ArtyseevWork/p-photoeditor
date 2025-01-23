import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pphotoeditor/app_settings.dart';
import 'package:pphotoeditor/docs.dart';
import 'package:pphotoeditor/values/colors.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'doc_layout.dart';

class DocPage extends StatefulWidget {
  final String title;
  final DocType docType;

  const DocPage({
    super.key,
    required this.title,
    required this.docType,
  });

  @override
  State<DocPage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<DocPage> {
  DocLayout layout = DocLayout();
  String html = '';

  @override
  void initState() {
    super.initState();
    onLoad();
  }


  void onLoad() async {
    String country = "";
    html = await rootBundle.loadString('assets/articles/'
        '${Options.countryCode}_${widget.docType.name.toString()}.html'
    );
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: clrWhite,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              header,
              mainArea,
            ],
          ),
        ),
      ),
    );
  }

  Widget get header{
    return Container(
      color: clrBlack,
      child: SafeArea(
        child: SizedBox(
          height: DocLayout.headerHeight,
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
                      right: DocLayout.mediumMargin,
                      top: DocLayout.smallMargin),
                  padding: const EdgeInsets.all(DocLayout.mediumPadding),
                  decoration: const BoxDecoration(
                      color: clrWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(DocLayout.docCloseRadius),
                          topRight: Radius.circular(DocLayout.docCloseRadius))),
                  child: SvgPicture.asset(
                    'assets/images/icn_close.svg',
                    height: DocLayout.iconSize,
                    width: DocLayout.iconSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get mainArea {
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              title,
              htmlText
            ],
          ),
        )
    );
  }



  Widget get title => Container(
    margin: const EdgeInsets.all(DocLayout.mediumMargin),
    child: Text(
      Localizer.get(widget.title),
      style: const TextStyle(
        fontSize: DocLayout.fontSize,
        fontWeight: FontWeight.w400,
        color: clrBlack,
      ),
    ),
  );

  Widget get htmlText {
    Widget child = HtmlWidget(
        html,
        textStyle: const TextStyle(color: clrBlack),
        onTapUrl:(String url){launchUrl(Uri.parse(url ?? '')); return true;}
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DocLayout.articlePadding,
        vertical: DocLayout.smallPadding,
      ),
      child: child,
    );
  }


}

