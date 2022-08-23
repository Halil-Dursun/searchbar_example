import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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

  @override
  void initState() {
    super.initState();
    _resultList = _allProduct;
  }
  late List<Map<String,dynamic>> _resultList;
  List<Map<String,dynamic>> _allProduct = [
    {"id" : 1, "product_name" : "Bilgisayar HP"},
    {"id" : 2, "product_name" : "Telefon Samsung"},
    {"id" : 3, "product_name" : "Telefon Apple"},
    {"id" : 4, "product_name" : "Tablet LG"},
    {"id" : 5, "product_name" : "Tablet Samsung"},
    {"id" : 6, "product_name" : "Playstation Sony"},
    {"id" : 7, "product_name" : "Xbox microsoft"},
  ];

  void _filterList(String value){
    if(value.isEmpty){
      setState(() {
        _resultList = _allProduct;
      });
    }else{
      setState(() {
        _resultList = _allProduct.where((element) => element["product_name"].toLowerCase().contains(value.toLowerCase())).toList();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: _filterList,
            decoration: InputDecoration(
              labelText: "Search Something",
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search)
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: _resultList.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text(_resultList[index]["id"].toString()),
              subtitle: Text(_resultList[index]["product_name"].toString()),
            );
          }))
        ],
      ),
    );
  }
}
