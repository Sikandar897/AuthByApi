
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   Future<void> login(String email , password) async {
    try
    {
        Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email' : email,
            'password' : password
          }
        );
        if(response.statusCode == 200){
          // ignore: avoid_print
          print('account successfully created');
        }
        else{
          // ignore: avoid_print
          print('failed');
        }
    }
    catch(e) {
        // ignore: avoid_print
        print(e.toString());  //printing execption if error it will through an exception
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Login Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(21))),
                    //focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                    label: Text('Email'),
                    hintText: 'Enter Your Email'),
              ),
              const SizedBox(
                height: 21,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  label: Text('Password'),
                  hintText: 'Enter Your Password',
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {
                    login(emailController.text.toString(), passwordController.text.toString());
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStatePropertyAll(Colors.deepPurple.shade100),
                    backgroundColor: const MaterialStatePropertyAll(Colors.deepPurple), 
                    overlayColor: MaterialStatePropertyAll(Colors.deepPurple.shade400), 
                    elevation: const MaterialStatePropertyAll(21), 
                  ),
                  child: const Text('login', style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}
