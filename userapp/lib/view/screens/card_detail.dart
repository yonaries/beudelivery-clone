import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/view/components/checkout/card_provider.dart';
import 'package:userapp/view/components/checkout/checkout-button.dart';
import 'package:userapp/view/components/checkout/dropdown_button.dart';
import 'package:userapp/view/components/nav_bottom.dart';

class CardDetailScreen extends StatefulWidget {
  CardDetailScreen({Key? key}) : super(key: key);

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  String countryValue = "country-1";
  List<String> countryList = [
    "country-1",
    "country-2",
    "country-3",
    "country-4",
    "country-5",
    "country-6",
    "country-7",
    "country-8",
    "country-9",
    "country-10",
    "country-11",
    "country-12",
    "country-13",
    "country-14",
    "country-15",
    "country-16",
  ];

  String date = "Select Date";

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  dropdownChangeHandler(newValue) => {
        setState(() {
          countryValue = newValue;
        })
      };
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    Future pickDate() async {
      final initialDate = DateTime.now();
      final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(initialDate.year - 30),
        lastDate: initialDate,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.deepOrange,
                primaryContainer: Colors.white,
                onPrimary: Colors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (newDate == null) return;
      setState(() {
        date = "${newDate.day}/${newDate.month}/${newDate.year}";
      });

      log(date);
    }

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.deepOrange,
          statusBarBrightness: Brightness.dark,
        ),
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: currentWidth * 0.05,
            right: currentWidth * 0.05,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    cardProvider(
                      providerImage: Image.asset("lib/assets/icons/Amex.jpg"),
                    ),
                    cardProvider(
                      providerImage: Image.asset("lib/assets/icons/Visa.png"),
                    ),
                    cardProvider(
                      providerImage:
                          Image.asset("lib/assets/icons/MasterCard.png"),
                    ),
                    cardProvider(
                      providerImage:
                          Image.asset("lib/assets/icons/Discover.jpg"),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Card Holder Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _cardHolderNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(currentWidth),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(currentWidth),
                        borderSide: const BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      hintText: "Card Holder Name",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // Card Number
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Card Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(currentWidth),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(currentWidth),
                        borderSide: const BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      hintText: "3333 4444 5555 6666",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              // date And CVV
              SizedBox(
                height: 110,
                child: Row(
                  children: [
                    // date
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Month/Year",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // date Picker

                          FractionallySizedBox(
                            widthFactor: 1,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(currentWidth),
                              onTap: () {
                                pickDate();
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.circular(currentWidth),
                                ),
                                child: Text(
                                  date,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),

                    // Cvv
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "CVV",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: TextField(
                              cursorColor: Colors.deepOrange,
                              controller: _cardNumberController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(currentWidth),
                                  borderSide:
                                      BorderSide(color: Colors.grey[50]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(currentWidth),
                                  borderSide: const BorderSide(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                hintText: "Enter Here",
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // Dropdown Countr selector
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Country",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  dropdownButton(
                    countryValue: countryValue,
                    countryList: countryList,
                    dropdownChangeHandler: dropdownChangeHandler,
                  ),

                  // POwered by

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Powered By ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Image.asset("lib/assets/icons/chapa_logo.png")
                      ],
                    ),
                  ),

                  // Pay Button
                  checkoutButton(title: "Pay"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
