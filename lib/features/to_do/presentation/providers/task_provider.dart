import 'dart:async';
import 'dart:developer';

import 'package:bit_task/core/services/supabase_services.dart';
import 'package:bit_task/features/to_do/data/models/task_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
final taskProvider = StateNotifierProvider<TaskNotifier, AsyncValue<List<Task>>>((ref) => TaskNotifier());
class TaskNotifier extends StateNotifier<AsyncValue<List<Task>>> {
  TaskNotifier() : super(const AsyncLoading());

  final _client = SupabaseService();

  Future<void> getTasks(String date) async {
    print('GetTask');
    state = const AsyncLoading();
    final userId = _client.getUserId();
    if (userId == null) {
      state = const AsyncValue.data([]);
      return;
    }


    try {
      final result = await _client.fetchTodos(userId, date);
      final tasks = (result as List).map((e) => TaskDto.fromJson(e).toDomain()).toList();
      state = AsyncValue.data(tasks);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
    print(state);
  }

  Future<void> addTask(Task task) async {
    final userId = _client.getUserId();
    if (userId == null) return;
    final dto = task.toDto(userId);
    final result = await _client.addTodo(dto);
    state = state.whenData((tasks) => [...tasks, result.toDomain()]);
  }

  Future<void> toggleComplete(int taskId) async {
    final currentState = state;
    if (currentState is! AsyncData) return;

    final tasks = currentState.value;
    final task = tasks?.firstWhere((t) => t.id == taskId);
    final updatedTask = task?.copyWith(isComplete: !task.isComplete);
    if(updatedTask != null){
    await _client.toggleIsComplete(updatedTask);

    final updatedList = tasks?.map((t) => t.id == taskId ? updatedTask : t).toList();
    state = AsyncValue.data(updatedList!);}

  }
}
