# Vaultly

A secure, cross-platform password manager built with Flutter. Store, organize, and access your credentials with PIN protection and biometric authentication.

---

## Features

- **Secure Storage** — Passwords encrypted at rest via `flutter_secure_storage`
- **Email + OTP Auth** — Passwordless authentication powered by Supabase
- **Master PIN** — 6-digit PIN required to unlock the vault
- **Biometric Unlock** — Fingerprint / Face ID as an alternative to PIN entry
- **Auto-Lock** — Vault locks automatically when the app goes to background
- **Password Management** — Add, edit, delete, and search credentials
- **Categories & Tags** — Organize entries by Social, Work, Finance, or custom tags
- **Password Strength** — Real-time strength indicator while entering passwords
- **Localization** — Full English and Arabic support (RTL-ready)
- **Dark / Light / System Theme** — User-selectable at runtime
- **Wipe Vault** — Secure data wipe from settings

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.41 (Impeller rendering) |
| Language | Dart 3.11 (sound null safety, pattern matching, sealed classes) |
| State | Riverpod 3.x + riverpod_generator |
| Navigation | GoRouter 17.x |
| Backend | Supabase (auth + database) |
| Secure Storage | flutter_secure_storage 10.x |
| Serialization | Freezed 3.x + json_serializable |
| Biometrics | local_auth 2.x |
| Animations | flutter_animate 4.x |
| Localization | flutter_localizations (ARB) |
| Linting | flutter_lints |

---

## Architecture

The project follows **Clean Architecture** with a feature-first folder structure.

```
lib/
├── core/                    # Shared infrastructure
│   ├── config/              # App initializer, flavor config
│   ├── constants/           # Strings, categories, storage keys
│   ├── extensions/          # Animation & string extensions
│   ├── helpers/             # Responsive helper, shared prefs wrapper
│   ├── providers/           # App-wide Riverpod providers
│   ├── routing/             # GoRouter config and route constants
│   ├── themes/              # Material 3 color scheme, text styles
│   └── widgets/             # Reusable widgets (AppTextField, GradientButton)
│
├── features/
│   ├── auth/                # Email → OTP → PIN setup / unlock / biometric
│   ├── home/                # Vault dashboard, search, category filters
│   ├── passwords/           # Add / edit / delete password entries
│   └── settings/            # Theme, language, biometrics, PIN, wipe
│
├── l10n/                    # ARB localization files
├── my_app.dart              # Root widget
├── main_development.dart    # Development entry point
└── main_production.dart     # Production entry point
```

Each feature follows the `domain / data / presentation` layering:

```
features/auth/
  domain/
    repositories/    # Abstract interfaces
    validators/      # Business rules (PIN validation)
  data/
    models/          # Freezed data models
    repositories/    # Supabase + secure storage implementations
  presentation/
    providers/       # Riverpod state management
    screens/         # Full-page widgets
    widgets/         # Feature-scoped UI components
```

---

## Flavors

The app ships in two flavors:

| Flavor | Entry Point | Purpose |
|---|---|---|
| `development` | `lib/main_development.dart` | Local dev & QA |
| `production` | `lib/main_production.dart` | Release builds |

Flavor-specific behavior is gated through `FlavorConfig` — never hardcoded.

---

## Getting Started

### Prerequisites

- Flutter `>=3.41.0` on the stable channel
- Dart `>=3.11.3`
- A [Supabase](https://supabase.com) project with email/OTP auth enabled

### Setup

```bash
# Clone the repo
git clone https://github.com/<your-org>/vaultly.git
cd vaultly

# Install dependencies
flutter pub get

# Run code generation (Riverpod + Freezed)
dart run build_runner build --delete-conflicting-outputs
```

### Environment Variables

Supabase credentials are injected at build / run time via `--dart-define`. Never commit real keys to version control.

| Variable | Description |
|---|---|
| `SUPABASE_URL` | Your Supabase project URL |
| `SUPABASE_PUBLISHABLE_KEY` | Your Supabase anon/publishable key |

Open `.vscode/launch.json` and fill in your values under each configuration:

```json
{
  "name": "Vaultly Development",
  "request": "launch",
  "type": "dart",
  "program": "lib/main_development.dart",
  "args": [
    "--flavor", "Development",
    "--target", "lib/main_development.dart",
    "--dart-define=SUPABASE_URL=https://xxxx.supabase.co",
    "--dart-define=SUPABASE_PUBLISHABLE_KEY=your-anon-key"
  ]
}
```
---

## Accessibility

All UI meets WCAG 2.1 AA:

- Interactive widgets have `Semantics` labels
- Minimum 48×48 logical pixel touch targets
- RTL layout support for Arabic
