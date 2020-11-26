import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class YlUtils {
  /// toast
  static toast(String text) {
    BotToast.showCustomText(
      backgroundColor: Colors.transparent,
      onlyOne: true,
      crossPage: true,
      align: Alignment.center,
      toastBuilder: (CancelFunc cancelFunc) {
        return TextToast(
          text: text,
        );
      },
    );
  }
}

class TextToast extends StatelessWidget {
  final String text;

  const TextToast({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          constraints:
          constraints.copyWith(maxWidth: constraints.biggest.width * 0.6),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}