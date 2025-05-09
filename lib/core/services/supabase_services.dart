import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bit_task/features/to_do/data/models/task.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;
  Future<List<Map<String, dynamic>>> fetchTodos(int userId) async {

    final response = await _client
        .from('task')
        .select()
        .eq('user_id', userId);
        //.order('due_time');
    return response;
  }
  Future<void> addTodo(Task task, int userId) async {
    await _client.from('task').insert({
      'user_id': '0020ed0c-50e3-4731-bf58-5742dae56a43',
      'title': task.title,
      'note': task.note,
      'start_time': task.startTime,
      'end_time': task.endTime,
      'is_repeatable': task.isRepeated,
    'is_complete': task.isComplete,
    'reminder': task.reminderTime,
    });
  }

}