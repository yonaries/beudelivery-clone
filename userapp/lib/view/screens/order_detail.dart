import 'package:flutter/material.dart';
import 'package:userapp/view/components/order_details/order_detail_orders_component.dart';
import 'package:userapp/view/components/order_details/order_detail_totals_section.dart';
import 'package:userapp/view/components/order_details/order_details_info_section.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(context).primaryColor,
            size: 22,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: Text(
          "Order Details",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),

              // Delivery and payment information
              const OrderDetailsInfoSection(),

              const Divider(
                thickness: 3,
              ),

              // Order listing

              SizedBox(
                height: 51 * 3,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const OrderDetailOrderComponent(
                      foodName: "Boss Special Burger",
                      quantity: 2,
                      foodType: "Double",
                      price: 700,
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 3,
              ),

              // Total section
              const OrderDetailTotalSection(
                itemTotal: 1200,
                deliveryFee: 30,
              ),

              const SizedBox(
                height: 20,
              ),

              // Re order button
              GestureDetector(
                onTap: () {
                  // Do Sth
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(250, 74, 12, 1),
                        Color.fromRGBO(255, 153, 0, 1),
                      ],
                    ),
                  ),
                  child: Text(
                    "Re-Order",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
