import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const ProfileMobile();
          } else if (constraints.maxWidth <= 1200) {
            return const ProfileDesktop();
          } else {
            return const ProfileDesktop();
          }
        },
      ),
    );
  }
}

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(46),
        child: Column(
          children: [
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
            Text(
              "UnknownRori",
              style: mobile.subtitle,
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 42,
                            ),
                            const SizedBox(width: 16),
                            Text("Accounts", style: mobile.text)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 42,
                            ),
                            const SizedBox(width: 16),
                            Text("Settings", style: mobile.text)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.help,
                              size: 42,
                            ),
                            const SizedBox(width: 16),
                            Text("Help", style: mobile.text)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 42,
                            ),
                            const SizedBox(width: 16),
                            Text("Logout", style: mobile.textDanger)
                          ],
                        ),
                      ),
                    ),
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

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: mobile.pagePadding,
          child: Column(
            children: [
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
              Text(
                "UnknownRori",
                style: mobile.subtitle,
              ),
              const SizedBox(height: 26),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 16),
                          Text("Accounts", style: mobile.text)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          const SizedBox(width: 16),
                          Text("Settings", style: mobile.text)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(Icons.help),
                          const SizedBox(width: 16),
                          Text("Help & Support", style: mobile.text)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Not implemented yet!"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 16),
                          Text("Logout", style: mobile.textDanger)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
