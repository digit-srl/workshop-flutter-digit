import 'package:flutter_web/material.dart';

class Power {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  Power({this.title, this.description, this.icon, this.color});
}

final finalPowers = [
  Power(
//      title: '💪',
      icon: Icons.build,
      color: Colors.grey,
      description: 'Creare APP native per iOS e Android con un unico progetto'),
  Power(
//      title: '😱',
      icon: Icons.desktop_mac,
      color: Colors.indigo,
      description: 'Sviluppare APP Web e Desktop'),
  Power(
//      title: '🤑',
      icon: Icons.monetization_on,
      color: Colors.green,
      description: 'Cercare un posto come sviluppatore Flutter'),
  Power(
//      title: '🥳',
      icon: Icons.stars,
      color: Colors.yellow,
      description: 'Realizzare ciò che fin\'ora potevi solo immaginare'),
];

final coursePower = [
  Power(icon: Icons.check_circle, color: Colors.green, description: 'Flutter'),
  Power(
      icon: Icons.check_circle,
      color: Colors.green,
      description: 'Assistenza Post Corso'),
  Power(
      icon: Icons.check_circle,
      color: Colors.green,
      description: 'Flutter mini-packs'),
  Power(
      icon: Icons.check_circle,
      color: Colors.green,
      description: 'Caffè gratuito'),
];
