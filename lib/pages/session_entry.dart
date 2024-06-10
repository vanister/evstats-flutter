import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/evs_app_bar.dart';

class SessionEntry extends StatefulWidget {
  const SessionEntry({super.key});

  @override
  State<SessionEntry> createState() => _SessionEntryState();
}

class _SessionEntryState extends State<SessionEntry> {
  int selectedChargeLocation = 1;

  // utilities
  _getTodaysDate() {
    final now = DateTime.now();
    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');

    final formatted = '$month/$day/$year';

    return formatted;
  }

  void _handleOnChargeLocationSelected(int? value) {
    setState(() {
      selectedChargeLocation = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeContext = Theme.of(context);

    return Scaffold(
      appBar: EvsAppBar(
        context: context,
        titleText: 'Session Entry',
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "kWh added *",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                // this makes it required
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'kWh is required';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: _getTodaysDate(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.topLeft,
                child: DropdownMenu<int>(
                  width: 200,
                  label: const Text('Charge location'),
                  initialSelection: selectedChargeLocation,
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: false,
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: 'Home'),
                    DropdownMenuEntry(value: 2, label: 'Work'),
                    DropdownMenuEntry(value: 3, label: 'Other'),
                    DropdownMenuEntry(value: 4, label: 'DC'),
                  ],
                  onSelected: _handleOnChargeLocationSelected,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {/** noop */},
                      child: const Text('Add'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {/** noop */},
                        child: const Text('Clear'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New entry',
        onPressed: () {
          /** noop */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
