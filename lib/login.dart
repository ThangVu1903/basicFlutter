import 'package:basic/signUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: const Color.fromARGB(156, 197, 161, 88),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Image.asset('asset/images/logo.png')),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            blurRadius: 2.0,
                            color: Colors.grey,
                            offset: Offset(2, 2))
                      ]),
                ),
              ),
              inputText(
                  'Email...',
                  const Icon(
                    Icons.email,
                    color: Color.fromRGBO(18, 84, 132, 0.612),
                  )),
              inputText(
                'Password...',
                const Icon(
                  Icons.key,
                  color: Color.fromRGBO(16, 75, 118, 0.612),
                ),
                const Icon(
                  Icons.remove_red_eye,
                  color: Color.fromRGBO(16, 75, 118, 0.612),
                ),
              ),
              InkWell(
                child: const Text(
                  'Fogot password ?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const signUp()));
                },
              ),
              Padding(
                //button login
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(16, 75, 118, 0.612),
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                      height: 55,
                      width: 340,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Log in ',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              size: 30,
                            ),
                          ]),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                    Text(
                      '   OR   ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "asset/icons/facebook.png",
                            )),
                        const Text(
                          "Login with facebook",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "asset/icons/google.png",
                            )),
                        const Text(
                          "Login with google",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

    inputText(String lable, Widget icon, [Widget? eye]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        elevation: 18,
        shadowColor: Colors.grey,
        child: TextField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(156, 232, 232, 232),
              prefixIcon: icon,
              suffixIcon: eye,
              border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
              label: Text(lable),
              labelStyle: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
