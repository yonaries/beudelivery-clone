import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/ad_controller.dart';

//states

//mapping through ads
// final List<bool> isSelectedAd =
//     ads.map((e) => e == ads.last ? true : false).toList();

//ads page controller
final PageController _adsController = PageController(initialPage: 0);

Container adBanner(double currentHeight, context) {
  final ads = Provider.of<AdController>(context).ads;
  final isLoaded = Provider.of<AdController>(context).isLoaded;
  final controller = Provider.of<AdController>(context);
  // final adsFuture = Provider.of<AdController>(context).getData();
  final adsFuture = FirebaseFirestore.instance.collection('Ads').get();

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
    height: currentHeight / 3.5,
    child: isLoaded
        ? FutureBuilder(
            future: adsFuture,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return PageView.builder(
                  controller: _adsController,
                  itemCount: ads.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Material(
                        child: InkWell(
                          onTap: () {},
                          child: Ink.image(
                            fit: BoxFit.cover,
                            image: AssetImage(ads.elementAt(index).adLink),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Text("loading");
            },
          )
        : const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          ),
  );
}
