import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:power_bank/app/resources/app_colors.dart';
import 'package:power_bank/app/widgets/items/menu_item_widget.dart';
import 'package:power_bank/app/widgets/others/profile.dart';
import 'package:power_bank/core/ui/scroll_behavior/disable_glow_effect_scroll_behavior.dart';
import 'package:power_bank/domain/enums/menu_item.dart' as enums;
import 'package:power_bank/gen/assets.gen.dart';
import 'package:power_bank/localization/app_localizations.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    required this.menuItems,
    this.phone,
    required this.exitPressed,
    required this.menuItemPressed,
  });

  final List<enums.MenuItem> menuItems;
  final String? phone;
  final void Function(enums.MenuItem item) menuItemPressed;
  final void Function() exitPressed;

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: AppColors.surface,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _buildProfileSection(),
              ),
              Expanded(
                child: _buildMenuItems(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 8),
                child: _buildLogo(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 16),
                child: _buildDescription(context),
              ),
            ],
          ),
        ),
      );

  Widget _buildProfileSection() => Profile(
        phoneNumber: phone ?? '',
        onExitPressed: () {
          exitPressed();
          // sendEvent(NavigationEvent.exitClicked());
        },
      );

  Widget _buildMenuItems() => ScrollConfiguration(
        behavior: const DisableGrowEffectScrollBehavior(),
        child: ListView.builder(
          itemCount: menuItems.length,
          padding: const EdgeInsets.only(top: 42),
          itemBuilder: (context, index) => MenuItemWidget(
            item: menuItems[index],
            onPressed: () {
              menuItemPressed.call(menuItems[index]);
            },
          ),
        ),
      );

  Widget _buildDescription(BuildContext context) => FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          String? version = snapshot.data?.version;
          String? buildNumber = snapshot.data?.buildNumber;
          AppLocalizations localizations = AppLocalizations.of(context);
          return Text(
            '${localizations.version} ${version ?? ''} (${(buildNumber ?? '')})',
            style: TextStyle(
              fontSize: 13,
              height: 20 / 13,
              fontWeight: FontWeight.w400,
              color: AppColors.onBackground12,
            ),
          );
        },
      );

  Widget _buildLogo() => Assets.images.miniLogo.image(width: 113, height: 24);
}
