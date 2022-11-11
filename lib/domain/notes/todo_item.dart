import 'package:dartz/dartz.dart';
import 'package:learning_project/domain/core/common_interfaces.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_project/domain/core/entity.dart';
import 'package:learning_project/domain/core/failures.dart';
import 'package:learning_project/domain/core/value_objects.dart';
import 'package:learning_project/domain/notes/value_objects.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 11/11/2022 => 5:05 PM  *** ///


part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem implements IEntity {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
    id: UniqueId(),
    name: TodoName(''),
    done: false,
  );
}

extension TodoItemX on TodoItem {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold((f) => some(f), (_) => none());
  }
}
