import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//variables
  int selectedGender = 0, height = 170, age = 23, weight = 65;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
      ),
      body: _builtUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bmi = weight / pow(height / 100, 2);
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }

  Widget _builtUI() {
    return Column(
      children: [
        genderSelector(),
        heightInput(),
        weightAndAgeInput(),
        bmiResult()
      ],
    );
  }

  Widget genderSelector() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  },
                  icon: Icon(
                    Icons.male,
                    color: selectedGender == 0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  )),
              Text(
                "Male",
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  },
                  icon: Icon(
                    Icons.female,
                    color: selectedGender == 1
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  )),
              Text(
                "Female",
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget heightInput() {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Text("Height",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Slider(
                min: 0,
                max: 300,
                divisions: 300,
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                }),
            Text(
              "$height cm",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ));
  }

  Widget weightAndAgeInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [weightInput(), ageInput()],
    );
  }

  Widget weightInput() {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              "Weight",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ItemCount(
                buttonSizeHeight: 30,
                buttonSizeWidth: 60,
                initialValue: weight,
                minValue: 50,
                maxValue: 350,
                onChanged: (value) {
                  setState(() {
                    weight = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget ageInput() {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              "Age",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ItemCount(
                buttonSizeHeight: 30,
                buttonSizeWidth: 60,
                initialValue: age,
                minValue: 1,
                maxValue: 100,
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget bmiResult() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text(
        "BMI: ${bmi.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
