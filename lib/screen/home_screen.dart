import 'package:dark_and_light_mode_module/model/list/icon_list.dart';
import 'package:dark_and_light_mode_module/provider/theme_provider.dart';
import 'package:dark_and_light_mode_module/widget/analog_clock_base.dart';
import 'package:flutter/material.dart';
import 'package:dark_and_light_mode_module/widget/custom_calender.dart';
import 'package:provider/provider.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class ThemeModel {
  Color color;
  String lable;
  bool isSelected;

  ThemeModel({
    required this.color,
    this.isSelected = false,
    required this.lable,
  });
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;
  bool cirAn = false;
  List<ThemeModel> themeColorList = [
    ThemeModel(color: Colors.amber.shade300, lable: "Ambrish"),
    ThemeModel(color: Colors.red.shade300, lable: "Redish"),
    ThemeModel(color: Colors.pink.shade300, lable: "Pinkish"),
    ThemeModel(color: Colors.orange.shade300, lable: "Orange"),
  ];

  String weekday() {
    switch (DateTime.now().weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Sun';
    }
  }

  String month() {
    switch (DateTime.now().month) {
      case 1:
        return 'january';
      case 2:
        return 'february';
      case 3:
        return 'march';
      case 4:
        return 'april';
      case 5:
        return 'may';
      case 6:
        return 'june';
      case 7:
        return 'july';
      case 8:
        return 'august';
      case 9:
        return 'september';
      case 10:
        return 'october';
      case 11:
        return 'november';
      case 12:
        return 'december';
      default:
        return 'january';
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: cirAn
          ? CircularRevealAnimation(
              centerOffset: Offset(size.height / 12, size.width / 3.7),
              animation: animation,
              child: _body(context),
            )
          : _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Container _bottomNavigationBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).bottomAppBarTheme.color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List<Widget>.generate(4,
              (index) => _bottomBarIconCard(IconList().bottomBarIcon[index])),
        ),
      ),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          width: MediaQuery.of(context).size.width,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Column(
                    children: [
                      Text(
                        '  ' + weekday(),
                      ),
                      Text(
                        '  ' + DateTime.now().day.toString(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 190,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            month().toUpperCase(),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        const Calender(),
                      ]),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: List.generate(4, (i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List<Widget>.generate(
                        4,
                        (j) {
                          var index = i * 4 + j;
                          return ((i == 2 || i == 3) && (j == 2 || j == 3))
                              ? Container(
                                  width: 50,
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: _iconCard(IconList().iconList[index]),
                                );
                        },
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: 215,
                left: MediaQuery.of(context).size.width / 2,
                child: const ClockBase(
                  size: 140,
                ),
              )
            ],
          ),
        ),
        const Text(
          "Switch Theme",
          textScaleFactor: 2,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            themeColorList.length,
            (index) => GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                if (themeColorList[index].isSelected != true) {
                  for (var element in themeColorList) {
                    element.isSelected = false;
                  }
                  themeColorList[index].isSelected = true;
                  provider.toggleTheme(themeColorList[index].lable);
                } else {
                  themeColorList[index].isSelected =
                      !themeColorList[index].isSelected;
                  provider.toggleTheme(index % 2 == 0 ? "light" : "dark");
                }

                setState(() {
                  cirAn = true;
                });
                if (animationController.status == AnimationStatus.forward ||
                    animationController.status == AnimationStatus.completed) {
                  animationController.reset();
                  animationController.forward();
                } else {
                  animationController.forward();
                }
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: themeColorList[index].isSelected
                      ? Border.all(
                          color: Colors.black,
                        )
                      : null,
                  color: themeColorList[index].color,
                ),
                child: Center(
                    child: Text(
                  themeColorList[index].lable,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Stack _bottomBarIconCard(IconData iconData) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        _iconCard(iconData),
      ],
    );
  }

  Container _iconCard(IconData iconData) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 5,
            color: Theme.of(context).textTheme.labelSmall!.color!,
          ),
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 5,
            color: Theme.of(context).shadowColor,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(iconData),
    );
  }
}
