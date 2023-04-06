import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(child: Image.asset('assets/images/picture.jpg'),borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
      body: Container(
        child: Text('This is home screen'),
      ),
    );
  }
}
