import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/notification_service/local_notification_service.dart';
import 'package:commerce_hub/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  final OrderRepo orderRepo;

  void addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(orderEntity: order);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
