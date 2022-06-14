import 'package:flutter/material.dart';

//states
final Set<String> ads = {
  "lib/assets/images/ads.jpg",
  "lib/assets/images/ad.jpg",
  "lib/assets/images/ad2.jpg",
};

//mapping through ads
final List<bool> isSelectedAd =
    ads.map((e) => e == ads.last ? true : false).toList();

//ads page controller
final PageController _adsController = PageController(initialPage: 0);

Container adBanner(double currentHeight) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
    height: currentHeight / 3.5,
    child: PageView.builder(
      controller: _adsController,
      itemCount: ads.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              child: Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(ads.elementAt(index)),
              ),
            ),
          ),
        );
      },
    ),
  );
}
