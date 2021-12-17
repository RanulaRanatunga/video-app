import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camera/camera.dart';
import 'package:video_app/main.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  CameraController _cameraController =
      CameraController(cameras.first, ResolutionPreset.medium);
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.2);
  int _selectedTab = 1;

  @override
  void initState() {
    super.initState();
    _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Container(
          //   color: Colors.lightBlueAccent,
          // ),
          if (_cameraController.value.isInitialized) _buildCameraPreview(),
          const Spacer(),
          Container(
            color: Colors.black,
            height: 90,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);

    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height - 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 1.5,
            alignment: Alignment.center,
            child: CameraPreview(_cameraController),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 24, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.pop(context),
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Icon(
                              CupertinoIcons.music_note_2,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Text(
                            "Add Sound",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconWithText('music', 'Music', style, 20),
                          _buildIconWithText('text', 'Text', style, 20),
                          _buildIconWithText('trim', 'Trim', style, 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              _buildCameraTypeSelector(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 10, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconWithText(
                        'effects', 'Effects', style.copyWith(fontSize: 11), 40),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent, width: 4),
                          borderRadius: BorderRadius.circular(50)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                    ),
                    _buildIconWithText(
                        'upload', 'Upload', style.copyWith(fontSize: 11), 40),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCameraTypeSelector() {
    final List<String> cameraType = ["Photo", "Video"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 65,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: 45,
          child: PageView.builder(
            controller: _pageController,
            // onPageChanged: (int page) => {
            //   setState(() {
            //     _selectedTab = page;
            //   })
            // },
            itemCount: cameraType.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: Text(
                  cameraType[index],
                  style: style.copyWith(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithText(
      String icon, String label, TextStyle style, double size) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/$icon.svg',
          height: size,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: style,
        )
      ],
    );
  }

  Widget _buildCameraTemplateSelector() {
    final List<String> postTypes = ["Camera", "Quick", "Templates"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 45,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) => {
              setState(() {
                _selectedTab = page;
              })
            },
            itemCount: postTypes.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: Text(
                  postTypes[index],
                  style: style.copyWith(
                      color:
                          _selectedTab == index ? Colors.white : Colors.grey),
                ),
              );
            },
          ),
        ),
        Container(
          width: 50,
          height: 45,
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(backgroundColor: Colors.white, radius: 2.5),
        )
      ],
    );
  }
}
