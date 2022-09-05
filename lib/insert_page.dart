import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';


class InsertPage extends StatefulWidget {
  const InsertPage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  var newYear = '';
  var newName = '';
  var newCountry = '';

  Future<void> _insert() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: "127.0.0.1",
      port: 3306,
      userName: "root",
      password: "myPassword",
      databaseName: "aetatum", // optional
    );

    await conn.connect();

    print("Connected");

    // insert some rows
    var res = await conn.execute(
      "INSERT INTO timeline (id, year, name, country) VALUES (:id, :year, :name, :country)",
      {
        "id": null,
        "year": newYear,
        "name": newName,
        "country": newCountry,
      },
    );

    print(res.affectedRows);


    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'year',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (text) {
                  newYear = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'name of event',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (text) {
                  newName = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Country',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (text) {
                  newCountry = text;
                },
              ),
            ),
            const Text(
              'Push button to move:',
            ),

            Text(
              style: Theme.of(context).textTheme.headline4,
              'これなら動く？',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _insert,
        tooltip: 'vas-y',
        child: const Icon(Icons.add),
      ),
    );
  }
}
