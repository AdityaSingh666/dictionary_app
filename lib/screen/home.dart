import 'package:dictonary_app/services/ApiClient.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient apiClient = ApiClient();
  TextEditingController tc = TextEditingController();
  String meaning = "Null";

  _call(q) async {
    meaning = await apiClient.getData(query: q);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dictionary App"),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // IconButton(onPressed: (){
                //   apiClient.getData();
                // }, icon: Icon(Icons.add))
                TextField(
                  controller: tc,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            tc.clear();
                          },
                          icon: Icon(Icons.clear)),
                      hintText: "Search any words"),
                ),

                OutlinedButton(
                    onPressed: () {
                      _call(tc.text);
                      tc.clear();
                      setState(() {});
                    },
                    child: Text("Search")),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.yellowAccent,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .20,
                  child: Center(
                      child: Text(
                    meaning,
                    style: TextStyle(fontSize: 25),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
