import 'package:blogapp/PermissionPage.dart';
import 'package:blogapp/Widgets/custom_button.dart';
import 'package:blogapp/Widgets/members_text_field.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Member"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add Sub-members",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Fill in the form below to add your members",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                MembersTextField(
                  label: "Name",
                  controller: _name,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                MembersTextField(
                  label: "Phone Number",
                  controller: _phone,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                MembersTextField(
                  label: "Email",
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final snackBar = SnackBar(
                        content: const Text("User added successfully"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomerPermissionPage(
                          name: _name.text,
                          email: _email.text,
                          phoneNumber: _phone.text,
                        ),
                      ));
                    }
                  },
                  label: "Add member",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
