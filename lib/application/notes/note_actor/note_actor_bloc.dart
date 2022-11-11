import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_project/domain/notes/i_note_repository.dart';
import 'package:learning_project/domain/notes/note.dart';
import 'package:learning_project/domain/notes/note_failure.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

part 'note_actor_bloc.freezed.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;
  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial()) {
    // ignore: void_checks
    on<NoteActorEvent>((event, emit) async*{
      emit( const NoteActorState.actionInProgress());
      final possibleFailure = await _noteRepository.delete(event.note);
       possibleFailure.fold(
            (f) => emit(NoteActorState.deleteFailure(f)),
            (_) => emit(const NoteActorState.deleteSuccess()),
      );
    });
  }
}
