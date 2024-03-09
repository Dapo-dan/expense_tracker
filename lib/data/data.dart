import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    "icon": const FaIcon(FontAwesomeIcons.burger),
    "color": Colors.yellow.shade700,
    "name": "Food",
    "totalAmount": "-\$ 45.00",
    "date": "Today",
  },
  {
    "icon": const FaIcon(FontAwesomeIcons.bagShopping),
    "color": Colors.purple,
    "name": "Shopping",
    "totalAmount": "-\$ 230.00",
    "date": "Today",
  },
  {
    "icon": const FaIcon(FontAwesomeIcons.heartCircleCheck),
    "color": Colors.green,
    "name": "Health",
    "totalAmount": "-\$ 79.00",
    "date": "Yesterday",
  },
  {
    "icon": const FaIcon(FontAwesomeIcons.plane),
    "color": Colors.blue,
    "name": "Travel",
    "totalAmount": "-\$ 350.00",
    "date": "Today",
  },
];
