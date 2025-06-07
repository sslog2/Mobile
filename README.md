# Mobile

## Integrantes

- José Matheus Mendonça Farias
- Márcio Souto Maior Sousa
- José Liedson da Silva
- Maria Clara Lau Santos

---

## Como rodar o projeto Flutter

### 1. Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Android Studio (para emulador Android) **ou** Xcode (para iOS/macOS)
- (Opcional) Visual Studio Code ou outro editor de sua preferência

### 2. Instale as dependências

No terminal, execute:

```
flutter pub get
```

### 3. Execute o projeto

Para rodar no emulador ou dispositivo físico:

```
flutter run
```
---

## Plugins utilizados

- [hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- [http](https://pub.dev/packages/http) (para requisições HTTP)
- [path_provider](https://pub.dev/packages/path_provider) (usado pelo Hive)

### Gerando os adapters do Hive

Sempre que criar ou alterar um model anotado com HiveType/HiveField, gere os adapters com:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Dicas e documentação

- Consulte a [documentação oficial do Flutter](https://docs.flutter.dev/) para mais detalhes.
- Veja os arquivos do projeto para exemplos de uso dos plugins e organização do código.

---
<div align="center">
<img src="https://github.com/user-attachments/assets/fe00045b-6bc9-4ffc-a47d-68df75ace6db" width="1000px" />
</div>
