import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.sizeOf(context).width;

    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: currentWidth < 600 ? Colors.white : Colors.green,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("User name"),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    print(value);
                    if (nameController.text.isNotEmpty) {
                      return null;
                    } else {
                      return "enter a valid user name";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text("Password"),
                  ),
                  validator: (value) {
                    print(value);
                    if (value != null && value.isNotEmpty) {
                      if (value.length < 8) {
                        return "password should contain min 8 chars";
                      } else {
                        return null;
                      }
                    } else {
                      return "enter a valid password";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
