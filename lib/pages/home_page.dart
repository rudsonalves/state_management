import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import '../models/person.dart';
import '../models/counter.dart';
import '../models/limited_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Counter _counter1 = Counter();
  final LimitedCounter _counter2 = LimitedCounter();
  final Person _person = Person();

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
                    onPressed: () {
                      setState(() {
                        _counter1.decrement();
                      });
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  Text('${_counter1.value}', style: headlineMedium),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _counter1.increment();
                      });
                    },
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
                    onPressed: () {
                      setState(() {
                        _counter2.decrement();
                      });
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Down'),
                  ),
                  Text('${_counter2.value}', style: headlineMedium),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _counter2.increment();
                      });
                    },
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
                        setState(() {
                          _person.name = name;
                        });
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
                        setState(() {
                          _person.surname = surname;
                        });
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
                      Text('Name: "${_person.name}"'),
                      Text('Surname: "${_person.surname}"'),
                      Text('Full Name: "${_person.fullName}"'),
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
