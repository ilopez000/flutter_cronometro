import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronómetro Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CronometroPage(),
    );
  }
}

class CronometroPage extends StatefulWidget {
  @override
  _CronometroPageState createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _time = 0;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronómetro Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tiempo: $_time',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  child: Text('Iniciar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _stopTimer : null,
                  child: Text('Detener'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
