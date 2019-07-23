import 'package:flutter_web/material.dart';
import 'package:flutter_course/src/models/power.dart';

class ItemPower extends StatelessWidget {
  final Power power;

  const ItemPower({Key key, this.power}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(
      power.description ?? '',
      maxLines: 2,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right:4.0),
            child: power.title != null
                ? Text(power.title)
                : Icon(
                    power.icon,
                    color: power.color,
                  ),
          ),
          Expanded(child: text),
          Spacer(),
        ],
      ),
    );
  }
}
