import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const EMI());
}

class EMI extends StatefulWidget {
  const EMI({super.key});

  @override
  State<EMI> createState() => _EMIState();
}

double emi = 0;
double loan = 100000;
double interest = 1;
double tenure = 24;

class _EMIState extends State<EMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        backgroundColor: const Color(0xff265073),
        appBar: AppBar(
          backgroundColor: const Color(0xff265073),
          title: const Text(
            'EMI Calculator',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: const Icon(Icons.grid_view_outlined,
              color: Colors.white, size: 25),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'Your Loan EMI is',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\u{20B9} ${emi.toStringAsFixed(2)}',
                      style:
                          const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ' month',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Loan Amount',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${loan.toStringAsFixed(0)}',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Slider(
                            min: 5000,
                            max: 200000,
                            divisions: 100,
                            value: loan,
                            activeColor: const Color(0xff265073),
                            onChanged: (value) {
                              loan = value;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Interest Rate',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${interest.toStringAsFixed(0)}%',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Slider(
                            value: interest,
                            min: 1,
                            max: 100,
                            divisions: 100,
                            activeColor: const Color(0xff265073),
                            onChanged: (value) {
                              interest = value;
                              setState(() {

                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Loan Tenure',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${tenure.toStringAsFixed(0)} months',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Slider(
                            value: tenure,
                            min: 6,
                            max: 120,
                            divisions: 60,
                            activeColor: const Color(0xff265073),
                            onChanged: (value) {
                              tenure = value;
                              setState(() {

                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff265073),
                          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          emi = Emi_calcy(loan, interest, tenure);
                          setState(() {

                          });
                        },
                        child: const Text(
                          'Calculate',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double Emi_calcy(double p, double r, double t) {
  double emi;
  r = r / 100 / 12;
  emi = ((p * r * pow(1 + r, t)) / (pow(1 + r, t) - 1));
  return (emi);
}
