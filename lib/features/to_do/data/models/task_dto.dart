import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    int? id,
    required String title,
    required String note,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required int reminder,
    @JsonKey(name: 'is_complete') required bool isComplete,
    @JsonKey(name: 'is_repeatable') required bool isRepeatable,
    @JsonKey(name: 'user_id') required String userId,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

  @override
  // TODO: implement endTime
  String get endTime => throw UnimplementedError();

  @override
  // TODO: implement id
  int? get id => throw UnimplementedError();

  @override
  // TODO: implement isComplete
  bool get isComplete => throw UnimplementedError();

  @override
  // TODO: implement isRepeatable
  bool get isRepeatable => throw UnimplementedError();

  @override
  // TODO: implement note
  String get note => throw UnimplementedError();

  @override
  // TODO: implement reminder
  int get reminder => throw UnimplementedError();

  @override
  // TODO: implement startTime
  String get startTime => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement userId
  String get userId => throw UnimplementedError();
}


extension TaskDtoMapper on TaskDto {
  Task toDomain() {
    return Task(
      id: id,
      title: title,
      note: note,
      startTime: startTime,
      endTime: endTime,
      reminderTime: reminder,
      isComplete: isComplete,
      isRepeated: isRepeatable,
    );
  }
}

extension TaskMapper on Task {
  TaskDto toDto(String userId) {
    return TaskDto(
      id: id,
      title: title,
      note: note ?? '',
      startTime: startTime,
      endTime: endTime,
      reminder: reminderTime,
      isComplete: isComplete,
      isRepeatable: isRepeated,
      userId: userId,
    );
  }
}

