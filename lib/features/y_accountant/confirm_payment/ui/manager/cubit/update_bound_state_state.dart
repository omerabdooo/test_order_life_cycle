part of 'update_bound_state_cubit.dart';

@immutable
sealed class UpdateBoundStateState {}

final class UpdateBoundStateInitial extends UpdateBoundStateState {}
class UpdateBoundStateCubitLoading extends UpdateBoundStateState{}
class UpdateBoundStateCubitFailure extends UpdateBoundStateState{
  final String errorMessage;
final int boundId;
  UpdateBoundStateCubitFailure(this.boundId, {required this.errorMessage});
}
class UpdateBoundStateCubitSuccess extends UpdateBoundStateState{
  final UpdateBoundStateEntinty updateBoundStateEntinty;

  UpdateBoundStateCubitSuccess({required this.updateBoundStateEntinty});
}
