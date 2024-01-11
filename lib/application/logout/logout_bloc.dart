import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/domain/db/token_storage/secure_storage.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  //----instance of secure storage 
  final SecureStorageService secureStorageService;
  LogoutBloc(this.secureStorageService) : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      emit(LogoutLoading());
      //---when logout button clicled , saved data is removed from database 
      //and this function return a bool value to check deletion operation success 
      //failure
      final deleteDetails = await secureStorageService.deleteTokenState();

      if (deleteDetails == true) {
        await Future.delayed(const Duration(seconds: 1));
        emit(LogoutSuccess());
      } else {
        emit(Logoutfailed());
      }
    });
  }
}
