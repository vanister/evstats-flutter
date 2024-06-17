import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/session.dart';
import 'session_validators.dart';
import '../../utilities/date_util.dart';

class SessionEntryForm extends StatefulWidget {
  /// Raised when a valid session entry has been made in the form and the
  /// `Add` button is clicked.
  final Function(Session) onSubmit;

  /// Raised when the clear button is clicked.
  final Function()? onClear;

  // todo - take in onClearPress and onAddPress
  const SessionEntryForm({super.key, required this.onSubmit, this.onClear});

  @override
  State<SessionEntryForm> createState() => _SessionEntryFormState();
}

class _SessionEntryFormState extends State<SessionEntryForm> {
  final _now = DateTime.now();
  final _formkey = GlobalKey<FormState>();
  final _kwhController = TextEditingController();
  final _dateController = TextEditingController(text: getFormattedDate());

  // this is the rateId, 1 is Home
  int _selectedChargeLocation = 1;

  void _handleChargeLocationSelected(int? value) {
    _selectedChargeLocation = value!;
  }

  void _handleAddPress() {
    if (!_formkey.currentState!.validate()) {
      // show an error message?
      // do do anything
      return;
    }

    // todo - make a helper that can be injected
    var session = Session(
      rateId: _selectedChargeLocation,
      kWh: int.parse(_kwhController.text),
      date: DateTime.parse(
        _dateController.text,
      ),
    );

    widget.onSubmit(session);
  }

  void _handleClearPress() {
    _formkey.currentState!.reset();
    _selectedChargeLocation = 1;

    // raise for others to know
    if (widget.onClear != null) {
      widget.onClear!();
    }
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
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'kWh added *',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 3,
            controller: _kwhController,
            // this makes it required
            validator: validateKwhField,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'YYYY-MM-DD',
                    labelText: 'Date *',
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: _dateController,
                  validator: validateDateField,
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
    );
  }
}
