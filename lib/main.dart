import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form EMAIL',
      home: Scaffold(
        appBar: AppBar(
          title: Text('email dan password'),
        ),
        body: FormScreen(),
      ),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'email tidak boleh kosong';
                }
                if (!value.contains('@gmail.com')) {
                  return 'tambahkan @gmail.com';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password tidak boleh kososng';
                }

                if (value.length < 6) {
                  return ' password harus lebih dari 6';
                }

                return null;
              },
            ),
            SizedBox(
              height: 20,
              width: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('form sudah benar!')),
                    );
                  }
                },
                child: Text('tambah')),
          ],
        ),
      ),
    );
  }
}
