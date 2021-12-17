import 'package:flutter/material.dart';
import 'package:video_app/widgets/favourites_tab.dart';
import 'package:video_app/widgets/replies_tab.dart';
import 'package:video_app/widgets/video_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ranula Ranatunga',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.person_add,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Ranula',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    // color: Colors.red,
                    child: Column(
                      children: const [
                        Text(
                          '2',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.lightBlue,
                    child: Column(
                      children: const [
                        Text(
                          '1B',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.purpleAccent,
                    child: Column(
                      children: const [
                        Text(
                          '1K',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' Likes ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.grey[800],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Bio',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.video_library_sharp, color: Colors.black),
                  text: 'Videos',
                ),
                Tab(
                  icon: Icon(Icons.replay_circle_filled_sharp,
                      color: Colors.black),
                  text: 'Replies',
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.black),
                  text: 'Favourites',
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  VideosTab(),
                  RepliesTab(),
                  FavouritesTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
