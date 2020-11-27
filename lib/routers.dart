import 'package:url_launcher/url_launcher.dart';

class RouterUtils {
  static const String ROOT = '^/yl';
  static const String HOME = ROOT + '/home';
  static const String WIDGET_LIST = '^/widget_list';
  static const String WIDGET_DETAIL = '^/widget_detail';

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
