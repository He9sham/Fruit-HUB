import 'package:commerce_hub/core/widgets/custom_progress_hud.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
         showSnackBar(context, state.errorMessage);
        } else if (state is AddOrderSuccess) {
          showSnackBar(context, 'تمت إضافة الطلب بنجاح');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading,
          child: child);
      },
    );
  }
}
