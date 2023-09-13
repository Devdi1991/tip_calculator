import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 /*void main(){
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "My Tip Calculator",
      home: CalculatorFirstPage(),
    );
  }

}*/
class CalculatorFirstPage extends StatefulWidget {
  const CalculatorFirstPage({super.key});

  @override
  State<CalculatorFirstPage> createState() => _CalculatorFirstPageState();
}

class _CalculatorFirstPageState extends State<CalculatorFirstPage> {

  TextEditingController newcontroller=TextEditingController();
  int person=0;
  double billshare=0;//bill per person
  double billamount=0;// amount given by user
  double totalbill=0;// total tip+entered bill amount
  int tip_percent=0;// tip  percent selected by button
  double totaltip=0;//bill amount entered*tip percent
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset('assets/images/pngimg.com - hat_PNG5707.png'),
                    ),
                    SizedBox(width: 10,),
                    Column(children: [
                      Row(
                        children: [
                          Text('Mr',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text('TIP',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w900),)
                        ],
                      ),
                      Text('Calculator',style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.w900 ),)
                    ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                      ,color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 3
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Total p/person',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w900),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Rs ${billshare.toStringAsFixed(2)}",style: TextStyle(
                          fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                        ),

                      ),
                      Container(height: 1,color: Colors.black,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text('Total bill',style: TextStyle(color: Colors.black,fontSize: 20),),
                                  SizedBox(height: 5,),
                                  Text('${totalbill}',style: TextStyle(fontSize: 20,color: Colors.greenAccent),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SingleChildScrollView( child:Column(
                              children: [
                                Text('Total tip',style: TextStyle(color: Colors.black,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text('$totaltip',style: TextStyle(color: Colors.greenAccent,fontSize: 20),)
                              ],
                            ),
                          )
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Enter',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900),),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text('your bill',style: TextStyle(color: Colors.black,fontSize: 20),),
                          )
                        ],
                      ),
                      SizedBox(width: 60,),
                      Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 8
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: newcontroller,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Rs',
                                hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
                                border: InputBorder.none



                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text('Choose',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                          SizedBox(height: 10,),
                          Text('your tip',style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      SizedBox(width: 40,),
                      Row(
                        children: [
                          InkWell(
                            onTap:(){
                              tip_percent=10;
                              log('ontap pressed $tip_percent');
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              child: Center(child: Text('10%',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                tip_percent=15;
                                log("on tap presses $tip_percent");
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                child: Center(child: Text('15%',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.greenAccent,
                                ),

                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              tip_percent=20;
                              log("on tap pressed $tip_percent");
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              child: Center(child: Text('20%',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        billamount=double.parse(newcontroller.text.toString());
                        print('on tapped $billamount');

                        setState(() {
                          calculate();

                        });
                      },
                      child: Container(
                        height: 80,
                        width: 230,
                        child: Center(child: Text('Calculate tip',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(width: 30,),
                          Text('Split',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 30,),
                              Text('the total',style: TextStyle(fontSize: 20),),
                            ],
                          )
                        ],

                      ),
                      SizedBox(width: 35,),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            child: TextButton.icon(onPressed: (){

                              setState(() {
                                person++;
                              }
                              );
                              log('$person');

                            }, icon: Icon(Icons.add), label: Text('')),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                color: Colors.greenAccent

                            ),
                          ),
                          Container(
                            height: 70,
                            width: 100,
                            child: Center(child: Text('${person}',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w900),)),


                            decoration: BoxDecoration(

                                border: Border(top: BorderSide(width: 1,color: Colors.transparent),bottom: BorderSide(width: 1,color: Colors.transparent))

                            ),
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            child: TextButton.icon(onPressed: (){



                              setState(() {
                                person--;
                              });
                              log('$person');
                              log('person');
                            }, icon: Icon(Icons.minimize), label: Text('')),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                color: Colors.greenAccent

                            ),
                          ),

                        ],
                      )
                    ],
                  ),

                )




              ],
            ),
          ),
        )
        ),
      ),
    );
  }

  void calculate(){
    if(person==0){
tip_percent=0;
billamount=0;
totalbill=0;
totaltip=0;
  }else if(person==1){
      totaltip=(billamount*tip_percent)/100;
      totalbill=billamount+totaltip;
    }else if(person>1){
      totaltip=(billamount*tip_percent)/100;
      totalbill=billamount+totaltip;
      billshare=totalbill/person;


    }
  }

}