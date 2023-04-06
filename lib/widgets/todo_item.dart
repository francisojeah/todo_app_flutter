import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (() {}),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: tdBlue),
        title: Text(
          'Check Mail',
          style: TextStyle(
            color: tdBlack,
            fontSize: 16,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete), onPressed: (() {}), color: tdRed),
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
