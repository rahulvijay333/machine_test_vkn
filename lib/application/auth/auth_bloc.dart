import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/domain/db/token_storage/secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //---instance of secure storage to get saved token
  final SecureStorageService _secureStorageService;
  AuthBloc(this._secureStorageService) : super(AuthInitial()) {
    on<AuthStatus>((event, emit) async {
      emit(AuthLoading());

      //---fetching token from storage , expects a bool status true or false
      final loggedstatus = await _secureStorageService.retrieveLoginStatus();

      if (loggedstatus == 'true') {
        emit(AuthVerified());
      } else {
        emit(AuthNotVeriied());
      }
    });
  }
}
