import 'package:flutter/material.dart';
import 'package:la_vie/data/plant_model.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';

class PlantCard extends StatelessWidget {
  PlantData plant;
  PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      plant.imageUrl!,
                      width: 80,
                      height: 140,
                      errorBuilder: (context, exception, stackTrace) {
                        return const Text('Unable to load..');
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.greyLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: ColorManager.grey,
                        size: 16,
                      ),
                    ),
                  ),
                  Text(
                    ' 1 ',
                    style: getMediumStyle(
                        color: ColorManager.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.greyLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: ColorManager.grey,
                        size: 16,
                      ),
                      color: ColorManager.greyLight,
                    ),
                  ),
                ],
              ),
            ),
            Space(),
            Text(
              '${plant.name}'.toUpperCase(),
              style:
              getMediumStyle(color: ColorManager.black),
            ),
            Space(height: 5),
            Text(
              '70 EGP'.toUpperCase(),
              style: getRegularStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.f12),
            ),
            Space(height: 7),
            Center(
                child: CustomButton(
                  text: 'Add To Card',
                  function: () {},
                  fontSize: FontSize.f16,
                  height: 35,
                ))
          ],
        ),
      ),
    );
  }
}
