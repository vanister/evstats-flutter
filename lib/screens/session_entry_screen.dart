import 'package:flutter/material.dart';

import '../models/rate_type.dart';
import '../models/session.dart';
import '../services/log_service.dart';
import '../services/rate_service.dart';
import '../services/service_locator.dart';
import '../services/session_service.dart';
import '../widgets/evs_app_bar.dart';
import '../widgets/session/date_picker_range.dart';
import '../widgets/session/session_entry_form.dart';

class SessionEntry extends StatefulWidget {
  const SessionEntry({super.key});

  @override
  State<SessionEntry> createState() => _SessionEntryState();
}

class _SessionEntryState extends State<SessionEntry> {
  late final SessionService _sessionService;
  late final RateService _rateService;
  late final LogService _logService;

  late final Iterable<RateType> _rateTypes;
  late final DatePickerRange _datePickerRange;

  _SessionEntryState(
      {SessionService? sessionService,
      RateService? rateService,
      LogService? logService}) {
    _sessionService = sessionService ?? ServiceLocator.get<SessionService>();
    _rateService = rateService ?? ServiceLocator.get<RateService>();
    _logService = logService ?? ServiceLocator.get<LogService>();
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
          onSubmit: (entry) async {
            _logService.log('successfully submitted session form');

            var session = Session.fromFormEntry(entry);
            var addedSession = await _sessionService.add(session);

            _logService.log('saved session to db with id: ${addedSession.id}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Session',
        onPressed: () {
          /** noop */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
