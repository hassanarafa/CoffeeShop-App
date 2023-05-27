import 'package:coffee_shop/modules/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../modules/coffee_shop.dart';

class orderpage extends StatefulWidget {
  orderpage({required this.coffee, super.key});
  Coffee? coffee;
  @override
  State<orderpage> createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  final snackBar = SnackBar(
    content: const Text(
      'Added Successfully',
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: backgroundColor,
  );

  void addToCart() {
    Provider.of<Coffeeshop>(context, listen: false)
        .additemCoffee(widget.coffee!);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }

  double sizeinitvalue = 0.0;
  void sizevalue(double sizevalue) {
    setState(() {
      sizeinitvalue = sizevalue;
    });
  }

  double pearlsinitvalue = 0.0;
  void pearlsvalue(double pearlvalue) {
    setState(() {
      pearlsinitvalue = pearlvalue;
    });
  }

  double amount = 0;
  void amountvalue(double amountvalue) {
    setState(() {
      amount = amountvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: backgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: backgroundColor),
          title: Text(
            widget.coffee!.name,
            style: const TextStyle(color: Colors.brown),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  widget.coffee!.imagePath,
                  height: 250,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text("Size"),
                    Expanded(
                      child: Slider(
                        divisions: 4,
                        label: sizeinitvalue.toString(),
                        value: sizeinitvalue,
                        onChanged: (value) => sizevalue(value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text("Pearls"),
                    Expanded(
                      child: Slider(
                        divisions: 4,
                        label: pearlsinitvalue.toString(),
                        value: pearlsinitvalue,
                        onChanged: (value) => pearlsvalue(value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text("Amount"),
                    Expanded(
                      child: Slider(
                        max: 10,
                        divisions: 10,
                        label: amount.toString(),
                        value: amount,
                        onChanged: (value) => amountvalue(value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white),
                    onPressed: addToCart,
                    child: const Text("Add To Cart"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
