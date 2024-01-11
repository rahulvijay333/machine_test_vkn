// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_estimate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesEstimate _$SalesEstimateFromJson(Map<String, dynamic> json) =>
    SalesEstimate(
      statusCode: json['StatusCode'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$SalesEstimateToJson(SalesEstimate instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'total_count': instance.totalCount,
    };
