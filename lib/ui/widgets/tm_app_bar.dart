import 'package:flutter/material.dart';
import 'package:untitled/ui/screen/update_profile_screen.dart';
import '../utils/app_colors.dart';

class TMAppBr extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBr({
    super.key,
    this.fromUpdateProfile = false
  });

  final bool fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColos.themeColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: (){
                if (fromUpdateProfile) return;
                Navigator.pushNamed(context, UpdateProfileScreen.name);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rabbil Hassan',
                      style: textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      )),
                  Text('rabbil@gamil.com',
                      style: textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
