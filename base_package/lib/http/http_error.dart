import 'package:base_package/extensions/extension_hup.dart';

class HttpError {
  static String infoWithMessage(String message) {
    message = message == null ? "" : message;
    if (message.containsChinese()) {
      return message;
    }
    String info = dicErrorMessage()[message];
    return info == null ? "出现错误" : info;
  }

  static Map<String, String> dicErrorMessage() {
    return {
      "600": "网络不可用，请检查网络设置",
    };
  }
}
