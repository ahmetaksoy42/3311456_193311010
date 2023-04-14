import 'package:flutter/material.dart';
import 'package:to_do_app/screens/login.dart';

import '../../todo_list.dart';
import '../constants/colors.dart';
import '../todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  bool _switchValue = false;

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    hintText: 'Listeye yeni bir madde ekleyin',
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  onSubmitted: (value) {
                    _addToDoItem(_todoController.text);
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                const SizedBox(height: 5),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50)),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    child: const Text("Ekle"))
              ],
            ));
      },
    );
  }

  String a = "$email";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoModal(context);
        },
        elevation: 4.0,
        highlightElevation: 8.0,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        splashColor: Colors.grey,
        mini: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        heroTag: null,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(a),
              accountEmail: Text(a),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Ana Sayfa"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            SwitchListTile(
              title: Text("Gece modu"),
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 30, //search ile text arası boşluk
                          bottom: 30, //text ile liste arasındaki boşluk
                        ),
                        child: const Text(
                          'Tüm Yapılacaklar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for (ToDo _foundToDo in _foundToDo.reversed)
                        ToDoItem(
                          todo: _foundToDo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          /*
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    right: 0,
                    left: 5,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          offset: Offset(5.5, -2),
                          blurRadius: 5,
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  /*
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Listeye yeni bir madde ekleyin',
                        border: InputBorder.none),
                  ),

                   */
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 2,
                  right: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 60,
                      color: Colors.blue,
                      icon: const Icon(
                        Icons.add_box,
                      ),
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: myBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),*/
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
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: myBlack,
            size: 30,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 50,
            minWidth: 25,
          ),
          border: InputBorder.none,
          fillColor: Colors.black,
          hintText: 'Ara',
          hintStyle: TextStyle(color: myGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: myWhite,
      elevation: 0,
      title:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []),
    );
  }
}
