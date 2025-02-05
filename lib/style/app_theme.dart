import 'package:flutter/material.dart';

import 'app_colors.dart';

SliderThemeData defaultSliderTheme = SliderThemeData(
  activeTrackColor: AppColors.white,
  trackHeight: 4,
  overlayShape: SliderComponentShape.noThumb,
  trackShape: const RoundedRectSliderTrackShape(),
  thumbColor: AppColors.white,
  inactiveTrackColor: AppColors.greyColor,
  thumbShape: const RoundSliderThumbShape(
      enabledThumbRadius: 0, disabledThumbRadius: 0),
);
