// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDto {

 int? get id; String get title; String get note;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime; int get reminder;@JsonKey(name: 'is_complete') bool get isComplete;@JsonKey(name: 'is_repeatable') bool get isRepeatable;@JsonKey(name: 'user_id') String get userId;
/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDtoCopyWith<TaskDto> get copyWith => _$TaskDtoCopyWithImpl<TaskDto>(this as TaskDto, _$identity);

  /// Serializes this TaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.isRepeatable, isRepeatable) || other.isRepeatable == isRepeatable)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,note,startTime,endTime,reminder,isComplete,isRepeatable,userId);

@override
String toString() {
  return 'TaskDto(id: $id, title: $title, note: $note, startTime: $startTime, endTime: $endTime, reminder: $reminder, isComplete: $isComplete, isRepeatable: $isRepeatable, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TaskDtoCopyWith<$Res>  {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) _then) = _$TaskDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String title, String note,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, int reminder,@JsonKey(name: 'is_complete') bool isComplete,@JsonKey(name: 'is_repeatable') bool isRepeatable,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class _$TaskDtoCopyWithImpl<$Res>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._self, this._then);

  final TaskDto _self;
  final $Res Function(TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? note = null,Object? startTime = null,Object? endTime = null,Object? reminder = null,Object? isComplete = null,Object? isRepeatable = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,reminder: null == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as int,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,isRepeatable: null == isRepeatable ? _self.isRepeatable : isRepeatable // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskDto implements TaskDto {
  const _TaskDto({this.id, required this.title, required this.note, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, required this.reminder, @JsonKey(name: 'is_complete') required this.isComplete, @JsonKey(name: 'is_repeatable') required this.isRepeatable, @JsonKey(name: 'user_id') required this.userId});
  factory _TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

@override final  int? id;
@override final  String title;
@override final  String note;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override final  int reminder;
@override@JsonKey(name: 'is_complete') final  bool isComplete;
@override@JsonKey(name: 'is_repeatable') final  bool isRepeatable;
@override@JsonKey(name: 'user_id') final  String userId;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDtoCopyWith<_TaskDto> get copyWith => __$TaskDtoCopyWithImpl<_TaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.isRepeatable, isRepeatable) || other.isRepeatable == isRepeatable)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,note,startTime,endTime,reminder,isComplete,isRepeatable,userId);

@override
String toString() {
  return 'TaskDto(id: $id, title: $title, note: $note, startTime: $startTime, endTime: $endTime, reminder: $reminder, isComplete: $isComplete, isRepeatable: $isRepeatable, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$TaskDtoCopyWith(_TaskDto value, $Res Function(_TaskDto) _then) = __$TaskDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, String note,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, int reminder,@JsonKey(name: 'is_complete') bool isComplete,@JsonKey(name: 'is_repeatable') bool isRepeatable,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class __$TaskDtoCopyWithImpl<$Res>
    implements _$TaskDtoCopyWith<$Res> {
  __$TaskDtoCopyWithImpl(this._self, this._then);

  final _TaskDto _self;
  final $Res Function(_TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? note = null,Object? startTime = null,Object? endTime = null,Object? reminder = null,Object? isComplete = null,Object? isRepeatable = null,Object? userId = null,}) {
  return _then(_TaskDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,reminder: null == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as int,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,isRepeatable: null == isRepeatable ? _self.isRepeatable : isRepeatable // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
