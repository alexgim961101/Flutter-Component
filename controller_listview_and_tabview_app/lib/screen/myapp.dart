import 'package:flutter/material.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  int _selectedIndex = 0;
  final List<String> _tabs = ["Tab1", "Tab2", "Tab3", "Tab4", "Tab5"];

  void _changeTab(int index) {
    setState(() {
      if (index < 0) {
        _selectedIndex = _tabs.length - 1;
      } else if (index >= _tabs.length) {
        _selectedIndex = 0;
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Controller Tab and View"),),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 200,
                    child: ListView.builder(
                      itemCount: _tabs.length,
                      itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_tabs[index]),
                        selected: index == _selectedIndex,
                        selectedTileColor: Colors.blueAccent,
                        onTap: () {
                          _changeTab(index);
                        },
                      );
                    }),
                  ),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    child: Text(_tabs[_selectedIndex]),
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, child: IconButton(onPressed: () { _changeTab(_selectedIndex - 1); }, icon: Icon(Icons.arrow_left))),
                SizedBox(width: 30,),
                Container(width: 50, height: 50, child: IconButton(onPressed: () { _changeTab(_selectedIndex + 1); }, icon: Icon(Icons.arrow_right)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}