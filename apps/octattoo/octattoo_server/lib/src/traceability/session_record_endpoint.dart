import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class SessionRecordEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Returns the SessionRecord for a given appointment, or null if not sealed.
  Future<SessionRecord?> getByAppointmentId(
    Session session,
    UuidValue appointmentId,
  ) async {
    return SessionRecord.db.findFirstRow(
      session,
      where: (t) => t.appointmentId.equals(appointmentId),
    );
  }
}
