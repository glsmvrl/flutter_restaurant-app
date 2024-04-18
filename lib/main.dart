import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

var bannerItem = ["Burger", "Cheese Chilly", "Noodles", "Pizza"];
var bannerImage = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg",
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      const Text(
                        "Foodies",
                        style: TextStyle(fontSize: 50, fontFamily: "Samantha"),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person))
                    ],
                  ),
                ),
                const BannerWidgetArea()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  const BannerWidgetArea({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for (int i = 0; i < bannerItem.length; i++) {
      var bannerView = Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(bannerImage[i], fit: BoxFit.cover),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItem[i],
                      style:
                          const TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    const Text(
                      "More than 40% Off",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

      banners.add(bannerView);
    }

    return SizedBox(
      height: screenWidth * 9 / 16,
      width: screenWidth,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
