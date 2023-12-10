import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'fonts.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  var val = 0;
  var text = "text";
  var con = TextEditingController();
  Color cc = Color(0xFFB74093);
  Color pc = Color(0xFFB74093);
  var fs = TextEditingController();
  var fsval = 32.0;
  List abc = myfonts.val;
  var dval = "";
  bool isBold = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 220),
      drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 228, 227, 220),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 100,
              ),
              Lottie.network(
                  "https://lottie.host/74827262-3576-4d58-ac05-6b5f1de9a9e8/9eTqKT7BFV.json",
                  height: 200),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: con,
                  decoration: InputDecoration(
                      hintText: "Enter The Input",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Color:"),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: MaterialPicker(
                                pickerColor: pc,
                                onColorChanged: (Color c) {
                                  setState(() {
                                    pc = c;
                                    cc = pc;
                                  });
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: const Text("Color It"))
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: pc, borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const Text("font-Size"),
                  Container(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: fs,
                      decoration: InputDecoration(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                  icon: Icon(Icons.arrow_drop_down_sharp),
                  value: dval != "" ? dval : abc[0],
                  items: abc
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dval = value.toString();
                    });
                  }),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bold : "),
                  Checkbox(
                      value: isBold,
                      onChanged: (value) {
                        setState(() {
                          isBold = !isBold;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      text = con.text;
                      fsval = double.tryParse(fs.text)!;

                      Navigator.pop(context);
                    });
                  },
                  child: const Text("submit")),
            ]),
          )),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 172, 176, 173),
          title: Image.network(
            "https://celebrare.in/assets/img/logo.webp",
            height: 32,
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 1.7,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("$text",
                      style: dval != ""
                          ? GoogleFonts.getFont('$dval',
                              textStyle: TextStyle(
                                  color: cc,
                                  fontSize: fsval,
                                  fontWeight: isBold
                                      ? FontWeight.bold
                                      : FontWeight.normal))
                          : GoogleFonts.aldrich()),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
