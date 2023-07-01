import 'package:freezed_annotation/freezed_annotation.dart';
part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
class Friend with _$Friend {
  const factory Friend({
    required String id,
    required String firstName,
    required String lastName,
    @Default('') String phoneNumber,
  }) = _Friend;

  factory Friend.fromJson(Map<String, Object?> json)
      => _$FriendFromJson(json);
}