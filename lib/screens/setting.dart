import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            SettingsSection(
              title: 'Account Settings',
              options: [
                'Profile',
                'Privacy',
                'Security',
              ],
            ),
            SettingsSection(
              title: 'Notifications',
              options: [
                'Push Notifications',
                'Email Notifications',
                'SMS Alerts',
              ],
            ),
            SettingsSection(
              title: 'About Us',
              options: [
                'About the App',
                'Terms of Service',
                'Privacy Policy',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
          image: AssetImage("assets/images/settings_background.png"), // Your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'Settings',
              textStyle: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<String> options;

  const SettingsSection({
    Key? key,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Divider(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return AnimatedListTile(
              text: options[index],
              icon: Icons.arrow_forward_ios,
              onTap: () {
                // Handle navigation or action
              },
            );
          },
        ),
      ],
    );
  }
}

class AnimatedListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const AnimatedListTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Icon(
                icon,
                key: ValueKey<String>(text),
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
