import 'package:flutter/material.dart';
import 'package:video_app/data/dynamic_data.dart';
import 'package:video_app/widgets/home_side_bar.dart';
import 'package:video_app/widgets/video_details.dart';
import 'package:video_app/widgets/video_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFollwingSelected = true;
  int _snappedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollwingSelected = true;
                })
              },
              child: Text(
                "Following",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: _isFollwingSelected ? 18 : 15,
                    color: _isFollwingSelected ? Colors.white : Colors.grey),
              ),
            ),
            Text(
              "  |  ",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 15, color: Colors.grey),
            ),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollwingSelected = false;
                })
              },
              child: Text(
                " For You",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: !_isFollwingSelected ? 18 : 15,
                    color: !_isFollwingSelected ? Colors.white : Colors.grey),
              ),
            )
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (int page) => {
          // print("Page change to $page")
          setState(() {
            _snappedPageIndex = page;
          }),
        },
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTile(
                video: videos[index],
                currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: VideoDetails(
                        video: videos[index],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.75,
                      child: HomeSideBar(
                        video: videos[index],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
