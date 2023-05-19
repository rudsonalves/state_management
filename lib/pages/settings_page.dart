import 'package:flutter/material.dart';

import '../models/counter.dart';
import '../models/limited_counter.dart';
import '../models/person.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Object> list =
        ModalRoute.of(context)!.settings.arguments as List<Object>;

    final Counter counter1 = list[0] as Counter;
    final LimitedCounter counter2 = list[1] as LimitedCounter;
    final Person person = list[2] as Person;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text('Reset Counter 1: ${counter1.value}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter1.reset();
                    });
                  },
                  icon: Icon(counter1.value != 0
                      ? Icons.radio_button_unchecked_sharp
                      : Icons.check),
                ),
              ],
            ),
            Row(
              children: [
                Text('Reset Counter 2: ${counter2.value}'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter2.reset();
                    });
                  },
                  icon: Icon(counter2.value != 0
                      ? Icons.radio_button_unchecked_sharp
                      : Icons.check),
                ),
              ],
            ),
            Row(
              children: [
                Text('Clear Name: "${person.name}"'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      person.name = '';
                    });
                  },
                  icon: Icon(
                    person.name.isNotEmpty
                        ? Icons.radio_button_unchecked_sharp
                        : Icons.check,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Clear Surname: "${person.surname}"'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      person.surname = '';
                    });
                  },
                  icon: Icon(
                    person.surname.isNotEmpty
                        ? Icons.radio_button_unchecked_sharp
                        : Icons.check,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
