import 'package:flutter_web/material.dart';
import 'package:flutter_course/src/models/item_course.dart';

class ItemCourseWidget extends StatelessWidget {
  final ItemCourse item;

  const ItemCourseWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: Theme.of(context).primaryColor,
      ),
      child: item.children.isEmpty
          ? ListTile(
              title: Text(
                item.title,
                style:
                    TextStyle(color: Colors.black,),
              ),
            )
          : ExpansionTile(
              title: Text(item.title),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              children: item.children
                  .map((i) => ListTile(
                        title: Text(i),
                      ))
                  .toList()),
    );
  }
}
