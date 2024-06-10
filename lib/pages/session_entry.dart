import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/date_util.dart';
import '../widgets/evs_app_bar.dart';

class SessionEntry extends StatefulWidget {
  const SessionEntry({super.key});

  @override
  State<SessionEntry> createState() => _SessionEntryState();
}

class _SessionEntryState extends State<SessionEntry> {
  final _now = DateTime.now();
  final _formkey = GlobalKey<FormState>();
  final _kwhController = TextEditingController();
  final _dateController = TextEditingController(text: getFormattedDate());

  int _selectedChargeLocation = 1;

  void _handleChargeLocationSelected(int? value) {
    _selectedChargeLocation = value!;
  }

  void _handleAddPress() {
    _formkey.currentState!.validate();
    print('selected location: $_selectedChargeLocation');
  }

  void _handleClearPress() {
    _formkey.currentState!.reset();
    _selectedChargeLocation = 1;
  }

  void _handlePickDatePress() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _now,
      firstDate: DateTime(_now.year),
      lastDate: DateTime(_now.year + 1),
    );

    if (selected == null) {
      return;
    }

    _dateController.text = getFormattedDate(date: selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EvsAppBar(
        context: context,
        titleText: 'Session Entry',
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
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
                controller: _kwhController,
                // this makes it required
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'kWh is required';
                  }

                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'YYYY-MM-DD',
                        labelText: 'Date *',
                      ),
                      keyboardType: TextInputType.datetime,
                      controller: _dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Date is required';
                        }

                        if (DateTime.tryParse(value) == null) {
                          return 'Invalid date';
                        }

                        return null;
                      },
                    ),
                  ),
                  // todo - move down to align with input
                  IconButton(
                    onPressed: _handlePickDatePress,
                    icon: const Icon(Icons.event),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.topLeft,
                child: DropdownMenu<int>(
                  width: 200,
                  label: const Text('Charge location'),
                  initialSelection: _selectedChargeLocation,
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: false,
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: 'Home'),
                    DropdownMenuEntry(value: 2, label: 'Work'),
                    DropdownMenuEntry(value: 3, label: 'Other'),
                    DropdownMenuEntry(value: 4, label: 'DC'),
                  ],
                  onSelected: _handleChargeLocationSelected,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleAddPress,
                        child: const Text('Add'),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleClearPress,
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
