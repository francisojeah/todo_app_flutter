import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> filteredTDList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    filteredTDList = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todoo in filteredTDList.reversed)
                      ToDoItem(
                        todo: todoo,
                        onDeleteItem: _deleteToDoItem,
                        onToDoChanged: _handleToDoChange,
                      )
                  ],
                ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none)),
                  )),
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                      ),
                      child: ElevatedButton(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: (() {
                          _addToDoItem(_todoController.text);
                        }),
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
            child: ClipRRect(
                child: Image.asset('assets/images/picture.jpg'),
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String tdItem) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: tdItem));
    });
    _todoController.clear();
  }

  void _fileredResult(String keyword) {
    setState(() {
      List<ToDo> results = [];

      if (keyword == '') {
        results = todosList;
      } else {
        results = todosList
            .where((element) =>
                element.todoText!.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
      filteredTDList = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: TextField(
        onChanged: (value) => {_fileredResult(value)},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }
}




// class searchBox extends StatelessWidget {
//   const searchBox({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20), color: Colors.white),
//       child: TextField(
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(0),
//             prefixIcon: Icon(
//               Icons.search,
//               color: tdBlack,
//               size: 20,
//             ),
//             prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
//             border: InputBorder.none,
//             hintText: 'Search',
//             hintStyle: TextStyle(color: tdGrey)),
//       ),
//     );
//   }
// }
