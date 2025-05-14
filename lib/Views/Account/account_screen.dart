import 'package:flutter/material.dart';
import '../../Components/profile_option_tile.dart';
import '../../Utils/app_assets_paths.dart';
import '../../Utils/app_text_themes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                child: Text(
                  "Person",
                  style: AppTextThemes.profileDisplay_theme,
                ),
              ),
              const SizedBox(height: 30),

              // Profile Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Avatar
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 16),

                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                          Text("Shahab Afridi",
                              style: AppTextThemes.display_medium_theme),
                          SizedBox(height: 4),
                          Text("myname@gmail.com",
                              style: AppTextThemes.normal_desc_theme),
                          SizedBox(height: 2),
                          Text("07XXXXXXXX",
                              style: AppTextThemes.normal_desc_theme),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Options
              ProfileOptionTile(
                icon: AssetPaths.setting,
                title: "Kontoinställningar",
                onTap: () {},
              ),
              ProfileOptionTile(
                icon: AssetPaths.mina,
                title: "Mina betalmetoder",
                onTap: () {},
              ),
              ProfileOptionTile(
                icon: AssetPaths.support,
                title: "Support",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
