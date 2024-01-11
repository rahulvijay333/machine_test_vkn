

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/domain/db/token_storage/secure_storage.dart';
import 'package:login_machine_test/domain/model/sales_estimate/sales_estimate/sales_estimate.dart';
import 'package:login_machine_test/infrastructure/sales_estimate/sales_service.dart';


part 'sales_estimate_event.dart';
part 'sales_estimate_state.dart';

class SalesEstimateBloc extends Bloc<SalesEstimateEvent, SalesEstimateState> {

  // instance of secure storage and sales servie api
  final SecureStorageService _secureStorageService;
  final SalesService _service;
  SalesEstimateBloc(this._service, this._secureStorageService)
      : super(SalesEstimateInitial()) {
    on<GetSalesEstimate>((event, emit) async {
      emit(SalesEstimateLoading());

      //--first get token from database
      final token = await _secureStorageService.retrieveToken();

      //----along with token passed as parameter to this fuction, api call
      //happens here. two values as return expected one is String amd data model.
      //if string value is empty then api call is success and else failed.
      
      final response = await _service.getSalesEstimateApiCall(apiToken: token!);
    
      if (response.$1.isEmpty) {
        emit(SalesEstimatesuccess(salesdata: response.$2));
      } else {
        emit(SalesEstimatefailed(errorMessage: response.$1));
      }
    });
  }
}
