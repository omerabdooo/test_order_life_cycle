part of 'get_bound_cubit.dart';

@immutable
sealed class GetBoundState {}

final class GetBoundInitial extends GetBoundState {}

class GetBoundLodingCubit extends GetBoundState {}

class GetBoundSuccessCubit extends GetBoundState {
  final List<BoundEntitny> boundEntitny;

  GetBoundSuccessCubit({required this.boundEntitny});
}

class GetBoundFailureCubit extends GetBoundState {
  final String errorMessage;

  GetBoundFailureCubit({required this.errorMessage});
}
