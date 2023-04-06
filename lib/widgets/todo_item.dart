import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (() {
          onToDoChanged(todo);
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        tileColor: Colors.white,
        leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.black),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: todo.isDone ? Colors.grey : tdBlack,
            fontSize: 17,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: (() {
              onDeleteItem(todo.id);
            }),
            iconSize: 27,
            color: tdRed),
        // Container(
        // padding: EdgeInsects.all(0),
        // margin: EdgeInsects.symmetric(vertical: 12),
        //   height: 35,
        //   width: 35,
        //   decoration: BoxDecoration(
        //     color: tdRed,
        //     borderRadius: BorderRadius.circular(10)
        //   ),
        //   child: IconButton(
        // icon: Icon(Icons.delete), onPressed: (() {}), color: tdBlue), ,
        // )
      ),
    );
  }
}
