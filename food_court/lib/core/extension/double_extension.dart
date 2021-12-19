import 'package:food_court/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return JGSizeFit.setPx(this);
  }

  double get rpx {
    return JGSizeFit.setRpx(this);
  }
}
