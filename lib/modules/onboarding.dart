import 'package:flutter/material.dart';
import 'package:shop_app/modules/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/boardingmodel.dart';
import '../shared/components/components.dart';
import '../shared/network/local/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: "assets/images/onboard_1.jpg", title: "title1", body: "body1"),
    BoardingModel(
        image: "assets/images/onboard_1.jpg", title: "title2", body: "body1"),
    BoardingModel(
        image: "assets/images/onboard_1.jpg", title: "title3", body: "body1"),
  ];

  bool isLast = false;

  var boardController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Text("Shop App"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,20,0),
            child: TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                ),
    ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    )),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 799),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.navigate_next),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  void submit() {
    CacheHelper.setData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value) {
        naviagteToAndReplace(
          context,
          ShopLogin(),
        );
      }
    });
  }
}
