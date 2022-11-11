import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:learning_project/domain/notes/note.dart';
import 'package:learning_project/domain/notes/note_failure.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 11/11/2022 => 5:04 PM  *** ///


abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
