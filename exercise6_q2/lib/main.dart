import 'package:exercise6_q2/string_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TextCapitalizer(),
        child: MyHomePage(title: 'BLoC Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: 
              TextField(
                controller: _textValue,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input words to convert into capitalized version'),
              ),
            ),

          ElevatedButton(
              onPressed: () => {
                // print(_textValue.text.toUpperCase()), 
                context.read<TextCapitalizer>().sizeIncrement(_textValue.text)
              },
              child: Text('Convert A Message')
            ),

          Container(
              padding: EdgeInsets.only(top: 10),
              child: 
                BlocBuilder<TextCapitalizer,String>(
                  builder: (context, state){
                    return Text('Converted Message: $state',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold));
                  }
                ),
            ),
          ],
        ),
      ),

      /*loatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.incrementCount(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
