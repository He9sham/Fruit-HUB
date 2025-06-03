part of 'add_order_cubit.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSuccess extends AddOrderState {
  final NotificationService notificationService = NotificationService();

  AddOrderSuccess() {
    notificationService.showInstantNotification(
        2, 'تم الاضافه', 'لقد تم اضافة طلبك بنجاح وسيتم التواصل معاك');
  }
}

final class AddOrderFailure extends AddOrderState {
  final String errorMessage;
  const AddOrderFailure(this.errorMessage);
}
