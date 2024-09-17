import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'DBestech',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
      //Using getX for RouteName to Navigate
      getPages: [
        GetPage(name: '/course-page', page: ()=> PageThree()),
        //Passing the RouteNAme with data
        GetPage(name: '/more-page/:data', page: () => PageFour())

      ],
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade900,
                      Colors.grey.shade600,
                      Colors.grey.shade900
                    ],
                  )),
              child: Center(
                child: Text(
                  "GetX",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Search GetX..',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ))),
            SizedBox(
              height: 50,
            ),
            //GetX start from here
            RichText(
                text: TextSpan(
                    text: 'First GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => PageOne()),
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            SizedBox(
              height: 10,
            ),
            //Explore GetX
            RichText(
                text: TextSpan(
                    text: 'Explore GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => PageTwo(), arguments: {
                            //Generating Key pair value of random numbers
                            'price': Random().nextInt(10000).toString(),
                            //Passing multiple arguments
                            'text': 'The course price is USD',
                          }),
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            SizedBox(
              height: 50,
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Navigate named routes',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            //last two routes/bottons
            Expanded(
                child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.black, Colors.grey]),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                            //Passing the route name for clickable function
                          onPressed: () => Get.toNamed('/course-page',
                          arguments: {
                            'price':Random().nextInt(10000).toString()
                          }),
                          child: Text(
                            "Course",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade900),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFffbc33e)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () => Get.toNamed('/more-page/${Random().nextInt(10000)}'),
                        child: Text(
                          "More",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// Page One
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFffbc33e)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () => Get
                .back(), //instead Get.off(()=> HomePage()),  Alternative way to got to specific page
            child: Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
            ),
          ),
        ),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey.shade900, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(Get.arguments['text'] ?? 'Nothing to show',
            style: TextStyle(fontSize: 30,color: Colors.grey.shade600),),
            Text(Get.arguments['price'] ?? 'Exploration Page',
              style: TextStyle(fontSize: 26,color: Colors.grey.shade600),),
          ],
        ),
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black26),
        title: Text(
          'Course Page',
          style: TextStyle(fontSize: 30, color: Colors.grey),
        ),
      ),
      body: Center(
        child: Text(
          "Course price is USD "+ Get.arguments['price']??'0.00',
          style: TextStyle(fontSize: 30, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}

// Page Four
class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black26,
        ),
        title: Text('Page Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () => Get.to(()=> PageFive()),
              child: Text(
                "Get to ",
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
            ),
            Divider(),
            Text(
              'Page Four '+Get.parameters['data']! ?? "Nothing", //data passign via routes you have to call it from parameter not from arguments,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Five"),
      ),
      body: Center(
          child: Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFffbc33e)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () => Get.to(()=> HomePage()),
          child: Text(
            "Home",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
          ),
        ),
      )),
    );
  }
}
