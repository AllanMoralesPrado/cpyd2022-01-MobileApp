/*
import 'dart:convert';

import 'package:app/classrooms.dart';
import 'package:http/http.dart' as http;

Future<Classrooms> fetchClassrooms() async {
  final response = await http.get(
      Uri.parse('https://api.sebastian.cl/classroom/v1/classroom/attendances'),
      headers: {
        'jwt':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJhdWQiOiJVVEVNIiwiY29kZSI6IjQvMEFkUXQ4cWpTdkI5dVJmYmtUeDllM0JONE9lcnR3bFdFYzZBdEw0cGx1bENNWXBCV1hMdTdTLUxGcl92WHV5TmlBNl91X2ciLCJpc3MiOiJTZWJhc3Rpw6FuIiwiZXhwIjoxNjU4MDI4MTU5LCJpYXQiOjE2NTgwMjQ1NjAsImp0aSI6IjExODciLCJlbWFpbCI6ImFsbGFuLm1vcmFsZXNwQHV0ZW0uY2wiLCJ0b2tlbiI6Ik5HWkxlM3M5djNDQWY2RjVpOXBZWTYxamV1azY0eUxTNUtRUlkifQ.8ELhpRYaLWdLqOSmR_2fn2kQfYjJfZ4IAn3_7buSzDs_DlsrEUp4CYxLdSykyftpcQ8-7DcU7B-SOdRrZk9Ivw'
      });
  if (response.statusCode == 200) {
    return Classrooms.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fallo al cargar Salas');
  }
}
*/

//ESTE CODIGO NO ARRANCA POR LA SIGUIENTE EXCEPCION:
// Exception has occurred.
//_TypeError (type 'List<dynamic>' is not a subtype of type 'Map<String, dynamic>')