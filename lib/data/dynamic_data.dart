import 'package:video_app/models/user.dart';
import 'package:video_app/models/video.dart';

User currentUser = User('stackedlist', 'https://picsum.photos/id/1062/400/400');

User testingUser1 = User('user_1',
    'https://images.unsplash.com/photo-1625224590908-d02e98d0cb3f?ixid=MnwxMjA3fDB8MHx0b3BpYy');

User testingUser2 = User('user_2',
    'https://images.unsplash.com/photo-1488475015845-06342c9b3884?ixid=MnwxMjA3fDB8MHx0b3BpYy');

User testingUser3 = User('user_3',
    'https://images.unsplash.com/photo-1558227108-83a15ddbbb15?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZ');

User testingUser4 = User('user_4',
    'https://images.unsplash.com/photo-1608513732982-e13d86139cb4?ixid=MnwxMjA3fDB8MHx0b3BpYy');

final List<Video> videos = [
  Video('clip_one.mp4', testingUser1, 'caption', 'audioName', '13.8K', '123'),
  Video('clip_two.mp4', testingUser2, 'caption', 'audioName', '15.8B', '34K'),
  Video('clip_three.mp4', testingUser3, 'caption', 'audioName', '155M', '2'),
  Video('clip_four.mp4', testingUser4, 'caption', 'audioName', '6M', '45'),
];
