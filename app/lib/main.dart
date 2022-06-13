import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late MqttServerClient client;
  String clientStatus = 'INITIAL STATE';

  void connect() async {
    client = MqttServerClient('10.0.2.2', '');
    client.port = 1753;
    client.setProtocolV311();
    client.logging(on: false);
    client.keepAlivePeriod = 20;
    // client.onDisconnected = onDisconnected;
    // client.onSubscribed = onSubscribed;
    final connMess = MqttConnectMessage()
        .withClientIdentifier('Phone-Controller')
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('Mosquitto client connecting....');
    // clientStatus = 'Connecting';
    client.connectionMessage = connMess;
    try {
      await client.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Mosquitto client connected');
      clientStatus = 'Connected';
    } else {
      print(
          'ERROR Mosquitto client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
      client.disconnect();
      clientStatus = 'Error - ' + client.connectionStatus!.state.toString();
      // exit(-1);
    }
    // setState(() {});
  }

  void publish(String message) async {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    print(message);
    client.publishMessage('topico', MqttQos.atLeastOnce, builder.payload!);
  }

  @override
  Widget build(BuildContext context) {
    // Connect into mqtt server
    connect();

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Casa'),
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              // margin: const EdgeInsets.all(3),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline),
                title: Text(
                  'Lampada 01',
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  var _message = '{"lampada01":"ligar"}';
                  publish(_message);
                },
              ),
            ),
            Card(
              // margin: const EdgeInsets.all(3),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: Icon(Icons.computer),
                title: Text(
                  'Notebook Empresa',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  var _message = '{"notebook-empresa":"ligar"}';
                  publish(_message);
                },
              ),
            ),
            Card(
              // margin: const EdgeInsets.all(3),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: Icon(Icons.computer),
                title: Text(
                  'Notebook Pessoal',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  var _message = '{"notebook-pessoal":"ligar"}';
                  publish(_message);
                },
              ),
            ),
            Card(
              // margin: const EdgeInsets.all(3),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: Icon(Icons.coffee_maker_outlined),
                title: Text(
                  'Cafeteira',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  var _message = '{"cafeteira":"ligar"}';
                  publish(_message);
                },
              ),
            ),
            Spacer(),
            Card(
              // margin: const EdgeInsets.all(3),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: Icon(Icons.star_outline_sharp),
                title: Text(
                  clientStatus,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  clientStatus = 'Disconnected';
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
