part of 'resetpassword_cubit.dart';

@immutable
sealed class ResetpasswordState {}

final class ResetpasswordInitial extends ResetpasswordState {}

final class ResetpasswordLoading extends ResetpasswordState {}

final class ResetpasswordSuccess extends ResetpasswordState {}

final class ResetpasswordFailure extends ResetpasswordState {
  final String errMessage;

  ResetpasswordFailure(this.errMessage);
}
