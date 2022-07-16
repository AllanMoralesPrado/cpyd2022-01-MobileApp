import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador de Asistencia'),
        backgroundColor: Colors.blue.shade900,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'allan.moralesp@utem.cl',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('Acerca de'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Escanear QR',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(50))
                  ),
                  onPressed: null,
                  icon: const Icon(Icons.input), 
                  label: const Text('Marcar Entrada')
                ),
                OutlinedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(50))
                  ),
                  onPressed: null,
                  icon: const Icon(Icons.output),
                  label: const Text('Marcar Salida')
                ),
              ],
            )
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: 
            ListView(
              padding: const EdgeInsets.all(20.0),
              addAutomaticKeepAlives: false,
              cacheExtent: 100.0,
              children: const [
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: 
                    Text(
                      'carta 1',
                      textAlign: TextAlign.center,
                    ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: 
                    Text(
                      'carta 1',
                      textAlign: TextAlign.center,
                    ),
                ),
              ],
            )
        ),
      ][currentPageIndex],
    );
  }
}
