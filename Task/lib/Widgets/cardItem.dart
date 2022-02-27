import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title, count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  "assets/images/background.jpg",
                  fit: BoxFit.fill,
                  height: mediaQuery.size.height,
                  width: mediaQuery.size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$title\n",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      count,
                      style: theme.textTheme.headline3!
                          .copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
