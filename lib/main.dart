import 'package:myapp/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  String url = 'https://arpejqfnnipblfmncnjv.supabase.co';
  String anonkey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFycGVqcWZubmlwYmxmbW5jbmp2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA4MzMzODgsImV4cCI6MjA1NjQwOTM4OH0.OEVTT5wdhltbLur0ZEvT4YRdLNppJ9GcKS3lYigjgpc';

  await Supabase.initialize(url: url, anonKey: anonkey);

  runApp(const App());
}

/**

 <!-- INTERNET ACCESS -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>


    <application
        android:label="ChhayaAR"



 */