import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'csci410 sample midterm',
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _speedController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    super.dispose();
    _speedController.dispose();
    _timeController.dispose();
  }

  void updateDistance() {
    try {
      int speed = int.parse(_speedController.text);
      int time = int.parse(_timeController.text);
      double distance = speed *
          (time / 60); // convert tome from minutes to hours
      _result = 'Distance (km): ${distance.toStringAsFixed(
          2)}'; // limit precision to 2 decimal places
    }
    catch (e) {
      _result = 'Please fill all fields';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Distance'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 10),
        SizedBox(width: 230, height: 60, child: TextField(
          controller: _speedController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter speed km/h'),
        )),
        SizedBox(width: 230, height: 60, child: TextField(
          controller: _timeController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter time in minutes'),
        )),
        ElevatedButton(onPressed: () => setState(() {
          updateDistance();
        }), child: const Icon(Icons.calculate, size: 50,)),
        Text(_result, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
      ])),
    );
  }
}
