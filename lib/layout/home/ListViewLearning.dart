import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Lists with Cards'),
        ),
        body: ListsWithCards(),
      ),
    );
  }
}

class ListsWithCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for three lists
    List<List<String>> listsData = [
      ['Item 1', 'Item 2', 'Item 3'],
      ['Item A', 'Item B', 'Item C', 'Item D'],
      ['Item X', 'Item Y', 'Item Z'],
      ['Item P', 'Item Q', 'Item R'],
      ['Item M', 'Item N', 'Item O'],
    ];

    return ListView.builder(
        itemCount: listsData.length,
        itemBuilder: (context, index) {
          return CardList(listsData: listsData[index]);
        },
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listsData;
  CardList({required this.listsData});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('List ${listsData[0]}'),
          ),
          Divider(),
          ListView.builder(
            itemCount: listsData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listsData[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
