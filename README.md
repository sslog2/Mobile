# Mobile

## Como rodar o projeto Flutter

1. Instale o Flutter SDK: https://docs.flutter.dev/get-started/install
2. Instale o Android Studio (para emulador Android) ou Xcode (para iOS/macOS).
3. No terminal, execute:

```
flutter pub get
```

```
flutter run
```

4. Para rodar no Windows/Linux/macOS:

```
flutter run -d windows   # ou linux, macos
```

5. Para rodar na web:

```
flutter run -d chrome
```

## Plugins utilizados

- hive
- hive_flutter
- flutter_rating_bar

### Para gerar os adapters do Hive:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Outros plugins úteis

- http (para requisições HTTP)
- path_provider (usado pelo hive)

---

Se precisar de mais detalhes, consulte a documentação oficial do Flutter ou os arquivos do projeto.