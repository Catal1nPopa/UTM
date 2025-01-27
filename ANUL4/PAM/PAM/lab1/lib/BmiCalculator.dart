import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int weight = 70;
  int age = 23;
  double height = 0.0;
  String gender = 'Male';
  double bmi = 0.0;
  String bmiCategory = 'Underweight';

  void calculateBmi() {
    if (height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
        if (bmi < 18.5) {
          bmiCategory = 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          bmiCategory = 'Normal weight';
        } else if (bmi >= 25 && bmi < 29.9) {
          bmiCategory = 'Overweight';
        } else {
          bmiCategory = 'Obesity';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome😊",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'NotoColorEmoji'),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _genderButton('Male', gender == 'Male'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _genderButton('Female', gender == 'Female'),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: _inputCard('Weight', weight.toString(), () {
                  setState(() {
                    if (weight > 1) weight--;
                  });
                }, () {
                  setState(() {
                    weight++;
                  });
                })),
                const SizedBox(width: 10),
                Expanded(
                    child: _inputCard('Age', age.toString(), () {
                  setState(() {
                    if (age > 1) age--;
                  });
                }, () {
                  setState(() {
                    age++;
                  });
                })),
              ],
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Height",
                style: TextStyle(fontSize: 11, fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      height = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize:
                          min(MediaQuery.of(context).size.width * 0.2, 150),
                      color: const Color.fromARGB(255, 55, 86, 239),
                    ),
                  ),
                  Text(
                    bmiCategory,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize:
                          min(MediaQuery.of(context).size.width * 0.09, 50),
                      color: const Color.fromARGB(255, 55, 86, 239),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      calculateBmi();
                    },
                    label: const Text(
                      "Lets Go",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 86, 239),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderButton(String label, bool selected) {
    IconData genderIcon = label == "Male" ? Icons.male : Icons.female;

    return GestureDetector(
      onTap: () {
        setState(() {
          gender = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromARGB(255, 55, 86, 239)
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 55, 86, 239),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: selected
                    ? Colors.white
                    : const Color.fromARGB(255, 55, 86, 239),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputCard(String label, String value, VoidCallback onDecrease,
      VoidCallback onIncrease) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 150, 147, 147),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 21, 18, 18),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onDecrease,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 86, 239),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: onIncrease,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 86, 239),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
