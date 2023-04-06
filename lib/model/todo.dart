class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  int? check;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.check,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDo(id: '03', todoText: 'Check Emails'),
      ToDo(id: '04', todoText: 'Team Meeting'),
    ];
  }

  static List<ToDo> todoListChecked() {
    return [
      
    ];
  }
}
