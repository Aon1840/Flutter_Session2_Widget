import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> favouriteFoods = [];
  var controller = TextEditingController();
  var isEnable = false;

  Function _addFavouriteFood(String food) {
    return () {
      setState(() {
        favouriteFoods.add(food);
        print(food);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('What is your favourite food?'),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: new InputDecoration(hintText: "answer here"),
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      isEnable = true;
                    } else {
                      isEnable = false;
                    }
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                onPressed: isEnable ? _addFavouriteFood(controller.text) : null,
                child: Text(
                  'Click me to add Favourite food!',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: favouriteFoods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(favouriteFoods[index]),
                      leading: Icon(Icons.icecream),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
