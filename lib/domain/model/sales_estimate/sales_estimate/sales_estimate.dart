import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'sales_estimate.g.dart';

@JsonSerializable()
class SalesEstimate {
  @JsonKey(name: 'StatusCode')
  int? statusCode;
  List<Datum>? data;
  @JsonKey(name: 'total_count')
  int? totalCount;

  SalesEstimate({this.statusCode, this.data, this.totalCount});

  factory SalesEstimate.fromJson(Map<String, dynamic> json) {
    return _$SalesEstimateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalesEstimateToJson(this);
}
