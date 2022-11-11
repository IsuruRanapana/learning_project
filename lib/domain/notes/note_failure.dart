import 'package:freezed_annotation/freezed_annotation.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 11/11/2022 => 5:05 PM  *** ///


part 'note_failure.freezed.dart';

@freezed
abstract class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = Unexpected;
  const factory NoteFailure.insufficientPermissions() = InsufficientPermissions;
  const factory NoteFailure.unableToUpdate() = UnableToUpdate;
}
