import 'package:flutter/material.dart';

import '../todo_list.dart';
import 'constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 45, left: 5, right: 5), //aradaki boşluk
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        tileColor: Colors.blue,
        leading: Icon(
          todo.isDone ? Icons.check : null,
          color: todo.isDone ? Colors.greenAccent : myRed,
        ),
        title: Text(
          todo.todoText!,
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: todo.isDone ? Colors.greenAccent : myBlack,
            // decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          // padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 2),
          height: 45,
          width: 45,
          child: IconButton(
            color: Colors.red,
            iconSize: 30,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
