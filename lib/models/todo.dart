class Todo{
  final bool completed;
  final int id;
  final String title;
  final int userId;

  Todo(
    {
      required this.id, 
      required this.userId, 
      required this.title, 
      required this.completed});
}