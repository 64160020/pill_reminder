import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_reminder_app/constants.dart';
import 'package:pill_reminder_app/global_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
//import 'package:untitled2/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Request permissions
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  } else if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Pill Reminder',
          //theme customization
          theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kScaffoldColor,
            //appbar theme
            appBarTheme: AppBarTheme(
              toolbarHeight: 7.h,
              backgroundColor: kScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: kSecondaryColor,
                size: 20.sp,
              ),
              titleTextStyle: GoogleFonts.mulish(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
              ),
            ),
            textTheme: TextTheme(
              displaySmall: TextStyle(
                fontSize: 28.sp,
                color: kSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: kTextColor,
              ),
              headlineSmall: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: kTextColor,
              ),
              titleLarge: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: kTextColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
              titleMedium:
              GoogleFonts.poppins(fontSize: 15.sp, color: kPrimaryColor),
              titleSmall:
              GoogleFonts.poppins(fontSize: 12.5.sp, color: kTextLightColor),
              bodySmall: GoogleFonts.poppins(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: kTextLightColor,
              ),
              labelMedium: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.3,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: kTextLightColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            //lets customize the timePicker theme
            // timePickerTheme: TimePickerThemeData(
            //   backgroundColor: kScaffoldColor,
            //   hourMinuteColor: kTextColor,
            //   hourMinuteTextColor: kScaffoldColor,
            //   dayPeriodColor: kTextColor,
            //   dayPeriodTextColor: kScaffoldColor,
            //   dialBackgroundColor: kTextColor,
            //   dialHandColor: kPrimaryColor,
            //   dialTextColor: kScaffoldColor,
            //   entryModeIconColor: kOtherColor,
            //   dayPeriodTextStyle: GoogleFonts.aBeeZee(
            //     fontSize: 8.sp,
          ),
          //   ),
          // ),
          home: const HomePage(),
        );
      }),
    );
  }
}
