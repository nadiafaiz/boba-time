import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../model/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItem({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            menuItem.thumbnail.isNotEmpty
                ? Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(menuItem.thumbnail),
                      ),
                    ),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    color: Colors.blueGrey,
                    child: const Icon(
                      Icons.restaurant,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuItem.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                child: const CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xfff2aea2),
                  radius: 15,
                  child: Icon(Icons.add),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
