import 'package:flutter/material.dart';
import 'package:bit_task/core/res/dimensions.dart';
import 'package:bit_task/features/to_do/presentation/ui/page/new_task_page.dart';

import '../../../../../core/res/strings.dart';

class NoTaskWidget extends StatelessWidget {
  NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Strings.lbNoTask),
          // TextButton(onPressed: (){
          //   RouteManager.goTo(context, NewTaskPage());
          // }, child: Text(Strings.lbCreate)),
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: Dimensions.marginL),
            child: Image.asset('assets/images/idea.png'),
          )
        ],
      ),
    );
  }
}
