// import 'package:flutter/material.dart';
// import 'package:hope/Controller/controller.dart';
// import 'package:hope/Model/translatelanguage.dart';

// class TranslationWidget extends StatefulWidget {
//   final String text;
//   final String fromlanguage;
//   final String tolanguage;

//   const TranslationWidget({
//     required this.text,
//     required this.fromlanguage,
//     required this.tolanguage,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _TranslationWidgetState createState() => _TranslationWidgetState();
// }

// class _TranslationWidgetState extends State<TranslationWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final tolanguagecode = Translations().getLanguageCode;
//     return FutureBuilder(
//       future: TranslateApi.translate(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         return Container();
//       },
//     );
//   }
// }
