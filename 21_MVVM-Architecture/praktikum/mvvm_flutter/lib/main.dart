import 'package:flutter/material.dart';
import 'package:mvvm_flutter/screen/contact_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_flutter/screen/contact_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel()
        )
      ],
      child: const MaterialApp(
        home: ContactScreen(),
      ),
    ),
  );
}

