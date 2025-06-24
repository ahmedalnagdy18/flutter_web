import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/screens/collection_page.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SizedBox(
        height: appHight(context, 0.30),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollectionPage(
                          type: 'Bags',
                        ),
                      )),
                  child: _collectionData(
                      name: "Bags", image: collectionsImages[0])),
            ),
            SizedBox(width: 6),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CollectionPage(
                                type: 'Woman',
                              ),
                            )),
                        child: _collectionData(
                            name: "Woman", image: collectionsImages[1])),
                  ),
                  SizedBox(height: 6),
                  Expanded(
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CollectionPage(
                                type: 'Men',
                              ),
                            )),
                        child: _collectionData(
                            name: "Man", image: collectionsImages[2])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _collectionData({String? name, String? image}) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image.asset(
        image ?? "",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 20,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: [
            Text(name ?? "", style: AppTexts.small),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 12)
          ],
        ),
      )
    ],
  );
}

//list of images
List collectionsImages = [
  'images/bags.jpg',
  'images/woman.jpg',
  'images/men.jpg',
];
