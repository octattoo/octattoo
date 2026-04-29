# octattoo

Tattoo business management with material traceability.

## Prerequisites

- Flutter SDK (stable channel, ≥ 3.32)
- Dart SDK (≥ 3.8)
- Melos (`dart pub global activate melos`)
- Docker & Docker Compose (for Serverpod database)

## Getting Started

```bash
# Clone the repo
git clone https://github.com/octattoo/octattoo.git
cd octattoo

# Bootstrap the workspace (resolves all dependencies)
melos bootstrap

# Start the database (required for server)
cd apps/octattoo/octattoo_server
docker compose up --build --detach
dart bin/main.dart --apply-migrations
cd ../../..

# Run the Flutter app
cd apps/octattoo/octattoo_flutter
flutter run
```

## Project Structure

```
octattoo/
├── apps/octattoo/
│   ├── octattoo_client/    # Generated Serverpod client
│   ├── octattoo_server/    # Serverpod backend
│   └── octattoo_flutter/   # Flutter app (Android + Web)
├── pubspec.yaml            # Workspace root (Melos config)
└── .github/workflows/      # CI
```

## Scripts

```bash
melos run analyze   # Dart static analysis
melos run test      # Run all tests
melos run format    # Check formatting
```

## Architecture

- **Mono-repo** managed by Melos with Dart pub workspaces
- **Backend:** Serverpod 3 (PostgreSQL, Redis, WebSocket)
- **Frontend:** Flutter with GoRouter, Material Design 3
- **State:** ChangeNotifier + ValueNotifier (no third-party state management)

See [CONTEXT-MAP.md](CONTEXT-MAP.md) for bounded contexts and domain glossary.
