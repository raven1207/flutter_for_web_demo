import 'package:json_annotation/json_annotation.dart';

// import 'package:qingwan_flutter_builder/components/play/play_controller_manager.dart';
// import 'package:qingwan_flutter_builder/components/play/qw_player_scene.dart';

part 'qw_detail_model.g.dart';

// 详情页数据模型
@JsonSerializable(anyMap: true)
class QWDetailModel {
  final String api;
  final QWDetailDataModel data;
  final String v;
  final String platform;

  QWDetailModel(this.api, this.data, this.v, this.platform);

  factory QWDetailModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailModelToJson(this);
}

// 详情页数据data
@JsonSerializable(anyMap: true)
class QWDetailDataModel {
  final List<QWDetailDataCardModel> cardList;
  final QWDetailCreatedModel createUser;
  final String expectedDuration;
  final String liteLineCardNum;
  final String liteLineDescription;
  final String liteLineId;
  final String liteLineTitle;
  // final String picUrl;
  final String headerUrl;
  final String playedCountText;
  final String publishTimeText;
  final String commentCount;

  QWDetailDataModel(
      this.cardList,
      this.expectedDuration,
      this.liteLineCardNum,
      this.liteLineDescription,
      this.liteLineId,
      this.liteLineTitle,
      this.headerUrl,
      this.playedCountText,
      this.publishTimeText,
      this.createUser,
      this.commentCount);

  factory QWDetailDataModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataModelToJson(this);
}
// 详情页卡片数据data cardlist
@JsonSerializable(anyMap: true)
class QWOperatingModel {
  String showCommentIcon;
  @JsonKey(fromJson: _intFromString)
  ///去评论设置
  //游玩几分钟后展示评论
  int playMinuteShowComment;
  //评论提示
  String commentTip;
  //评论按钮
  String commentBtn;
  ///去评论设置

  QWOperatingModel();

  factory QWOperatingModel.fromJson(Map<dynamic, dynamic> json) =>
      _$QWOperatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWOperatingModelToJson(this);

  static int _intFromString(String target) {
    return int.tryParse(target ?? '0');
  }
}

// 详情页卡片数据data cardlist
@JsonSerializable(anyMap: true)
class QWDetailDataCardModel {
  final QWDetailDataGamingModel gaming;
  final String title;
  final String description;
  final String cardType; //
  final String playedCountText;
  final String hasPlayed;
  final String lastPlayed;
  final String isNew;
  final QWDetailDataCardVideoModel video;
  final String litePlayId;
  final String liteLineId; //可能为空
  final QWDetailChallengeModel challenge;
  final QWDetailDataCardTagModel tag;
  final Map<String, dynamic> trackInfo;

  //以下为额外辅助变量，不在接口json里；
  String waitTime;
  String mixUserId;
  String gameSessionId;
  //埋点
  String kPageAB = "default.page";
  String kPageName = "default_page";
  String bottonImg = '';
  String titleImg = '';
  //game 页额外参数 相关埋点
  //游戏状态
  String gamestatus = "0";
  //手柄键位值
  String gamepadkey;
  //当前游戏时长
  String gametime;

  //1是秒开，0不是
  @JsonKey(fromJson: _intFromString)
  int isSecondOn;

  //评论数
  String commentCount;
  //操作
  QWOperatingModel operating;

  bool isChallenge(){
    return challenge != null;
  }

  Map statInfo(Map<String, String> outParams) {
    Map<String, String> result = {
      "albumid": liteLineId ?? "",
      "videoid": video?.liteVideoId ?? "",
      "qingid": litePlayId ?? "",
      "gameid": gaming?.mixGameId ?? "",
      "gamestatus": gamestatus ?? "",
      "gamepadkey": gamepadkey ?? "",
      "gametime": gametime ?? "",
      "playtime":'',
    };
    if (outParams != null) {
      result.addAll(outParams);
    }
    if (trackInfo != null && trackInfo.isNotEmpty) {
      trackInfo.forEach((key, value) {
        result.addAll({key:value.toString()});
      });
    }
    print("QWGamePage:monitor: statInfo params=${result}");
    return result;
  }

  @override
  String toString() {
    return 'QWDetailDataCardModel{gaming: $gaming, title: $title,  description: $description, cardType: $cardType, playedCountText: $playedCountText, hasPlayed: $hasPlayed, lastPlayed: $lastPlayed, video: $video, litePlayId: $litePlayId, liteLineId: $liteLineId, tag: $tag, waitTime: $waitTime, mixUserId: $mixUserId, gameSessionId: $gameSessionId, kPageAB: $kPageAB, kPageName: $kPageName, gamestatus: $gamestatus, gamepadkey: $gamepadkey, gametime: $gametime}';
  }

  QWDetailDataCardModel(
    this.title,
    this.gaming,
    this.description,
    this.cardType,
    this.playedCountText,
    this.hasPlayed,
    this.lastPlayed,
    this.isNew,
    this.video,
    this.litePlayId,
    this.liteLineId,
    this.tag,
    {this.challenge,
      this.trackInfo}
  );

  bool get playable => gaming?.mixGameId?.isNotEmpty ?? false;

  factory QWDetailDataCardModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataCardModelToJson(this);
  static int _intFromString(String target) {
    return int.tryParse(target ?? '0');
  }
}

// 详情页卡片视频信息数据模型
@JsonSerializable(anyMap: true)
class QWDetailDataCardVideoModel {
  List<QWDetailDataCardVideoStreamModel> videoStreams;
  final String coverUrl;
  final String duration;
  final String durationText;
  final String liteVideoId;
  final String videoSourceId;
  bool test_expired = true;

