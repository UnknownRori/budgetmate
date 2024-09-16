import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 2, right: 2, top: 24, bottom: 24),
        child: Column(
          children: [
            const Text(
              "Profile",
              style: title,
            ),
            const SizedBox(height: 26),
            SizedBox(
              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/me.png"),
                ),
              ),
            ),
            const Text(
              "UnknownRori",
              style: subtitle,
            ),
            const SizedBox(height: 26),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 16),
                      Text("Accounts", style: text)
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 16),
                      Text("Settings", style: text)
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.help),
                      SizedBox(width: 16),
                      Text("Help & Support", style: text)
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(width: 16),
                      Text("Logout", style: textDanger)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
