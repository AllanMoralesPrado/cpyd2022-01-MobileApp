// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Welcome>> fetchWelcome(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://api.sebastian.cl/classroom/v1/classroom/attendances'),
    headers: {
      HttpHeaders.authorizationHeader:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJhdWQiOiJVVEVNIiwiY29kZSI6IjQvMEFkUXQ4cWd2NWZiSWRPNW9NV1Nma3F6OTd2NXY1U2J6a3cxVGZYWGtWOEtWZFMwUXg2Um5yc0NlWDBLR2k2YzFyVnhFUGciLCJpc3MiOiJTZWJhc3Rpw6FuIiwiZXhwIjoxNjU4MDE3NDg2LCJpYXQiOjE2NTgwMTM4ODcsImp0aSI6IjExNDIiLCJlbWFpbCI6ImFsbGFuLm1vcmFsZXNwQHV0ZW0uY2wiLCJ0b2tlbiI6IlBydXBiTjZHbk82QmpPOFkxN1RVVlE1aHNpNkd2T2dsY3RUTkUifQ.FhBp7gubEzzOmkKUjs1LpkAc3_UPvdCFx7R3oK_Fh_2StYZ0xWNmyak2Mo0ZDNi4GU5JmaHjLqYomxqXn4tYUQ',
      HttpHeaders.acceptHeader: 'application/json'
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseWelcome, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Welcome> parseWelcome(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Welcome>((json) => Welcome.fromJson(json)).toList();
}

class Welcome {
  Welcome({
    required this.classroom,
    required this.subject,
    required this.entrance,
    required this.leaving,
    required this.email,
  });

  String classroom;
  String subject;
  DateTime entrance;
  DateTime leaving;
  String email;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        classroom: json["classroom"],
        subject: json["subject"],
        entrance: DateTime.parse(json["entrance"]),
        leaving: DateTime.parse(json["leaving"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "classroom": classroom,
        "subject": subject,
        "entrance": entrance.toIso8601String(),
        "leaving": leaving.toIso8601String(),
        "email": email,
      };
}
