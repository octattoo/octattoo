import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ArtistProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the current user's artist profile ID.
  /// Auto-creates the profile on first call.
  Future<UuidValue> getMyProfileId(Session session) async {
    final authUserId = session.authenticated!.userIdentifier;

    var profile = await ArtistProfile.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(authUserId)),
    );

    profile ??= await ArtistProfile.db.insertRow(
      session,
      ArtistProfile(
        authUserId: UuidValue.fromString(authUserId),
        name: 'Artist',
      ),
    );

    return profile.id!;
  }
}
