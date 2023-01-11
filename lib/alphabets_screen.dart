import 'package:flutter/material.dart';
import 'package:mobigic/grid_screen.dart';


class AlphabetsScreen extends StatelessWidget {
  final int m;
  final int n;

  const AlphabetsScreen({required this.m,required this.n});

  @override
  Widget build(BuildContext context) {
    List<String> alphabetsList = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabets'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter ${m*n} alphabets. (Use Space to separate)'),

              const SizedBox(height: 16),

              Flexible(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  onChanged: (String value){
                    alphabetsList = value.trim().split(' ');
                  },
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                  onPressed: () {
                    print('M : $m, N : $n, alphabetsList : $alphabetsList');

                    if (alphabetsList.length == m * n) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            GridScreen(
                                m: m, n: n, alphabetsList: alphabetsList)),);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Enter exact ${m * n} alphabets (with one space between two letter)')));
                    }
                  },
                  child: const Text('Build Grid'))
            ],
          ),
        ),
      ),
    );
  }
}

