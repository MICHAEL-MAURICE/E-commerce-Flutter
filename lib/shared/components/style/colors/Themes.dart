import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
ThemeData lightTheme=  ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),
        centerTitle: false,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        color: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        //  selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 0.0
    )
    , textTheme: TextTheme(
    bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18, fontWeight: FontWeight.w600
    )
)
);


ThemeData darkTheme=  ThemeData(
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),
        centerTitle: false,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey,
            statusBarIconBrightness: Brightness.light
        ),
        color: Colors.black12,
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        //selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black12,
        elevation: 0.0
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 18, fontWeight: FontWeight.w600
        )
    )
);