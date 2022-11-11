import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:learning_project/domain/notes/i_note_repository.dart';
import 'package:learning_project/domain/notes/note.dart';
import 'package:meta/meta.dart';

import '../../../domain/notes/note_failure.dart';

part 'note_watcher_event.dart';

part 'note_watcher_state.dart';

part 'note_watcher_bloc.freezed.dart';

class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;

  final StreamSubscription<Either<NoteFailure, KtList<Note>>>
      _noteStreamSubscription;

  NoteWatcherBloc(this._noteRepository, this._noteStreamSubscription)
      : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>((event, emit) {
      event.map(
        watchAllStarted: (e) async* {},
        watchUncompletedStarted: (e) async* {},
        notesReceived: (e) async* {},
      );
    });
  }
}
