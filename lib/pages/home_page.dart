import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/settings_page.dart';
import '../models/person.dart';
import '../models/counter.dart';
import '../models/limited_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineMedium = Theme.of(context).textTheme.headlineMedium;
    final Counter counter1 = Provider.of<Counter>(context);
    final LimitedCounter counter2 = Provider.of<LimitedCounter>(context);
    final Person person = Provider.of<Person>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Flutter Demo Home Page'),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter 1:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: counter1.decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  ValueListenableBuilder(
                    valueListenable: counter1.$value,
                    builder: (context, value, _) {
                      return Text('$value', style: headlineMedium);
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: counter1.increment,
                    icon: const Icon(Icons.add),
                    label: const Text('Up'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Counter 2:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: counter2.decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  ValueListenableBuilder(
                    valueListenable: counter2.$value,
                    builder: (context, value, _) {
                      return Text('$value', style: headlineMedium);
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: counter2.increment,
                    icon: const Icon(Icons.add),
                    label: const Text('Up'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (name) {
                        person.name = name;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      onChanged: (surname) {
                        person.surname = surname;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Surname',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: person.$name,
                        builder: (context, name, _) {
                          return Text('Name: "$name"');
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: person.$surname,
                        builder: (context, surname, _) {
                          return Text('Surname: "$surname"');
                        },
                      ),
                      AnimatedBuilder(
                        animation: Listenable.merge(
                          [person.$name, person.$surname],
                        ),
                        builder: (context, _) {
                          return Text('Full Name: "${person.fullName}"');
                        },
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
