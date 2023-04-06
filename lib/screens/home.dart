import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

/*
***Functionality to add

-Color of selected Item should change color
-THe last item is not visible when list is full
- send selected item to the bottom
- allow to hide selected item
- change picture
- at the begining after clearing search, three empty boxes
*/

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _filteredTDList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _filteredTDList = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: tdBGColor,
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
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
                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.only(top: 50, bottom: 20),
                    //   child: Text(
                    //     'Todo List',
                    //     style: TextStyle(
                    //         fontSize: 30, fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                    for (ToDo todoo in _filteredTDList.reversed)
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
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                            hintText: 'Add new task here',
                            border: InputBorder.none)),
                  )),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    // child: ElevatedButton(
                    //   child: Text(
                    //     '+',
                    //     style: TextStyle(fontSize: 40),
                    //   ),
                    //   onPressed: (() {
                    //     _addToDoItem(_todoController.text);
                    //   }),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: tdBlue,
                    //     shape: OutlinedBorder.,
                    //     minimumSize: Size(60, 60),
                    //     elevation: 10,
                    //   ),
                    // )
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: (() {
                          if (_todoController.text == "") {
                          } else {
                            _addToDoItem(_todoController.text);
                          }
                        }),
                        iconSize: 45,
                        color: Colors.white),
                  )
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
          Text(
            'Todo List',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                child: Image.asset('assets/images/Profile2.jpg'),
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
       todosList.indexWhere((element) => element.id == todo.id);
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

  void _runFileredResult(String keyword) {
    List<ToDo> results = [];

    if (keyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) =>
              element.todoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredTDList = results;
    });
  }

  Widget searchBox() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 50),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: TextField(
        onChanged: (value) => {_runFileredResult(value)},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 5,
            ),
            suffixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 25,
            ),
            suffixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
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