  QWDetailDataCardVideoModel(this.videoStreams, this.coverUrl, this.duration,
      this.durationText, this.liteVideoId, this.videoSourceId);

  String get _videoUrl => videoStreams != null && videoStreams.length > 0
      ? videoStreams.first?.m3u8Url ?? ""
      : '';

  // String get getVideoUrl {
  //   // if (test_expired) {
  //   //   return "http://pl-ali.youku.com/playlist/m3u8?vid=XNDk3ODg0NTgwOA%3D%3D&type=hd&ups_client_netip=6a0bdce3&utid=0000_1606361156_912d49778105e745029f305eb1a361242266e&ccode=084D&psid=912d49778105e745029f305eb1a361242266e&duration=47&expire=18000&drm_type=1&drm_device=0&dyt=1&btf=&rid=2000000092683166DADBFA30EBA3E6D40C7095EA02000000&ups_ts=1606361156&onOff=0&encr=0&ups_key=517493e894fc4ebec8050fd7be9ae614"; //videoStreams != null && videoStreams.length > 0 ? videoStreams.first?.m3u8Url ?? "" : '';
  //   // }
  //
  //   return _videoUrl;
  // }

  String getVideoUrl(scene) {
     if(videoStreams != null && videoStreams.isNotEmpty) {
       if(videoStreams.length == 1) {
         return videoStreams.first?.m3u8Url;
       } else {
         if(true) {
           return videoStreams.first?.m3u8Url;
         } else {
           return videoStreams[1]?.m3u8Url;
         }
       }
     }

     return '';
  }

  ///更新过期的
  void updateVideoStream(QWDetailDataCardVideoStreamModel newModel) {
    videoStreams = [newModel];
    // test_expired = false;
  }

  String get getCoverUrl {
    if (coverUrl != null && coverUrl.length > 0) {
      return coverUrl;
    }
    return '';
  }

  factory QWDetailDataCardVideoModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataCardVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataCardVideoModelToJson(this);
}

// 详情页卡片视频播放流
@JsonSerializable(anyMap: true)
class QWDetailDataCardVideoStreamModel {
  final String height;
  final String width;

  final String m3u8Url;
  final String milliseconds;
  final String streamType;

  ///是否已经过期？
  //http://pl-ali.youku.com/playlist/m3u8?vid=XNDk3ODg0NTgwOA%3D%3D&type=hd&ups_client_netip=6a0bdce3&utid=0000_1606361156_912d49778105e745029f305eb1a361242266e&ccode=084D&psid=912d49778105e745029f305eb1a361242266e&duration=47&expire=18000&drm_type=1&drm_device=0&dyt=1&btf=&rid=2000000092683166DADBFA30EBA3E6D40C7095EA02000000&ups_ts=1606361156&onOff=0&encr=0&ups_key=517493e894fc4ebec8050fd7be9ae614
  bool get isExpired {
    if (m3u8Url == null || m3u8Url.isEmpty) {
      return true;
    }
    Uri uri = Uri.parse(m3u8Url);
    double expire = double.parse(uri.queryParameters["expire"] ?? "0") ?? 0;
    int upsTs = int.parse(uri.queryParameters["ups_ts"] ?? "0") ?? 0;
    int now = DateTime.now().millisecondsSinceEpoch;
    if ((now - upsTs * 1000) > expire * 1000) {
      return true;
    }
    return false;
  }

  QWDetailDataCardVideoStreamModel(this.height, this.width, this.m3u8Url,
      this.milliseconds, this.streamType);

  factory QWDetailDataCardVideoStreamModel.fromJson(
          Map<String, dynamic> json) =>
      _$QWDetailDataCardVideoStreamModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$QWDetailDataCardVideoStreamModelToJson(this);
}

// 详情页卡片标签信息数据模型
@JsonSerializable(anyMap: true)
class QWDetailDataCardTagModel {
  final String tagName;
  final String tagIcon;
  final String targetUrl;
  QWDetailDataCardTagModel(this.tagName, this.tagIcon, this.targetUrl);
  factory QWDetailDataCardTagModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataCardTagModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataCardTagModelToJson(this);
}

//发布者信息
@JsonSerializable(anyMap: true)
class QWDetailCreatedModel {
  final String avatar;
  final String mixUserId;
  final String nickName;
  QWDetailCreatedModel(this.avatar, this.mixUserId, this.nickName);

  factory QWDetailCreatedModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailCreatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailCreatedModelToJson(this);
}

//gaming信息数据
@JsonSerializable(anyMap: true)
class QWDetailDataGamingModel {
  String paasGameId;
  @JsonKey(fromJson: _intFromString)
  int userLevel;
  String mixGameId;
  String paasBizParam;
  String paasControllerId;
  String playType;
  QWDetailDataGamingModel(
      {this.paasGameId = '',
      this.userLevel = 0,
      this.mixGameId = '',
      this.paasBizParam = '',
      this.paasControllerId = '',
      this.playType = ''});

  factory QWDetailDataGamingModel.fromJson(Map<String, dynamic> json) =>
      _$QWDetailDataGamingModelFromJson(json);
  Map<String, dynamic> toJson() => _$QWDetailDataGamingModelToJson(this);
  static int _intFromString(String target) {
    return int.tryParse(target ?? '0');
  }
}

//挑战信息
@JsonSerializable(anyMap: true)
class QWDetailChallengeModel {
  final String challengeId;
  final String challengeTip;

  QWDetailChallengeModel(this.challengeId, this.challengeTip);

  factory QWDetailChallengeModel.fromJson(Map<String, dynamic> json) => _$QWDetailChallengeModelFromJson(json);

  Map<String, dynamic> toJson() => _$QWDetailChallengeModelToJson(this);
}
