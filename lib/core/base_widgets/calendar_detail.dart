import 'package:flutter/material.dart';
import 'package:bit_task/core/res/dimensions.dart';

class CalendarDetail extends StatelessWidget {
  bool isSelected;
  String day;
  Color? dotColor;
  double? padding;
  CalendarDetail({Key? key, required this.isSelected, required this.day, this.dotColor,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = Theme.of(context).primaryColor;
    Color color2 = Theme.of(context).cardColor;
    return Card.outlined(
      child: Container(
        //constraints: const BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical:(padding !=null) ? padding! :  Dimensions.paddingXS),
        decoration: (isSelected)? BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: color1),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                color1,
                color2
                // Styles.customCalendar1,
                // Styles.customCalendar2
              ],
            ) ): null,

        child: Column(
          children: [
            Text('$day', style: TextStyle(color: isSelected ? Colors.white : null,),textAlign: TextAlign.center,),
            SizedBox(height: 4),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}