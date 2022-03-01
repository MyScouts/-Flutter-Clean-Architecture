import 'package:url_launcher/url_launcher.dart';

class LinkingHelper {
  static openUrl(String url) async {
    bool isSupport = await canLaunch(url);
    if (isSupport) {
      launch(url);
    }
  }
}
