import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:learning_project/domain/core/entity.dart';
import 'package:learning_project/domain/core/failures.dart';
import 'package:learning_project/domain/core/value_objects.dart';
import 'package:learning_project/domain/notes/todo_item.dart';
import 'package:learning_project/domain/notes/value_objects.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 11/11/2022 => 5:05 PM  *** ///

part 'note.freezed.dart';
@freezed
abstract class Note with _$Note implements IEntity {
  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
    id: UniqueId(),
    body: NoteBody(''),
    color: NoteColor(NoteColor.predefinedColors[0]),
    todos: List3(emptyList()),
  );
}

extension NoteX on Note {
  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(color.failureOrUnit)
        .andThen(todos.failureOrUnit)
        .andThen(
      todos
          .getOrCrash()
          .map((todoItem) => todoItem.failureOption)
          .filter((o) => o.isSome())
          .getOrElse(0, (_) => none())
          .fold(() => right(unit), (f) => left(f)),
    )
        .fold((f) => some(f), (_) => none());
  }
}
