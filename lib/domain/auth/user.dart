import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_project/domain/auth/value_objects.dart';
import 'package:learning_project/domain/core/entity.dart';
import 'package:learning_project/domain/core/failures.dart';
import 'package:learning_project/domain/core/value_objects.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 11/11/2022 => 4:53 PM  *** ///


part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  const factory User({
    required UniqueId id,
    required StringSingleLine name,
    required EmailAddress emailAddress,
  }) = _User;
}

extension UserX on User {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .fold((l) => some(l), (r) => none());
  }
}
