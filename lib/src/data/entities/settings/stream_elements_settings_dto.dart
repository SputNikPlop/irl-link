import 'package:irllink/src/domain/entities/settings.dart';
import 'package:irllink/src/domain/entities/settings/stream_elements_settings.dart';

class StreamElementsSettingsDTO extends StreamElementsSettings {
  const StreamElementsSettingsDTO({
    required bool showFollowerActivity,
    required bool showSubscriberActivity,
    required bool showDonationActivity,
    required bool showCheerActivity,
    required bool showRaidActivity,
    required bool showHostActivity,
    required bool showMerchActivity,
  }) : super(
          showFollowerActivity: showFollowerActivity,
          showSubscriberActivity: showSubscriberActivity,
          showDonationActivity: showDonationActivity,
          showCheerActivity: showCheerActivity,
          showRaidActivity: showRaidActivity,
          showHostActivity: showHostActivity,
          showMerchActivity: showMerchActivity,
        );

  @override
  Map toJson() => {
        'showFollowerActivity': showFollowerActivity,
        'showSubscriberActivity': showSubscriberActivity,
        'showDonationActivity': showDonationActivity,
        'showCheerActivity': showCheerActivity,
        'showRaidActivity': showRaidActivity,
        'showHostActivity': showHostActivity,
        'showMerchActivity': showMerchActivity,
      };

  factory StreamElementsSettingsDTO.fromJson(Map<String, dynamic> map) {
    return StreamElementsSettingsDTO(
      showFollowerActivity: map['showFollowerActivity'] ??
          const Settings.defaultSettings()
              .streamElementsSettings!
              .showFollowerActivity,
      showSubscriberActivity: map['showSubscriberActivity'] ??
          const Settings.defaultSettings()
              .streamElementsSettings!
              .showSubscriberActivity,
      showDonationActivity: map['showDonationActivity'] ??
          const Settings.defaultSettings()
              .streamElementsSettings!
              .showDonationActivity,
      showCheerActivity: map['showCheerActivity'] ??
          const Settings.defaultSettings().streamElementsSettings!.showCheerActivity,
      showRaidActivity: map['showRaidActivity'] ??
          const Settings.defaultSettings().streamElementsSettings!.showRaidActivity,
      showHostActivity: map['showHostActivity'] ??
          const Settings.defaultSettings().streamElementsSettings!.showHostActivity,
      showMerchActivity: map['showMerchActivity'] ??
          const Settings.defaultSettings().streamElementsSettings!.showMerchActivity,
    );
  }
}
