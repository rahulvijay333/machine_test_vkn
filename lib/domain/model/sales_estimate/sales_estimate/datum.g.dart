// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      index: json['index'] as int?,
      id: json['id'] as String?,
      voucherNo: json['VoucherNo'] as String?,
      date: json['Date'] as String?,
      ledgerName: json['LedgerName'] as String?,
      totalGrossAmtRounded: (json['TotalGrossAmt_rounded'] as num?)?.toDouble(),
      totalTaxRounded: (json['TotalTax_rounded'] as num?)?.toDouble(),
      grandTotalRounded: (json['GrandTotal_Rounded'] as num?)?.toDouble(),
      customerName: json['CustomerName'] as String?,
      totalTax: (json['TotalTax'] as num?)?.toDouble(),
      status: json['Status'] as String?,
      grandTotal: (json['GrandTotal'] as num?)?.toDouble(),
      isBillwised: json['is_billwised'] as bool?,
      billwiseStatus: json['billwise_status'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'index': instance.index,
      'id': instance.id,
      'VoucherNo': instance.voucherNo,
      'Date': instance.date,
      'LedgerName': instance.ledgerName,
      'TotalGrossAmt_rounded': instance.totalGrossAmtRounded,
      'TotalTax_rounded': instance.totalTaxRounded,
      'GrandTotal_Rounded': instance.grandTotalRounded,
      'CustomerName': instance.customerName,
      'TotalTax': instance.totalTax,
      'Status': instance.status,
      'GrandTotal': instance.grandTotal,
      'is_billwised': instance.isBillwised,
      'billwise_status': instance.billwiseStatus,
    };
