import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saturn/constants.dart';
import 'package:saturn/screens/details_screen.dart';
import 'package:saturn/widgets/category_card.dart';
import 'package:saturn/widgets/search_bar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Saturn",
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                  ),
                ),
                Text(
                  "Good Mornign \nShishir",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SearchBar(),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                      title: "Diet Recomendation",
                      svgSrc: "assets/icons/Hamburger.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Kegel Exercises",
                      svgSrc: "assets/icons/Excrecises.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Meditation",
                      svgSrc: "assets/icons/Meditation.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return DetailsScreen();
                          }),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Yoga",
                      svgSrc: "assets/icons/yoga.svg",
                      press: () {},
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
