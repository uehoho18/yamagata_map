# yamagata_map

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## テスト

### 方針

- Widget テスト、Unit テストを対象とする
- Integration テストは当面対象外
- 基本的な動作はレビューで担保可能であること、メンテナンスコストが高いため

### Widget テスト

- テストケース
  - 指定したパラメーターが反映されること
  - 動作のチェック(ボタンタップ等)
- フォントや色など UI に関するチェックは対象外(目視でチェック)
- ChatGPT によりベースを生成して、必要に応じて修正するアプローチを推奨
