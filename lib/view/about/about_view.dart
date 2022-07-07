import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/about_view_model.dart';
import '../../constants/strings.dart';
import 'widgets/social_media_button.dart';

class AboutView extends StatelessWidget {
  static const routeName = '/about-view';
  final String _upworkIcon = 'upwork_icon.png';
  final String _githubIcon = 'github_icon.png';
  final String _twitterIcon = 'twitter_icon.png';
  final String _yigitsUpworkUrl = 'https://www.upwork.com/freelancers/~01bcdf929cedf164b2';
  final String _yigitsGithubUrl = 'https://github.com/yigitesmen';
  final String _yigitsTwitterUrl = 'https://twitter.com/YigitEsmen';

  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AboutViewModel>(
      create: (context) => AboutViewModel(),
      builder: (context, widget) {
        var aboutViewModel = Provider.of<AboutViewModel>(context);
        return Scaffold(
          appBar: AppBar(title: const Text(WeatherStrings.about)),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildAppInfo(context),
                const SizedBox(height: 12),
                buildApiInfo(context),
                const SizedBox(height: 12),
                buildDeveloperInfo(context),
                const SizedBox(height: 12),
                buildSocialMediaRow(aboutViewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Text buildAppInfo(BuildContext context) {
    return Text(
      '${WeatherStrings.appName} ${WeatherStrings.version}',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Text buildApiInfo(BuildContext context) {
    return Text(
      WeatherStrings.weatherApiBy,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Text buildDeveloperInfo(BuildContext context) {
    return Text(
      WeatherStrings.developerInfo,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Row buildSocialMediaRow(AboutViewModel aboutViewModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialMediaButton(
          icon: _upworkIcon,
          onTap: () => aboutViewModel.launchSocialMediaUrl(_yigitsUpworkUrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SocialMediaButton(
            icon: _githubIcon,
            onTap: () =>
                aboutViewModel.launchSocialMediaUrl(_yigitsGithubUrl),
          ),
        ),
        SocialMediaButton(
          icon: _twitterIcon,
          onTap: () => aboutViewModel.launchSocialMediaUrl(_yigitsTwitterUrl),
        ),
      ],
    );
  }
}
