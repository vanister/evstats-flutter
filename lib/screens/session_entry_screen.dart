import 'package:flutter/material.dart';

import '../widgets/evs_app_bar.dart';
import '../widgets/session/session_entry_form.dart';

class SessionEntry extends StatefulWidget {
  const SessionEntry({super.key});

  @override
  State<SessionEntry> createState() => _SessionEntryState();
}

class _SessionEntryState extends State<SessionEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EvsAppBar(
        context: context,
        titleText: 'Session Entry',
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: SessionEntryForm(
          onSubmit: (session) {
            print('valid session was entered');
            print(session);
          },
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
