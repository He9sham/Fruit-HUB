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
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("تمت الاضافة الى السلة"),
              duration: const Duration(seconds: 2),
            ),
          );
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
