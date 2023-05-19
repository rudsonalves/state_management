import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/counter.dart';
import '../models/limited_counter.dart';
import '../models/person.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter counter1 = Provider.of<Counter>(context);
    final LimitedCounter counter2 = Provider.of<LimitedCounter>(context);
    final Person person = Provider.of<Person>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: counter1.$value,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Text('Reset Counter 1: $value'),
                    IconButton(
                      onPressed: counter1.reset,
                      icon: Icon(counter1.value != 0
                          ? Icons.radio_button_unchecked_sharp
                          : Icons.check),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: counter2.$value,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Text('Reset Counter 2: $value'),
                    IconButton(
                      onPressed: counter2.reset,
                      icon: Icon(counter2.value != 0
                          ? Icons.radio_button_unchecked_sharp
                          : Icons.check),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: person.$name,
              builder: (context, name, _) {
                return Row(
                  children: [
                    Text('Clear Name: "$name"'),
                    IconButton(
                      onPressed: () => person.name = '',
                      icon: Icon(
                        person.name.isNotEmpty
                            ? Icons.radio_button_unchecked_sharp
                            : Icons.check,
                      ),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: person.$surname,
              builder: (context, surname, _) {
                return Row(
                  children: [
                    Text('Clear Surname: "$surname"'),
                    IconButton(
                      onPressed: () => person.surname = '',
                      icon: Icon(
                        person.surname.isNotEmpty
                            ? Icons.radio_button_unchecked_sharp
                            : Icons.check,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
