// To parse this JSON data, do
//
//     final classrooms = classroomsFromJson(jsonString);

import 'dart:convert';

List<Classrooms> classroomsFromJson(String str) => List<Classrooms>.from(json.decode(str).map((x) => Classrooms.fromJson(x)));

String classroomsToJson(List<Classrooms> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Classrooms {
    Classrooms({
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

    factory Classrooms.fromJson(Map<String, dynamic> json) => Classrooms(
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
