// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => _TaskDto(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  note: json['note'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  reminder: (json['reminder'] as num).toInt(),
  isComplete: json['is_complete'] as bool,
  isRepeatable: json['is_repeatable'] as bool,
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$TaskDtoToJson(_TaskDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'note': instance.note,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'reminder': instance.reminder,
  'is_complete': instance.isComplete,
  'is_repeatable': instance.isRepeatable,
  'user_id': instance.userId,
};
