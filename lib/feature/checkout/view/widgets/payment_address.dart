import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/shipping_address_entity.dart';
import 'package:commerce_hub/feature/checkout/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentAddress extends StatefulWidget {
  const PaymentAddress({super.key});

  @override
  State<PaymentAddress> createState() => _PaymentAddressState();
}

class _PaymentAddressState extends State<PaymentAddress> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = context.read<OrderEntity>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(8),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'عنوان التوصيل',
              textDirection: TextDirection.rtl,
              style: Styles.textSize13Black600
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => _showEditAddressBottomSheet(context),
              child: Row(
                children: [
                  Image.asset('assets/image/edit.png'),
                  Text(
                    'تعديل',
                    textDirection: TextDirection.rtl,
                    style: Styles.textSize13Black600.copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(
              FontAwesomeIcons.locationDot,
              size: 16,
            ),
            horizontalSpace(8),
            Expanded(
              child: Text(
                orderEntity.shippingAddressEntity?.toString() ??
                    'لا يوجد عنوان',
                textDirection: TextDirection.rtl,
                style: Styles.textSize13Black600.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _showEditAddressBottomSheet(BuildContext context) {
    final shippingAddress =
        orderEntity.shippingAddressEntity ?? ShippingAddressEntity();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'تعديل العنوان',
                  style: Styles.textSize13Black600.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(16),
                buildTextField(
                  'الاسم كامل',
                  shippingAddress.name,
                  (value) => shippingAddress.name = value,
                ),
                verticalSpace(8),
                buildTextField(
                  'العنوان',
                  shippingAddress.address,
                  (value) => shippingAddress.address = value,
                ),
                verticalSpace(8),
                buildTextField(
                  'المدينة',
                  shippingAddress.city,
                  (value) => shippingAddress.city = value,
                ),
                verticalSpace(8),
                buildTextField(
                  'الرمز البريدي',
                  shippingAddress.post,
                  (value) => shippingAddress.post = value,
                ),
                verticalSpace(8),
                buildTextField(
                  'رقم الطابق , رقم الشقه ..',
                  shippingAddress.floor,
                  (value) => shippingAddress.floor = value,
                ),
                verticalSpace(16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        orderEntity.shippingAddressEntity = shippingAddress;
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.buttonColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'حفظ العنوان',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                verticalSpace(16),
              ],
            ),
          ),
        );
      },
    );
  }
}
