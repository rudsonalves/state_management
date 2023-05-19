import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import '../models/person.dart';
import '../models/counter.dart';
import '../models/limited_counter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Counter _counter1 = Counter();
  final LimitedCounter _counter2 = LimitedCounter();
  final Person _person = Person();
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineMedium = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Flutter Demo Home Page'),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(
                SettingsPage.routeName,
                arguments: [_counter1, _counter2, _person],
              );
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
                    onPressed: _counter1.decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _counter1.$value,
                    builder: (context, value, _) {
                      return Text('$value', style: headlineMedium);
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: _counter1.increment,
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
                    onPressed: _counter2.decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _counter2.$value,
                    builder: (context, value, _) {
                      return Text('$value', style: headlineMedium);
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: _counter2.increment,
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
                        _person.name = name;
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
                        _person.surname = surname;
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
                        valueListenable: _person.$name,
                        builder: (context, name, _) {
                          return Text('Name: "$name"');
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: _person.$surname,
                        builder: (context, surname, _) {
                          return Text('Surname: "$surname"');
                        },
                      ),
                      AnimatedBuilder(
                        animation: Listenable.merge(
                          [_person.$name, _person.$surname],
                        ),
                        builder: (context, _) {
                          return Text('Full Name: "${_person.fullName}"');
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
