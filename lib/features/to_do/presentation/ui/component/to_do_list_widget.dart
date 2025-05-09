import 'package:flutter/material.dart';

import '../../../../../core/res/styles.dart';
import '../../../data/models/task.dart';

class ToDoListWidget extends StatefulWidget {
  List<Task> todoList;
  ToDoListWidget({super.key, required this.todoList});
  @override
  State<ToDoListWidget> createState() => _ToDoListState();
}
class _ToDoListState extends State<ToDoListWidget>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.todoList.length,
        itemBuilder: (context, index){
          Task toDo = widget.todoList[index];
          return GestureDetector(
            onTap: (){
              setState(() {
                toDo.isComplete = !toDo.isComplete;
              });
            },
            child: ToDoItem(toDo: toDo,),
          );
        });
  }
}

class ToDoItem extends StatelessWidget {
  Task toDo;

  ToDoItem({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        leading: (toDo.isComplete)
            ? Icon(Icons.check_circle_outline, color: Theme
            .of(context)
            .primaryColor)
            : const Icon(Icons.circle_outlined),
        title:
        Text(toDo.title, style: Styles.getStringDeco(toDo.isComplete),),


      ),
    );
  }
}


