import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/color.dart';
import 'package:commerce_hub/feature/Onboarding&Splash/view/widgets/custom_container_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = sizeOfHeight(0.5, context);
    return OnBoardingSlider(
      finishButtonText: 'ابدأ الان',
      // onFinish: () {
      //   GoRouter.of(context).push(AppRouter.sighupview);
      // },
      finishButtonStyle: FinishButtonStyle(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: ColorsManager.buttonColor,
      ),
      skipTextButton: const Text(
        'تخطي',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      skipFunctionOverride: () {
        // context.pushNamed(Routes.loginScreen);
      },
      controllerColor: Colors.black,
      totalPage: 2,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        SvgPicture.asset(
          'assets/image/fruit basket-amico 1.svg',
          height: sizeOfHeight(0.5, context),
        ),
        SvgPicture.asset(
          'assets/image/pineapple-cuate 1.svg',
          height: sizeOfHeight(0.5, context),
        ),
      ],
      speed: 1.8,
      pageBodies: const [
        CustomContainerTextView(
          title1: 'Fruit',
          title2: 'HUB',
          title3: ' مرحبا بك في ',
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        CustomContainerTextView(
          title1: 'ابحث ',
          title2: 'وتسوق ',
          title3: '',
          subtitle:
              'ابحث وتسوق نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية ابدأ الان.',
        ),
      ],
    );
  }
}
