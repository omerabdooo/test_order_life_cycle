// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class BoundEntitny {
  final int boundId;
  final String bankName;
  final String clintName;
  final File image;
  final int boundNumber;
  final String date;
  final num boundValue;
  final int orderNumber;
  BoundEntitny({
    required this.boundId,
    required this.bankName,
    required this.clintName,
    required this.image,
    required this.boundNumber,
    required this.date,
    required this.boundValue,
    required this.orderNumber,
  });
}
