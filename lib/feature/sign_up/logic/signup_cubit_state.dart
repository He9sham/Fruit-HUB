part of 'signup_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}
final class SignupCubitFailure extends SignupCubitState {
  final String errMessage;
  SignupCubitFailure({required this.errMessage});
}
final class SignupCubitLoading extends SignupCubitState {}
final class SignupCubitSuccess extends SignupCubitState {}
