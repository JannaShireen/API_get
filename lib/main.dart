import 'package:flutter/material.dart';
import 'package:webservices/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}

class ScreenHome extends StatefulWidget {
   ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
final _numberInputController = TextEditingController();

String _resultText= 'Type number and press Get Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _numberInputController,
                keyboardType: TextInputType.number,
                
                decoration: InputDecoration(
                
                border: OutlineInputBorder(),
                hintText: 'Enter a number'
              ) ,),
              ElevatedButton(onPressed: ()async{
                final _number= _numberInputController.text;
                final _result= await getNumberFact(number: _number);
                print(_result.triviaText);
                setState(() {
                  _resultText=_result.triviaText??'No trivia text found';
                });
              },
               child: Text('Get Result')),
               Text(_resultText),
            ],
          ),
        ),
      ),
    );
  }
}


