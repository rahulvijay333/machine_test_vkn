import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? index;
  String? id;
  @JsonKey(name: 'VoucherNo')
  String? voucherNo;
  @JsonKey(name: 'Date')
  String? date;
  @JsonKey(name: 'LedgerName')
  String? ledgerName;
  @JsonKey(name: 'TotalGrossAmt_rounded')
  double? totalGrossAmtRounded;
  @JsonKey(name: 'TotalTax_rounded')
  double? totalTaxRounded;
  @JsonKey(name: 'GrandTotal_Rounded')
  double? grandTotalRounded;
  @JsonKey(name: 'CustomerName')
  String? customerName;
  @JsonKey(name: 'TotalTax')
  double? totalTax;
  @JsonKey(name: 'Status')
  String? status;
  @JsonKey(name: 'GrandTotal')
  double? grandTotal;
  @JsonKey(name: 'is_billwised')
  bool? isBillwised;
  @JsonKey(name: 'billwise_status')
  String? billwiseStatus;

  Datum({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillwised,
    this.billwiseStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
