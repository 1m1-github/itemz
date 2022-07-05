import 'package:cv/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cv_keywords_list.dart';
import 'cv_widget.dart';

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      ClampingScrollPhysics();
}

class RectangleBox extends StatelessWidget {
  final Widget icon;
  final double radius;
  final double curveRadius;
  final GestureTapCallback? onTap;

  const RectangleBox(
      {Key? key,
      required this.icon,
      required this.radius,
      this.onTap,
      this.curveRadius = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        height: radius,
        width: radius,
        child: Center(child: icon),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(curveRadius),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 18,
                color: Color.fromRGBO(0, 0, 0, 0.12)),
          ],
        ),
      ),
    );
  }
}

class CVPage extends ConsumerStatefulWidget {
  CVPage();

  @override
  _CVPageState createState() => _CVPageState();
}

class _CVPageState extends ConsumerState<CVPage> {
  TextEditingController _searchController = TextEditingController();

  List<SuccessData> mainList = [];

  @override
  void initState() {
    ref.read(cvProvider).initList();
    ref.read(cvProvider).initKeywordList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cvProviderModel = ref.watch(cvProvider);
    if (cvProviderModel.searchCVList.isNotEmpty ||
        cvProviderModel.keywordList.isNotEmpty) {
      mainList = cvProviderModel.searchCVList;
    } else {
      mainList = cvProviderModel.mainCvList;
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: InkWell(
              child: Text('1m1'),
              onTap: () => launchUrl(Uri.parse('mailto:1m1@2i2i.app'))),
          backgroundColor: Colors.green,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Container(
              //   // color: Colors.amber,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         "1m1s",
              //         style: Theme.of(context).textTheme.headline5,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.grey.shade900),
                      autofocus: false,
                      controller: _searchController,
                      onSubmitted: (value) {
                        cvProviderModel.addInKeywordList(value);
                        _searchController.text = '';
                        _searchController.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Search keywords',
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  _searchController.text = '';
                                  _searchController.clear();
                                },
                                iconSize: 20,
                                icon: Icon(
                                  Icons.close,
                                ),
                              )
                            : IconButton(icon: Container(), onPressed: null),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        prefixIcon: Icon(Icons.search_rounded),
                        // suffixIcon: Icon(Icons.mic),
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  RectangleBox(
                    radius: 42,
                    icon: Icon(
                        cvProviderModel.isOpenSuggestionView
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 20),
                    curveRadius: 10,
                    onTap: () => cvProviderModel.openCloseSuggestionView(),
                  )
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                  child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  shrinkWrap: false,
                  primary: true,
                  children: [
                    SizedBox(height: 8),
                    CvKeywordsList(),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: mainList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color backgroundColor = index % 2 == 0
                            ? Color.fromRGBO(223, 239, 223, 1)
                            : Color.fromRGBO(197, 234, 197, 1);
                        return CVWidget(
                          data: mainList[index],
                          backgroundColor: backgroundColor,
                          index: index,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                        'All timestamps above are approximate. All facts above are the persons\' successes, without humility and without exageration. Weaknesses/"failures" are not mentioned.'),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
