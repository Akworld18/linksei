import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  LinksBloc() : super(LinksInitial()) {
    on<LinksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
