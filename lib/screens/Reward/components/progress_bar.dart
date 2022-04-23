import 'package:flutter/material.dart';

class CircularProgressIndicatorApp extends StatefulWidget {
  const CircularProgressIndicatorApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CircularProgressIndicatorAppState();
  }
}

class CircularProgressIndicatorAppState extends State<CircularProgressIndicatorApp>{
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _progressValue = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/reward.png", height: 200,),
              const SizedBox(height: 20),
              Text('${200-(_progressValue).toInt()} points until your next free drink'),
              const SizedBox(height: 50),
              SizedBox(
                height: 320.0,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 20,
                          backgroundColor: const Color(0xff42C2FF),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFF6FB5)),
                          value: _progressValue/200,
                        ),
                        height: 320.0,
                        width: 320.0,
                      ),
                    ),
                    const Center(child: Text("Earn 2 point for every \$1 spent")),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        child: const Icon(Icons.cloud_download),
      ),
    );
  }
  // this function updates the progress value
  void _updateProgress() {
    _progressValue += 2;
    // we "finish" count here
    if (_progressValue == 200) {
      _progressValue = 0;
      return;
    }
  }
}