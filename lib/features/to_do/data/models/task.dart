
class Task{
  int? id;
  String title;
  String note;
  String startTime;
  String endTime;
  int reminderTime;
  bool isComplete;
  bool isRepeated;

  Task(
      {this.id,
      required this.title,
      required this.note,
      required this.startTime,
      required this.endTime,
      required this.reminderTime,
      this.isComplete = false, this.isRepeated = false});
}