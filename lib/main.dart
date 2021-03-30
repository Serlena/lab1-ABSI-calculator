import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int newi = 0;
  String bmi;
  String result;
  //declare the inputController
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController wcController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('  A BODY SHAPE INDEX CALCULATOR ',
        style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sex : ',
              style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            Row(
              children: [
                radioButton("Male", Colors.blue[500], 0),
                radioButton("Female", Colors.pink[500], 1),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text("Your Age (years) : ", 
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Age in years",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                  ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                           Text("Your Height (cm) : ", 
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: heightController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Height in centimeter(cm)",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                  ),
                              ),
                            ),
                           SizedBox(
                              height: 20.0,
                            ),
                           Text("Your Weight (kg) : ", 
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: weightController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Weight in kilogram(kg)",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                  ),
                              ),
                            ), 
                            SizedBox(
                              height: 20.0,
                            ),
                           Text("Your Waist Circumstance (cm) : ", 
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: wcController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Waist Circumstance in centimeter(cm)",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                  ),
                              ),
                            ), 
                            SizedBox(
                              height:20.0,
                            ), 
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              child:FlatButton(
                                onPressed: () {
                                  double h = double.parse(heightController.value.text);
                                  double w = double.parse(weightController.value.text);
                                  double wc = double.parse(wcController.value.text);
                                  calculateAbsi(h, w, wc);
                                },
                                color:  Colors.amber,
                                child: Text("ABSI",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                                  ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: Text("Your ABSI score is :",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: Text('$result',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),
                    );
                  }

Void calculateAbsi(double h, double w,double wc){
  h = h/100;
  wc = wc/100;
  double bmi = w / (h*h);
  double finalresult = wc/ (pow(bmi,2/3) * pow(h,1/2));
  String absi = finalresult.toStringAsFixed(5);
  setState(() {
    result = absi;
  });
}

  void changeIndex(int i){
    setState(() {
      newi = i;
    });
  }
              
  radioButton(String v, Color c, int i) {
    return Expanded(
    child: Container(
      //add margins to the container
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      //add height
      height: 50.0,
      child: FlatButton(
        //change color of the button in function of it's selected or not
        color: newi == i ? c : Colors.grey[200],
        //add round border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          //when the button clicked the new index will have the button's index 
          changeIndex(i);
         },
         //modifications to the button text colour
          child:Text(
            v, 
            style: TextStyle(
              color: newi == i ? Colors.white : c, 
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ), 
        ),
      ), 
    );
  } 
}
