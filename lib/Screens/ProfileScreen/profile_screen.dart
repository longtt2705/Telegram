import 'package:flutter/material.dart';
import 'package:telegram/components/button_with_leading_icon.dart';
import 'package:telegram/components/circle_image.dart';
import 'package:telegram/components/status_change_button.dart';
import 'package:telegram/constant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraint) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: size.width,
                          height: size.width * 0.4 + size.height * 0.1,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://placeimg.com/640/480/any')))),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1),
                        child: Center(
                          child: Stack(
                            children: [
                              CircleImage(
                                borderColor: Colors.white,
                                borderWidth: 8,
                                size: size.width * 0.6,
                                url: 'https://placeimg.com/640/480/any',
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: StatusChangeButton(
                                      borderColor: Colors.white,
                                      width: size.width * 0.08))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Hoàng Trọng Dũng",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "I'm sorry, don't leave me, I want you here with me,\n I know that your love is gone, I can't breathe, I'm so weak, I know this isn't easy",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height * 0.04),
                  Flexible(
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.04),
                        Flexible(
                          flex: 5,
                          child: ButtonWithLeadingIcon(
                              size: size,
                              text: "Add Friend",
                              icon: Icons.person_add,
                              onPress: () {},
                              color: primaryColor,
                              textColor: Colors.white),
                        ),
                        Flexible(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              color: primaryColor,
                              onPressed: () {},
                            )),
                      ],
                    ),
                  ),
                  Divider(
                    indent: size.width * 0.05,
                    endIndent: size.width * 0.05,
                    thickness: 1.5,
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: RichText(
                      text: TextSpan(
                        text: 'Got loved by ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: '265.984 people',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: RichText(
                      text: TextSpan(
                        text: 'Worked at ',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Ho Chi Minh University of Science',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                      leading: Icon(Icons.location_on),
                      title: RichText(
                        text: TextSpan(
                          text: '5.5 kilometers ',
                          style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'away',
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
