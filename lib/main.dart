import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

//後で変数名を変更する
TextEditingController left_EditingController = TextEditingController();
TextEditingController right_EditingController = TextEditingController();

double _result = 0;
double a = 0;
double b = 0;


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo Home Page',
          style: TextStyle(
              color: Color(0xffeeeeee),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 20, top: 80, bottom: 80),
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    child: TextField(
                      controller: left_EditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (left_EditingController) {
                        setState(() {
                          a = double.tryParse(left_EditingController) ?? 0;
                        });
                      },
                    )),
                const SizedBox(
                  width: 50,
                ),
                Flexible(
                    flex: 3,
                    child: TextField(
                      controller: right_EditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (right_EditingController) {
                        setState(() {
                          b = double.tryParse(right_EditingController) ?? 0;
                        });
                      },
                    )),
                const SizedBox(
                  width: 50,
                ),
                Flexible(flex: 3, child: Text('結果 : $_result'))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = a + b;
                  });
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)),
                    shape:
                        MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                    child: const Text('＋', style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = a - b;
                  });
                },
                style: ButtonStyle(
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)),
                    shape:
                    MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                child: const Text('-', style: TextStyle(color: Colors.white),),
              ),
               ElevatedButton(
                  onPressed: () {
                    setState(() {
                       _result = a * b;
                    });
                  },
                  style: ButtonStyle(
                     padding:
                  MaterialStateProperty.all(const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)),
                  shape:
                  MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
               child: const Text('×', style: TextStyle(color: Colors.white),),
               ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = a / b;
                  });
                },
                style: ButtonStyle(
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)),
                    shape:
                    MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                child: const Text('÷', style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
