import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey,
        )
      ),
      themeMode: ThemeMode.system,
      home: DarkModeSwitch(
        isDarkMode: isDarkMode,
        onChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}

class DarkModeSwitch extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  DarkModeSwitch({
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ex 2 Dark - Light'),
        actions: <Widget>[
          Switch(value: isDarkMode, onChanged: onChanged),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _showImageDialog(context,'img.png');
                    },
                    child: const Text('Fail In Love',style: TextStyle(fontFamily: 'Patrick_Hand',fontSize: 24),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 10,
                  ),
                ),

                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _showImageDialog(context,'chi.jpg');
                    },
                    child: Text('Girl Xinh',style: TextStyle(fontFamily: 'Patrick_Hand',fontSize: 24)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 10,
                  ),
                )

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _showImageDialog(context, 'chi.jpg');
                  },
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkMode ? Colors.white : Colors.blue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 150,height: 264,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/img.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          right: 35,left: 35,bottom: 20,
                          child: Container(
                            width: 80,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text("Love is beautiful",style: TextStyle(fontSize: 12,fontFamily: 'Patrick_Hand',color: Colors.black),),
                                Text("But also painful",style: TextStyle(fontSize: 12,fontFamily: 'Patrick_Hand',color: Colors.red),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    _showImageDialog(context, 'chi.jpg');
                  },
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkMode ? Colors.white : Colors.blue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 150,height: 264,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/chi.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          right: 35,left: 35,bottom: 20,
                          child: Container(
                            width: 80,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text("Love is beautiful",style: TextStyle(fontSize: 12,fontFamily: 'Patrick_Hand',color: Colors.black),),
                                Text("But also painful",style: TextStyle(fontSize: 12,fontFamily: 'Patrick_Hand',color: Colors.red),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context,String img) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Valentine'),
          content: Container(
              child: Image.asset('assets/$img',fit: BoxFit.contain,),
              width: 300.0,
              height: 450.0,
          ),

          actions: <Widget>[
            TextButton(
              child: Text('Đóng',style: TextStyle(color: Colors.lightGreen)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}