import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import '../../view_model/dio_network/end_points.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class Space extends StatelessWidget {
  double width, height;

  Space({Key? key, this.width = 15, this.height = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}

class Loading extends StatelessWidget {
  Color color;
  double size;


  Loading({Key? key, this.color = ColorManager.white, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 3,
        ),
      ),
    );
  }
}


class CustomNetworkImage extends StatelessWidget {
  String image;
  double radius;
  BoxFit fit;
  bool withBaseUrl;
  CustomNetworkImage({required this.image, this.withBaseUrl = true,this.radius = AppSize.borderRadius, this.fit = BoxFit.cover, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (withBaseUrl) {
      image = '${EndPoint.baseUrl}$image';
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        image,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Loading(color: ColorManager.primary, size: 40);
        },
        errorBuilder: (context, exception, stackTrace) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.cardPadding),
                child: Image.asset(
                  AssetsManager.noImage,
                  fit: BoxFit.fill,
                ),
              ));
        },
      ),
    );
  }
}

class ErrorCard extends StatelessWidget {
  String title;
  VoidCallback function;

  ErrorCard({Key? key, this.title = 'Error Occur', required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 260,
        child: Card(
          color: ColorManager.primaryLight,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color:  ColorManager.toastError,
                  size: 60,
                ),
                Space(),
                Text(
                  'Error Occur While Retrieving Data',
                  style: getMediumStyle(fontSize: FontSize.f24),
                  textAlign: TextAlign.center,
                ),
                Space(),
                Text(
                  'Please try again',
                  style: getMediumStyle(),
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    function: () {
                      function();
                    },
                    text: 'Retry',
                    fontSize: 16,
                    height: 35,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Create CustomChoiceChip
