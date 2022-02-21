// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_twilio_examples/counter/counter.dart';
import 'package:flutter_twilio_examples/l10n/l10n.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const TwilioPage(),
    );
  }
}

class TwilioPage extends StatefulWidget {
  const TwilioPage({Key? key}) : super(key: key);

  @override
  State<TwilioPage> createState() => _TwilioPageState();
}

class _TwilioPageState extends State<TwilioPage> {
  late TwilioFlutter twilioSendSms;
  late TwilioFlutter twilioSendWsp;

  @override
  void initState() {
    twilioSendSms = TwilioFlutter(
      accountSid: '-AC7343bf1a667dd7be216a349cc50c7e93',
      authToken: '-e211af0e9f718e43cc3ba4d66948a6f6',
      twilioNumber: '+19036368506',
    );

    twilioSendWsp = TwilioFlutter(
      accountSid: '-AC7343bf1a667dd7be216a349cc50c7e93',
      authToken: '-e211af0e9f718e43cc3ba4d66948a6f6',
      twilioNumber: '+14155238886',
    );

    super.initState();
  }

  Future<void> sendSms() async {
    await twilioSendSms.sendSMS(
      toNumber: '+51923873749',
      messageBody: 'Hola, buen día',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usando Twilio'),
      ),
      body: const Center(
        child: Text(
          'Click the button to send SMS.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: const Icon(Icons.send),
      ),
    );
  }
}
