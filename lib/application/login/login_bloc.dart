import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/domain/db/token_storage/secure_storage.dart';
import 'package:login_machine_test/infrastructure/login/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //---instance of class loginservice for api call and storage access
  final LoginService _loginService;
  final SecureStorageService _secureStorageService;

  LoginBloc(this._loginService, this._secureStorageService)
      : super(LoginInitial()) {
    on<LogIn>((event, emit) async {
      emit(LoginLoading());

      //calling login api and expects two parameters a string , data model as return
      final response = await _loginService.loginAccount(
          username: event.username, password: event.password);
      //if login success then string(error) will be empty otherwise string contains some value
      if (response.$1.isEmpty) {
        final apikey = response.$2!.data!.access;
        await _secureStorageService.storeToken(apikey!, 'true');

        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errorMessage: response.$1));
      }
    });
  }
}
