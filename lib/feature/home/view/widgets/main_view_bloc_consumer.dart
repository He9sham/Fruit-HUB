import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/home/logic/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBlocConsumer extends StatelessWidget {
  const MainViewBlocConsumer({
    super.key,
    required this.currentIndex,
    required this.screens,
  });

  final int currentIndex;
  final List<StatelessWidget> screens;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartProductCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          ShowSnackBar.showSnackBar(context, 'تمت الاضافة الى السلة');
        }
        if (state is CartRemoved) {
          ShowSnackBar.showSnackBar(context, 'تمت الازالة من السلة');
        }
      },
      builder: (context, state) {
        return IndexedStack(
          index: currentIndex,
          children: screens,
        );
      },
    );
  }
}
