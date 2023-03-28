import 'package:radditz/src/common/common.dart';

extension ConvertPost on String {
  PostType toPostTypeEnum() {
    switch (this) {
      case 'text':
        return PostType.text;
      case 'image':
        return PostType.image;
      default:
        return PostType.text;
    }
  }
}
