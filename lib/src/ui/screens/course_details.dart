import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:flutter_course/src/models/course.dart';

import '../item_course_widget.dart';


class CourseDetailsScreen extends StatefulWidget {
  final Course course;

  CourseDetailsScreen({Key key, this.course}) : super(key: key);

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 1.2;

    final descStyle = TextStyle(color: Colors.black54);

    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
        (int viewId) => IFrameElement()
          ..width = '${width.toInt()}'
          ..height = '${width ~/ 1.777777}'
          ..src = widget.course.videoUrl
          ..style.border = 'none');

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              width: width.toInt().toDouble(),
              height: (width ~/ 1.777777).toDouble(),
              margin: const EdgeInsets.all(40),
              child: Card(
                child: HtmlView(viewType: 'hello-world-html'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('DURATA DEL CORSO', style: descStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('${widget.course.duration} ore'),
                    ),
                    Text(
                      'Suddivise in ${widget.course.days} giorni',
                      style: descStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('GIORNO DI INIZIO', style: descStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.course.nextDate),
                    ),
                    Text(
                      'Pre ordina oggi per riservare il tuo posto',
                      style: descStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('PREREQUISITI', style: descStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Text(widget.course.shortPrerequisites),
                    ),
                    Text(
                      'Se non hai mai programmato prova il pre-base',
                      style: descStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: width,
                margin: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Cosa imparerai',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Flutter basic developer'
                                          .toUpperCase()),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(widget.course.description),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Flexible(
                                child: Image.asset(
                                  'images/flutter_notebook.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 24.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('PREREQUISITI'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(widget.course.prerequisites),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stepper(
                              currentStep: currentStep,
                              onStepTapped: (step) {
                                setState(() {
                                  currentStep = step;
                                });
                              },
                              controlsBuilder: (BuildContext context,
                                  {VoidCallback onStepContinue,
                                  VoidCallback onStepCancel}) {
                                return Row(
                                  children: <Widget>[
                                    Container(
                                      child: null,
                                    ),
                                    Container(
                                      child: null,
                                    ),
                                  ],
                                );
                              },
                              steps: [
                                ...widget.course.steps
                                    .map(
                                      (s) => Step(
                                        title: Text(s.title),
                                        content: Text(s.content),
                                        isActive: true,
                                        state: StepState.complete,
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(40),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Programma',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          ...widget.course.items
                              .map((item) => ItemCourseWidget(item: item))
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[400],
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: Container(
                        width: width / 3,
                        height: 400.0,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Diventa uno sviluppatore Flutter',
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
//                            Row(
//                              children: <Widget>[
//                                Icon(Icons.laptop_chromebook),
//                                Text('LEARN'),
//                              ],
//                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('LEARN'),
                            ),
//                          ItemPower(power: Power(description:'LEARN',icon:Icons.laptop_chromebook),),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  'Impara ad utilizzare il framework più promettente',
                                  style: descStyle),
                            ),
                            SizedBox(
                              height: 20,
                            ),
//                            Row(
//                              children: <Widget>[
//                                Icon(Icons.laptop_chromebook),
//                                Text('LEARN'),
//                              ],
//                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('LEARN'),
                            ),
//                          ItemPower(power: Power(description:'TIME',icon:Icons.access_time),),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  '${widget.course.duration} ore per avere le basi necessarie a sviluppare la tua prima app',
                                  style: descStyle),
                            ),
                            SizedBox(
                              height: 20,
                            ),
//                            Row(
//                              children: <Widget>[
//                                Icon(Icons.laptop_chromebook),
//                                Text('LEARN'),
//                              ],
//                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('LEARN'),
                            ),
//                          ItemPower(power: Power(description:'BENEFIT',icon:Icons.access_time),),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  'Con l\'assistenza post corso e i Flutter mini-packs potrai facilmente superare le difficiltà',
                                  style: descStyle),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Container(
                      width: width / 3,
                      height: 400.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            margin: const EdgeInsets.all(0.0),
                            child: Container(
                              width: (width / 3) - 50,
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text: '€${widget.course.price}  ',
                                      style: TextStyle(fontSize: 30.0),
                                      children: [
                                        TextSpan(
                                          text: '€500',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Acquistando il corso pre-base e quello base ottieni uno sconto del 10%',
                                      style: descStyle,
                                    ),
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        color: Colors.green,
                                        child: Text(
                                          'PRE-ORDINA ORA',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Card(
                            margin: const EdgeInsets.all(0.0),
                            child: Container(
                              width: (width / 3) - 50,
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '€${widget.course.price}',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'sinsalbin',
                                      style: descStyle,
                                    ),
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        color: Colors.green,
                                        child: Text(
                                          'PRE-ORDINA ORA',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
//                    Column(
//                      children: <Widget>[
//                        Card(
//                          child: Column(
//                            children: <Widget>[
//                              Text('dsjsvjn'),
//                            ],
//                          ),
//                        ),
//                        Card(
//                          child: Text('skmnvsv'),
//                        ),
//                      ],
//                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
