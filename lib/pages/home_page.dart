import 'package:flutter/material.dart';

import '../providers/sql_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    counter = await SQLHelper.sql.getCounter();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$counter'),
            const Text('Push Ups'),
            FilledButton(
              onPressed: () async {
                setState(() {
                  counter++;
                });
                if (await SQLHelper.sql.counterExists()) {
                  await SQLHelper.sql.updateCounter(counter);
                } else {
                  SQLHelper.sql.createCounter();
                }
              },
              child: const Text('+'),
            ),
            FilledButton(
              onPressed: () async {
                setState(() {
                  counter--;
                });
                if (await SQLHelper.sql.counterExists()) {
                  await SQLHelper.sql.updateCounter(counter);
                } else {
                  SQLHelper.sql.createCounter();
                }
              },
              child: const Text('-'),
            ),
            FilledButton(
              onPressed: () async {
                setState(() {
                  counter = 0;
                });
                if (await SQLHelper.sql.counterExists()) {
                  await SQLHelper.sql.updateCounter(counter);
                } else {
                  SQLHelper.sql.createCounter();
                }
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
