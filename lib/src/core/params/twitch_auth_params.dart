import 'package:irllink/src/core/utils/constants.dart';

class TwitchAuthParams {
  final String clientId;
  final String redirectUri;
  final String responseType;
  final String scopes;
  final String forceVerify;
  final String claims;

  const TwitchAuthParams({
    this.clientId = kTwitchAuthClientId,
    this.redirectUri = 'https://irllink.com/twitch/app/auth',
    this.responseType = 'code',
    this.scopes =
        'openid channel_editor chat:read chat:edit channel:moderate moderator:manage:chat_settings channel:manage:broadcast',
    this.forceVerify = 'true',
    this.claims = '{"userinfo":{"picture":null, "preferred_username":null}}',
  });
}