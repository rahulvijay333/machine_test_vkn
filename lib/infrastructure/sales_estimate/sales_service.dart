import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_machine_test/core/api/api_endpoints.dart';
import 'package:login_machine_test/domain/model/sales_estimate/sales_estimate/sales_estimate.dart';

class SalesService {
  Future<(String, SalesEstimate?)> getSalesEstimateApiCall(
      {required String apiToken}) async {

        //parameter required to retrive sales details
    final requiredParamatersDemo = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 3,
      "page_no": 1,
      "items_per_page": 10,
      "type": "Sales",
      "WarehouseID": 1
    };

    try {
      final Response response = await Dio().post(ApiEndpoints.salesEstimate,
          data: jsonEncode(requiredParamatersDemo),
          options: Options(
            headers: {'Authorization': 'Bearer $apiToken'},
          ));

      if (response.statusCode == 200) {
        return ('', SalesEstimate.fromJson(response.data));
      } else {
        return ('Error occured while connecting to server', null);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.error is SocketException) {
          return ('Check Internet connectivity', null);
        } else {
          return ('Try lator, server connection failed', null);
        }
      } else {
        return ("Error connection to server", null);
      }
    }
  }
}
