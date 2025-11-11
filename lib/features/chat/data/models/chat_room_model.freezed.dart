// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoomModel {

 String get roomId; int get otherParticipantId; String? get otherParticipantName; String? get latestMessageContent; DateTime? get latestMessageTimestamp; int? get unreadCount;
/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomModelCopyWith<ChatRoomModel> get copyWith => _$ChatRoomModelCopyWithImpl<ChatRoomModel>(this as ChatRoomModel, _$identity);

  /// Serializes this ChatRoomModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomModel&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.otherParticipantId, otherParticipantId) || other.otherParticipantId == otherParticipantId)&&(identical(other.otherParticipantName, otherParticipantName) || other.otherParticipantName == otherParticipantName)&&(identical(other.latestMessageContent, latestMessageContent) || other.latestMessageContent == latestMessageContent)&&(identical(other.latestMessageTimestamp, latestMessageTimestamp) || other.latestMessageTimestamp == latestMessageTimestamp)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,otherParticipantId,otherParticipantName,latestMessageContent,latestMessageTimestamp,unreadCount);

@override
String toString() {
  return 'ChatRoomModel(roomId: $roomId, otherParticipantId: $otherParticipantId, otherParticipantName: $otherParticipantName, latestMessageContent: $latestMessageContent, latestMessageTimestamp: $latestMessageTimestamp, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ChatRoomModelCopyWith<$Res>  {
  factory $ChatRoomModelCopyWith(ChatRoomModel value, $Res Function(ChatRoomModel) _then) = _$ChatRoomModelCopyWithImpl;
@useResult
$Res call({
 String roomId, int otherParticipantId, String? otherParticipantName, String? latestMessageContent, DateTime? latestMessageTimestamp, int? unreadCount
});




}
/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._self, this._then);

  final ChatRoomModel _self;
  final $Res Function(ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? otherParticipantId = null,Object? otherParticipantName = freezed,Object? latestMessageContent = freezed,Object? latestMessageTimestamp = freezed,Object? unreadCount = freezed,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,otherParticipantId: null == otherParticipantId ? _self.otherParticipantId : otherParticipantId // ignore: cast_nullable_to_non_nullable
as int,otherParticipantName: freezed == otherParticipantName ? _self.otherParticipantName : otherParticipantName // ignore: cast_nullable_to_non_nullable
as String?,latestMessageContent: freezed == latestMessageContent ? _self.latestMessageContent : latestMessageContent // ignore: cast_nullable_to_non_nullable
as String?,latestMessageTimestamp: freezed == latestMessageTimestamp ? _self.latestMessageTimestamp : latestMessageTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: freezed == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoomModel].
extension ChatRoomModelPatterns on ChatRoomModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoomModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoomModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoomModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  int otherParticipantId,  String? otherParticipantName,  String? latestMessageContent,  DateTime? latestMessageTimestamp,  int? unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.roomId,_that.otherParticipantId,_that.otherParticipantName,_that.latestMessageContent,_that.latestMessageTimestamp,_that.unreadCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  int otherParticipantId,  String? otherParticipantName,  String? latestMessageContent,  DateTime? latestMessageTimestamp,  int? unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel():
return $default(_that.roomId,_that.otherParticipantId,_that.otherParticipantName,_that.latestMessageContent,_that.latestMessageTimestamp,_that.unreadCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  int otherParticipantId,  String? otherParticipantName,  String? latestMessageContent,  DateTime? latestMessageTimestamp,  int? unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.roomId,_that.otherParticipantId,_that.otherParticipantName,_that.latestMessageContent,_that.latestMessageTimestamp,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChatRoomModel extends ChatRoomModel {
  const _ChatRoomModel({required this.roomId, required this.otherParticipantId, this.otherParticipantName, this.latestMessageContent, this.latestMessageTimestamp, this.unreadCount}): super._();
  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) => _$ChatRoomModelFromJson(json);

@override final  String roomId;
@override final  int otherParticipantId;
@override final  String? otherParticipantName;
@override final  String? latestMessageContent;
@override final  DateTime? latestMessageTimestamp;
@override final  int? unreadCount;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomModelCopyWith<_ChatRoomModel> get copyWith => __$ChatRoomModelCopyWithImpl<_ChatRoomModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoomModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoomModel&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.otherParticipantId, otherParticipantId) || other.otherParticipantId == otherParticipantId)&&(identical(other.otherParticipantName, otherParticipantName) || other.otherParticipantName == otherParticipantName)&&(identical(other.latestMessageContent, latestMessageContent) || other.latestMessageContent == latestMessageContent)&&(identical(other.latestMessageTimestamp, latestMessageTimestamp) || other.latestMessageTimestamp == latestMessageTimestamp)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,otherParticipantId,otherParticipantName,latestMessageContent,latestMessageTimestamp,unreadCount);

@override
String toString() {
  return 'ChatRoomModel(roomId: $roomId, otherParticipantId: $otherParticipantId, otherParticipantName: $otherParticipantName, latestMessageContent: $latestMessageContent, latestMessageTimestamp: $latestMessageTimestamp, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomModelCopyWith<$Res> implements $ChatRoomModelCopyWith<$Res> {
  factory _$ChatRoomModelCopyWith(_ChatRoomModel value, $Res Function(_ChatRoomModel) _then) = __$ChatRoomModelCopyWithImpl;
@override @useResult
$Res call({
 String roomId, int otherParticipantId, String? otherParticipantName, String? latestMessageContent, DateTime? latestMessageTimestamp, int? unreadCount
});




}
/// @nodoc
class __$ChatRoomModelCopyWithImpl<$Res>
    implements _$ChatRoomModelCopyWith<$Res> {
  __$ChatRoomModelCopyWithImpl(this._self, this._then);

  final _ChatRoomModel _self;
  final $Res Function(_ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? otherParticipantId = null,Object? otherParticipantName = freezed,Object? latestMessageContent = freezed,Object? latestMessageTimestamp = freezed,Object? unreadCount = freezed,}) {
  return _then(_ChatRoomModel(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,otherParticipantId: null == otherParticipantId ? _self.otherParticipantId : otherParticipantId // ignore: cast_nullable_to_non_nullable
as int,otherParticipantName: freezed == otherParticipantName ? _self.otherParticipantName : otherParticipantName // ignore: cast_nullable_to_non_nullable
as String?,latestMessageContent: freezed == latestMessageContent ? _self.latestMessageContent : latestMessageContent // ignore: cast_nullable_to_non_nullable
as String?,latestMessageTimestamp: freezed == latestMessageTimestamp ? _self.latestMessageTimestamp : latestMessageTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: freezed == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
