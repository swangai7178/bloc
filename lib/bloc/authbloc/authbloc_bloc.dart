import 'package:bloc/bloc.dart';
import 'package:bloc_first/repos/authrepo.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final Authrepo _authrepo;
  AuthblocBloc(this._authrepo) : super(AuthblocInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final results = await _authrepo.login(event.email, event.password);
      if (results.toString().contains('Authorization')) {
        final prefs = await SharedPreferences.getInstance();
        emit(AuthSuccess());
      } else if (results == null) {
        emit(Autherror(messageerror: "Something wrong happened"));
      }
    });
  }
}
