import 'package:flutter_course/src/models/step.dart';
import 'package:flutter_web/material.dart';
import 'item_course.dart';

class Course {
  final String title;
  final String description;
  final Color color;
  final List<ItemCourse> items;
  final List<StepData> steps;
  final int price;
  final int duration;
  final String prerequisites;
  final String shortPrerequisites;
  final String nextDate;
  final int days;
  final videoUrl;

  Course({
    this.steps,
    this.title,
    this.description,
    this.color,
    this.items,
    this.price,
    this.duration,
    this.prerequisites,
    this.shortPrerequisites,
    this.nextDate,
    this.days,
    this.videoUrl,
  });
}

final courseList = [
  Course(
    title: "PRE-BASE",
    description: "Se non hai mai programmato questo è il corso che fa per te! "
        "Ti forniremo le basi della programmazione ad oggetti, partendo da "
        "cos'è una variabile al polimorfismo, ereditarietà e alla costruzione di classi complesse.",
    color: Colors.lightBlue,
    items: [
      ItemCourse(
        title: 'Programmazione ad oggetti',
        children: [
          'Variabili',
          'Classi',
          'Polimorfistmo',
          'Ereditarietà',
          'Metodi',
        ],
      ),
      ItemCourse(
        title: 'Dart',
        children: [
          'Variabili',
          'final e const',
          'Classi',
          'Tipi',
          'Funzioni',
          'Parametri opzionali e di default',
          'Costruttori',
          'Cicli',
          'Await/Async',
        ],
      ),
      ItemCourse(
        title: 'Esercitazioni',
        children: [],
      ),
    ],
    price: 400,
    duration: 10,
    prerequisites: 'Prerequisiti corso pre-base',
    steps: [
      StepData(title: 'Step1', content: 'contentStep1'),
      StepData(title: 'Step2', content: 'contentStep2'),
      StepData(title: 'Step3', content: 'contentStep3'),
      StepData(title: 'Step4', content: 'contentStep4'),
      StepData(title: 'Step5', content: 'contentStep5'),
    ],
    shortPrerequisites: 'prerequisiti pre-base breve',
    nextDate: '22 Ottobre 2019',
    days: 2,
    videoUrl: 'https://www.youtube.com/embed/9iUMZA46_8k',
  ),
  Course(
    title: "BASE",
    description: "In questo corso imparerai ad usare Flutter per sviluppare "
        "rapidamente applicazioni mobili interattive e di alta qualità per "
        "dispositivi iOS e Android. Che tu stia iniziando con lo "
        "sviluppo di app mobile o se hai esperienza con "
        "altri framework multipiattaforma, scoprirai un nuovo piacevole modo "
        "realizzare app native grazie a Flutter!",
    color: Colors.orange,
    items: [
      ItemCourse(
        title: 'Introduzione Flutter e novità',
        children: [
          'Cos\'è Flutter?',
          'Architettura',
          'Novità',
        ],
      ),
      ItemCourse(
        title: 'Dart',
        children: [
          'Variabili',
          'final e const',
          'Funzioni',
          'Parametri opzionali e di default',
          'Classi',
          'Cicli',
          'Await/Async',
          'Stream',
        ],
      ),
      ItemCourse(
        title: 'Flutter Basic',
        children: [
          'Creazione nuovo progetto',
          'Struttura del progetto',
          'Widget',
          'Material/Cupertino Widget',
        ],
      ),
      ItemCourse(
        title: 'Widgets',
        children: [
          'Container',
          'Row',
          'Column',
          'Stack',
          'Scaffold',
          'SafeArea',
          'ListView',
          'PageView',
        ],
      ),
      ItemCourse(
        title: 'User input',
        children: [
          'Button',
          'TextField',
          'Forms',
          'Switch',
        ],
      ),
      ItemCourse(
        title: 'Navigazione',
        children: [],
      ),
      ItemCourse(
        title: 'HTTP Package',
        children: [
          'GET',
          'POST',
        ],
      ),
    ],
    price: 400,
    duration: 20,
    prerequisites: 'Prerequisiti corso base',
    steps: [
      StepData(title: 'Step1', content: 'contentStep1'),
      StepData(title: 'Step2', content: 'contentStep2'),
      StepData(title: 'Step3', content: 'contentStep3'),
      StepData(title: 'Step4', content: 'contentStep4'),
      StepData(title: 'Step5', content: 'contentStep5'),
    ],
    shortPrerequisites: 'prerequisiti pre-base breve',
    nextDate: '22 Ottobre 2019',
    days: 3,
    videoUrl: 'https://www.youtube.com/embed/9iUMZA46_8k',
  ),
  Course(
    title: "INTERMEDIO",
    description: "Per chi ha già dimestichezza con Flutter, potrà acquisire "
        "nozioni fondamentali sullo state management, sull'utilizzo di SQL, sull'utilizzo di "
        "plugin importanti come Google Maps, Firebase, "
        "come trasformare un progetto Flutter in un\'"
        "applicazione desktop e web e su come configurare codemagic CI",
    color: Colors.purple,
    items: [
      ItemCourse(
        title: 'Navigazione avanzata',
        children: [
          'Route',
          'Deep Link',
        ],
      ),
      ItemCourse(
        title: 'Responsive layout',
        children: [
          'LayoutBuilder',
        ],
      ),
      ItemCourse(
        title: 'Stream e RxDart',
        children: [],
      ),
      ItemCourse(
        title: 'Model e State Management',
        children: [
          'Provider',
          'BloC',
        ],
      ),
      ItemCourse(
        title: 'Database SQL',
        children: [
          'Configurazione',
          'Operazioni CRUD',
        ],
      ),
      ItemCourse(
        title: 'Firebase',
        children: [
          'Configurazione',
          'Firestore',
          'Notifiche Push',
        ],
      ),
      ItemCourse(
        title: 'Animazioni',
        children: [
          'Animazioni a 60fps',
          'Flare',
        ],
      ),
      ItemCourse(
        title: 'Deploy',
        children: [
          'Android',
          'iOS',
        ],
      ),
      ItemCourse(
        title: 'Flutter WEB',
        children: [],
      ),
      ItemCourse(
        title: 'Flutter Desktop',
        children: [],
      ),
      ItemCourse(
        title: 'Codemagic CI',
        children: [],
      ),
    ],
    price: 400,
    duration: 20,
    prerequisites: 'Prerequisiti corso inrtermedio',
    steps: [
      StepData(title: 'Step1', content: 'contentStep1'),
      StepData(title: 'Step2', content: 'contentStep2'),
      StepData(title: 'Step3', content: 'contentStep3'),
      StepData(title: 'Step4', content: 'contentStep4'),
      StepData(title: 'Step5', content: 'contentStep5'),
    ],
    shortPrerequisites: 'prerequisiti pre-base breve',
    nextDate: '22 Ottobre 2019',
    days: 3,
    videoUrl: 'https://www.youtube.com/embed/9iUMZA46_8k',
  ),
];
