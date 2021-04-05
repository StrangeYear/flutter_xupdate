import 'dart:convert';

//使用Dart Data Class Generator插件进行创建
//使用命令: Generate from JSON
class AppInfo {
  final bool hasUpdate;
  final bool isIgnorable;
  final int versionCode;
  final String versionName;
  final String updateLog;
  final String apkUrl;
  final int? apkSize;

  AppInfo({
    required this.hasUpdate,
    this.isIgnorable = false,
    required this.versionCode,
    required this.versionName,
    required this.updateLog,
    required this.apkUrl,
    this.apkSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasUpdate': hasUpdate,
      'isIgnorable': isIgnorable,
      'versionCode': versionCode,
      'versionName': versionName,
      'updateLog': updateLog,
      'apkUrl': apkUrl,
      'apkSize': apkSize,
    };
  }

  static AppInfo? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return AppInfo(
      hasUpdate: map['hasUpdate'],
      isIgnorable: map['isIgnorable'],
      versionCode: map['versionCode']?.toInt(),
      versionName: map['versionName'],
      updateLog: map['updateLog'],
      apkUrl: map['apkUrl'],
      apkSize: map['apkSize']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static AppInfo? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppInfo hasUpdate: $hasUpdate, isIgnorable: $isIgnorable, versionCode: $versionCode, versionName: $versionName, updateLog: $updateLog, apkUrl: $apkUrl, apkSize: $apkSize';
  }
}
