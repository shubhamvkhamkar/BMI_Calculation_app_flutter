import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();

  var ftController = TextEditingController();

  var inController = TextEditingController();

  var result = "";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Center(child: Text('BMI App')),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
               Color(0xfffccb90),Color(0xffd57eeb)
              ],
              center: Alignment.bottomCenter
            )
          ),
          child: Center(
            child: Container(

              width: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI ',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21)),
                        label: Text('Enter Your weight (in Kgs)'),
                        prefixIcon: Icon(
                          Icons.line_weight, color: Colors.orange
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: ftController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),),
                          label: Text('Enter your height(in Feet)'),
                          prefixIcon: Icon(Icons.height, color: Colors.orange)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: inController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21)),
                          label: Text('Enter your Height(in inches)'),
                          prefixIcon: Icon(Icons.height, color: Colors.orange,)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,

                          color: Colors.orange
                        )
                      ),
                      onPressed: () {

                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inc = inController.text.toString();

                      if(wt!= "" && ft!="" && inc!= ""){

                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inc);

                        var tInch = (iFt*12) + iInch;

                        var tCm  = tInch*2.54;

                        var tM = tCm/100;

                        var bmi = iWt/(tM*tM);

                        var msg = '';
                        if(bmi>25){
                         msg = 'You are OverWeight';
                         bgColor = Colors.orange;
                        } else if(bmi<18){
                          msg = 'You are UnderWeight';
                          bgColor = Colors.red;
                        } else{
                          msg = 'You are Healthy';
                          bgColor = Colors.pink;
                        }

                        setState(() {
                          result = " $msg \n your BMI is: ${bmi.toStringAsFixed(2)}";
                        });


                        //BMI Calculation
                      } else{
                         setState(() {
                           result = " Please filled all required blanks!!! ";
                         });
                      }
                    },
                        child: Text('Evaluate' ,style: TextStyle(color: Colors.orange),),

                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(result,style: TextStyle(fontSize: 19),)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
