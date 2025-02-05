import 'package:flutter/cupertino.dart';

extension ResponsiveText on double {
  double sp(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double calculatedSize = (this / 720) * screenHeight;
    if (screenHeight < 600) {
      return calculatedSize.clamp(this - 4, this);
    } else if (screenHeight > 1080) {
      return calculatedSize.clamp(this, this + 2);
    } else {
      double calculatedSize = (this / 720) * screenHeight;
      return calculatedSize.clamp(this - 2, this);
    }
  }
}
