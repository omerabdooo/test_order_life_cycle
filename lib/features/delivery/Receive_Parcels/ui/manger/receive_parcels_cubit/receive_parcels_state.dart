part of 'receive_parcels_cubit.dart';

@immutable
sealed class ReceiveParcelsState {}

final class ReceiveParcelsInitial extends ReceiveParcelsState {}

class ReceiveParcelsLoading extends ReceiveParcelsState {}

class ReceiveParcelsSuccess extends ReceiveParcelsState {
  final String receiveParcels;

  ReceiveParcelsSuccess(this.receiveParcels);
}

class ReceiveParcelsFailure extends ReceiveParcelsState {
  final String errorMessage;

  ReceiveParcelsFailure(this.errorMessage);
}

