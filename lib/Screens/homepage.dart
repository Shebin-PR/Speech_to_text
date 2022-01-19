import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hope/Model/translatelanguage.dart';
import 'package:hope/Screens/sppechapi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "";
  bool isListening = false;

  // final menu = Translations().languages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// APPBAR ------------------------------------------------------------>
        ///

        appBar: AppBar(
          title: const Text(
            "Voice recognition",
            style: TextStyle(letterSpacing: 1),
          ),
          centerTitle: true,
        ),

        /// BODY STARTS ------------------------------------------------------->
        ///
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                if (isListening == true)
                  Column(
                    children: [
                      Text(text),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButton<String>(
                        items: Translations.languages.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text("Select Language"),
                        onChanged: (_) {
                          // TranslationWidget(
                          //     text: text,
                          //     fromlanguage: "en",
                          //     tolanguage: value);
                        },
                      ),
                    ],
                  )
                else
                  const Text(
                    "Press mic to start speaking",
                    style: TextStyle(fontSize: 25),
                  )
              ],
            ),
          ),
        ),

        /// FLOATING ACTION BUTTON -------------------------------------------->
        ///

        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 100,
          glowColor: Colors.deepPurple,
          child: FloatingActionButton(
            onPressed: toggleRecording,
            child: Icon(isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        /// ------------------------------------------------------------------->
        ///
      ),
    );
  }

  toggleRecording() => SpeechApi().toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() {
            this.isListening = isListening;
          });
        },
      );
}
