

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/features/ui/common/controllers/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../app/utils/constants/color.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(
      builder: (controller) {
        return Column(
          children: [
            Visibility(
              visible:controller.sliders.isNotEmpty,
              child: Visibility(
                visible: controller.getSliderInProgress==false,
                replacement: SizedBox(
                    height: 200,
                    child: const Center(child: CircularProgressIndicator())),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      _selectedSlider = index;
                      setState(() {});
                    },
                  ),
                  items:controller.sliders.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(slider.photoUrl),
                            )
                          ),
                          child: Center(
                            child: Text(
                              slider.description,
                              style: const TextStyle(fontSize: 16.0,color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < HomeSliderController().sliders.length; i++)
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                      color: _selectedSlider == i
                          ? AppColors.themeColor
                          : Colors.white,
                    ),
                  )
              ],
            )
          ],
        );
      }
    );
  }
}
