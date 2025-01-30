import 'dart:math';
import 'package:b_m_i/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double heighVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Body Mass Index',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    maleORfemale(context, 'Male'),
                    SizedBox(
                      width: 15,
                    ),
                    maleORfemale(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Column(
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heighVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Slider(
                        min: 55,
                        max: 272,
                        value: heighVal,
                        onChanged: (value) => setState(() => heighVal = value),
                        thumbColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    weightAndAge(context, 'Weight'),
                    SizedBox(
                      width: 15,
                    ),
                    weightAndAge(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 18,
              child: TextButton(
                onPressed: () {
                  double result = weight / pow(heighVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Result(result: result, age: age, isMale: isMale)),
                  );
                },
                child: Text('Calculate',
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded maleORfemale(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale ? isMale = false : isMale = true),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                  ? Theme.of(context).primaryColor
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'Male' ? Icons.male : Icons.female),
              const SizedBox(
                height: 20,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded weightAndAge(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              type == 'Weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.9),
                  heroTag: type == 'Weight' ? 'weight--' : 'age--',
                  onPressed: () =>
                      setState(() => type == 'Weight' ? weight-- : age--),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  mini: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.9),
                  heroTag: type == 'Weight' ? 'weight++' : 'age++',
                  onPressed: () =>
                      setState(() => type == 'Weight' ? weight++ : age++),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  mini: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
