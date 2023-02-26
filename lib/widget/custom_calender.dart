import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  const Calender({
    Key? key,
  }) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    int date = 0;
    DateTime firstDayCurrentMonth =
        DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
    DateTime lastDayCurrentMonth = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month + 1,
    ).subtract(const Duration(days: 1));
    return Column(
      children: List.generate(5, (i) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(7, (j) {
            date < lastDayCurrentMonth.day
                ? i >= 1 && j >= 0
                    ? date++
                    : i == 0 &&
                            j >=
                                (firstDayCurrentMonth.weekday == 7
                                    ? 0
                                    : firstDayCurrentMonth.weekday)
                        ? date++
                        : date
                : date = 32;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: date == 0 || date == 32
                  ? Container(
                      width: 20,
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: date == DateTime.now().day
                            ? Theme.of(context).textTheme.bodyMedium!.color
                            : Colors.transparent,
                      ),
                      width: 20,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: date < 10 ? 4 : 0,
                        ),
                        child: Text(
                          date.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: date == DateTime.now().day
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color),
                        ),
                      ),
                    ),
            );
          }),
        );
      }),
    );
  }
}
