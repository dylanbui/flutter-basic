/*
 * Created with IntelliJ IDEA
 * Package: widget
 * User: admin
 * Email: duc@propzy.com
 * Date: 6/22/22 - 1:05 AM
 * To change this template use File | Settings | File Templates.
 */

final Map<String, Object> appSettings = {
  "dev": _dev,
  "test": _test,
  "release": _release
};

final Map<String, Object> _dev = {
  "baseUrl": "value1",
  "baseImageUploadUrl": "value2",
  "baseVideoUploadUrl": "value2",
  "urlDealActivitiesHistory": "value2",
  "serverFirebase": "value2",
  "serverKeyFirebase": "value2"
};

final Map<String, Object> _test = {
  "baseUrl": "value1",
  "baseImageUploadUrl": "value2",
  "baseVideoUploadUrl": "value2",
  "urlDealActivitiesHistory": "value2",
  "serverFirebase": "value2",
  "serverKeyFirebase": "value2"
};

final Map<String, Object> _release = {
  "baseUrl": "value1",
  "baseImageUploadUrl": "value2",
  "baseVideoUploadUrl": "value2",
  "urlDealActivitiesHistory": "value2",
  "serverFirebase": "value2",
  "serverKeyFirebase": "value2"
};

class AppConfig {

  String baseUrl;
  String baseImageUploadUrl;
  String baseVideoUploadUrl;
  String urlDealActivitiesHistory;
  String serverFirebase;
  String serverKeyFirebase;

  AppConfig(this.baseUrl,
      this.baseImageUploadUrl,
      this.baseVideoUploadUrl,
      this.urlDealActivitiesHistory,
      this.serverFirebase,
      this.serverKeyFirebase);

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      json['baseUrl'] as String,
      json['baseImageUploadUrl'] as String,
      json['baseVideoUploadUrl'] as String,
      json['urlDealActivitiesHistory'] as String,
      json['serverFirebase'] as String,
      json['serverKeyFirebase'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'baseUrl': baseUrl,
      'baseImageUploadUrl': baseImageUploadUrl,
      'baseVideoUploadUrl': baseVideoUploadUrl,
      'urlDealActivitiesHistory': urlDealActivitiesHistory,
      'serverFirebase': serverFirebase,
      'serverKeyFirebase': serverKeyFirebase,
    };
  }

}