part of 'sales_estimate_bloc.dart';

abstract class SalesEstimateState {}

class SalesEstimateInitial extends SalesEstimateState {}

class SalesEstimateLoading extends SalesEstimateState {}

class SalesEstimatesuccess extends SalesEstimateState {

  final SalesEstimate? salesdata;

  SalesEstimatesuccess({required this.salesdata});
}

class SalesEstimatefailed extends SalesEstimateState {
  final String errorMessage;

  SalesEstimatefailed({required this.errorMessage});
}
