import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/features/store/home/domain/entities/all_order_entity.dart';

@immutable
sealed class AllOrderState {}

final class AllOrderInitial extends AllOrderState {}

final class AllOrderLoading extends AllOrderState {}

final class AllOrderFailuer extends AllOrderState {
  final String errMessage;

  AllOrderFailuer({required this.errMessage});
}

final class AllOrderSuccess extends AllOrderState {
  final List<AllOrderEntity> orders;

  AllOrderSuccess({required this.orders});
}
