# Train Tastes

Order breakfast tonight, pick it up at your railway station tomorrow morning.
Flutter (Android + iOS) + Firebase.

## Setup (Windows)

1. Create the Flutter shell with a real package name:
   ```bash
   flutter create --org lk.traintastes --platforms android,ios train_tastes
   ```
2. Copy everything from this folder into `train_tastes/` (replace `lib/`, `pubspec.yaml`,
   `analysis_options.yaml`, and add `assets/`, `firestore.rules`). Delete `test/widget_test.dart`.
3. Connect Firebase (use your existing Train Tastes project):
   ```bash
   firebase login
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
   This creates `lib/firebase_options.dart`.
4. In Firebase console → Authentication → Sign-in method, turn on **Email/Password** and **Google**.
5. Add your SHA-1 and SHA-256 (Android) in Firebase project settings:
   ```bash
   cd android && ./gradlew signingReport
   ```
   Then run `flutterfire configure` again to refresh `google-services.json`.
6. iOS: add the `REVERSED_CLIENT_ID` from `GoogleService-Info.plist` as a URL scheme in Xcode.
7. Firestore → Rules → paste `firestore.rules` and publish.
8. Run:
   ```bash
   flutter pub get
   flutter run
   ```

To make yourself admin: Firestore → `users/{your uid}` → change `role` to `admin`.

## Folder structure

```
lib/
  app/                 App widget + router (go_router)
  core/                Shared: DI (get_it), theme, errors, validators, widgets
  features/
    landing/           Animated welcome screen
    auth/
      domain/          Entities + repository interface (no Firebase here)
      data/            Firebase code + models + repository implementation
      presentation/    Blocs/cubits, pages, widgets
    home/              Placeholder home (role-based screens come next)
```

Rule: `presentation` → `domain` ← `data`. Pages never import Firebase.

## Tests

```bash
flutter test
```

Tests use a fake repository (`test/helpers/fake_auth_repository.dart`), so they never touch real Firebase.

## Branches & CI

- `main` = production. Nobody pushes to it directly.
- New work goes on a branch, e.g. `feature/auth-landing`, then a Pull Request into `main`.
- GitHub Actions (`.github/workflows/ci.yml`) runs analyze + tests + Android build on every PR.
- Merge only when CI is green. After merge, CI also builds iOS.

GitHub → Settings → Branches → add a rule for `main`:
"Require a pull request before merging" + "Require status checks to pass" (pick **Analyze & test** and **Build Android**).
