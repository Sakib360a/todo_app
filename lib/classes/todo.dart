class Todo {
  final String title;
  final String description;
  final DateTime dateCreated;
  bool isDone=false;
  Todo(
    this.isDone, {
    required this.title,
    required this.description,
    required this.dateCreated,
  });
}
