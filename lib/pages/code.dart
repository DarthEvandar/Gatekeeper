import 'package:flutter/material.dart';
import '../services/api_service.dart' as api;

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {

  List<String> code;

  void initState() {
    code = List();
    _loadCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: () => setState(() {}),
              child: addNew(),
            ),
            ListView.builder(
                itemCount: code.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  const Padding(padding: EdgeInsets.all(16.0));
                  return InkWell(
                      onTap: () => setState(() {}),
                      child: ListTile(
                        title: Text(code[index]),
                      )
                  );
                }
            ),
          ],
        )
    );
  }
  }

Widget addNew() =>
    ListTile(
      title: const Text('View Codes'),
      subtitle: const Text('Tap to refresh codes'),
      onTap: () {
        api.createCode('ders');
        _loadCode();
      },
    );

Widget getCode() =>
    ListTile(
      title: const Text('Your Codes'),
      subtitle: const Text('Tap to dump codes to console'),
      onTap: () => api.getCode('ders'),
    );

void _loadCode() async {
      code = await api.getCode('ders');
      setState(() {
      });
}
