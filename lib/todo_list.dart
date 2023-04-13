class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Odanı topla', isDone: true),
      ToDo(id: '02', todoText: 'Çöpü Çıkar', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Spor yap',
      ),
      ToDo(
        id: '04',
        todoText: 'İş görüşmesi',
      ),
      ToDo(id: '05', todoText: 'Markete git', isDone: true),
      ToDo(
        id: '06',
        todoText: 'Kitap oku',
      ),
    ];
  }
}
