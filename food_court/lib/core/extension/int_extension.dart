import 'package:food_court/ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return JGSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return JGSizeFit.setRpx(this.toDouble());
  }
}