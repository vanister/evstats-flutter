import 'package:flutter/material.dart';

import '../models/db/rate_type.dart';
import '../models/db/session.dart';
import '../services/log_service.dart';
import '../services/rate_service.dart';
import '../services/service_locator.dart';
import '../services/session_service.dart';
import '../widgets/evs_app_bar.dart';
import '../widgets/floating_add_button.dart';
import '../models/date_picker_range.dart';
import '../widgets/session/session_entry_form.dart';
import '../models/session_form_model.dart';

class SessionEntryScreen extends StatefulWidget {
  const SessionEntryScreen({super.key});

  @override
  State<SessionEntryScreen> createState() => _SessionEntryScreenState();
}

class _SessionEntryScreenState extends State<SessionEntryScreen> {
  late final SessionService _sessionService;
  late final RateService _rateService;
  late final LogService _logService;

  late final Iterable<RateType> _rateTypes;
  late final DatePickerRange _datePickerRange;

  _SessionEntryScreenState({
    SessionService? sessionService,
    RateService? rateService,
    LogService? logService,
  }) {
    _sessionService = sessionService ?? ServiceLocator.get<SessionService>();
    _rateService = rateService ?? ServiceLocator.get<RateService>();
    _logService = logService ?? ServiceLocator.get<LogService>();
  }

  void handleFormSubmit(SessionForm entry) async {
    _logService.log('handle session form submit');
    // todo - try/catch
    var session = Session.fromFormEntry(entry);
    var addedSession = await _sessionService.insert(session);

    _logService.log('saved session to db with id: ${addedSession.id}');
  }

  void handleNewSessionPressed() {
    // todo
  }

  @override
  void initState() {
    super.initState();

    var now = DateTime.now();

    _datePickerRange = DatePickerRange(
      initial: now,
      start: DateTime(now.year),
      end: DateTime(now.year + 1),
    );

    _rateTypes = _rateService.getRateTypes();
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
        child: SessionEntryForm(
          rateTypes: _rateTypes,
          datePickerRange: _datePickerRange,
          onSubmit: handleFormSubmit,
        ),
      ),
      floatingActionButton: FloatingAddButton(
        tooltip: 'Add Session',
        onPressed: handleNewSessionPressed,
      ),
    );
  }
}
