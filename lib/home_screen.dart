import 'package:flutter/material.dart';

import 'alphabets_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int m = 0;
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobigic Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/mobigic_logo.png'),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter value of M',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value){
                  m = int.parse(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter value of N',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value){
                  n = int.parse(value);
                },
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  print('M $m, N $n');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlphabetsScreen(m: m,n: n)),
                  );
                }, child: const Text('Next')),

            const SizedBox(height: 16),

            Text('Developed by Aditya Birangal',style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
