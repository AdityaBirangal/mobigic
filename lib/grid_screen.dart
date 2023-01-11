import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  final int m;
  final int n;
  List<String> alphabetsList;
  GridScreen({required this.m, required this.n, required this.alphabetsList});
  List<String> textList = [];
  List<bool> isPresentInList = List.filled(100, false);
  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {

    print('start isPresentInList : ${widget.isPresentInList}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('Scroll down to see more element of grid'),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: widget.m,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(widget.m*widget.n, (index) {
                  return Center(
                    child: Text(
                      widget.alphabetsList[index],
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: widget.isPresentInList[index] ? FontWeight.bold : FontWeight.normal,
                          color: widget.isPresentInList[index] ? Colors.red : Colors.black),
                    ),
                  );
                }),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a text to search in grid',
              ),
              keyboardType: TextInputType.text,
              onChanged: (String value){
                widget.textList = value.trim().split('');
                print('textList : ${widget.textList}');
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                   child: const Text('Reset')),
              ElevatedButton(
                  onPressed: (){
                    for(int i = 0; i < widget.alphabetsList.length; i++){
                      widget.isPresentInList[i] = widget.textList.contains(widget.alphabetsList[i]);
                    }
                    print('isPresentInList : $widget.isPresentInList');
                    setState(() {});
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: const Text('Search')),

            ],
          )
        ],
      ),
    );
  }
}


