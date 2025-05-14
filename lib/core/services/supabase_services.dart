import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/to_do/data/models/task_dto.dart';
import '../../features/to_do/domain/entities/task.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  String? getUserId() {
    //return _client.auth.currentUser?.id;
    return '0020ed0c-50e3-4731-bf58-5742dae56a43';
  }

  Future<List<Map<String, dynamic>>> fetchTodos(
    String userId,
    String date,
  ) async {
    log('FetchTodos');
    final response = await _client
        .from('task')
        .select()
        .eq('user_id', userId);
        //.like('start_time', '$date%');
    print(response);
    return response;
  }

  Future<TaskDto> addTodo(TaskDto task) async {
    final response =
        await _client
            .from('task')
            .insert({task.toJson()..remove('id')})
            .select()
            .single();
    return TaskDto.fromJson(response);
  }

  Future<void> toggleIsComplete(Task task) async {
    await _client
        .from('task')
        .update({'is_complete': task.isComplete})
        .eq('id', task.id ?? 0);
  }
}
