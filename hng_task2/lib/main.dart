import 'package:flutter/material.dart';
import 'package:hng_task2/display_screen.dart';
import 'package:hng_task2/edit_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HNG Track',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter HNG Track'),
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
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _trackController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextField(
                  controller: _nameController,
                  hintText: 'name',
                  label: 'Enter name',
                ),
                CustomTextField(
                  controller: _phoneController,
                  label: 'Enter Phone',
                  hintText: '07xxxxxxxx',
                ),
                CustomTextField(
                  controller: _emailController,
                  label: 'Enter Email',
                  hintText: 'email@gmail.com',
                ),
                CustomTextField(
                  controller: _trackController,
                  label: 'HNG Track',
                  hintText: 'Flutter track',
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OutlinedButton(
                      child: Text(
                        'Submit',
                        
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DisplayScreen(
                              name: _nameController.text,
                              track: _trackController.text,
                            );
                          }));
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
