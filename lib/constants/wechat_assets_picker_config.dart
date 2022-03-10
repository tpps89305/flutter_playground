import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ChineseTranditionalAssetsPickerTextDelegate
    extends AssetPickerTextDelegate {
  /// Confirm string for the confirm button.
  @override
  String get confirm => '確認';

  /// Cancel string for back button.
  @override
  String get cancel => '取消';

  /// Edit string for edit button.
  @override
  String get edit => '編輯';

  /// GIF indicator string.
  @override
  String get gifIndicator => 'GIF';

  /// HEIC failed string.
  @override
  String get heicNotSupported => '尚未支援HEIC類型資源';

  /// Load failed string for item.
  @override
  String get loadFailed => '讀取失敗';

  /// Original string for original selection.
  @override
  String get original => '原圖';

  /// Preview string for preview button.
  @override
  String get preview => '預覽';

  /// Select string for select button.
  @override
  String get select => '選擇';

  /// Empty list string for empty asset list.
  @override
  String get emptyList => '列表為空';

  /// Un-supported asset type string for assets that
  /// belongs to [AssetType.other].
  @override
  String get unSupportedAssetType => '尚未支援的資源類型';

  /// "Unable to access all assets in album".
  @override
  String get unableToAccessAll => '無法存取所有資源';

  @override
  String get viewingLimitedAssetsTip => '本應用程式只能存取部分資源和相簿';

  @override
  String get changeAccessibleLimitedAssets => '設定可存取的資源';

  @override
  String get accessAllTip => '您已設定本應用程式只能存取本機部分資源，'
      '建議允許存取「所有資源」';

  @override
  String get goToSystemSettings => '前往系統設定';

  /// "Continue accessing some assets".
  @override
  String get accessLimitedAssets => '繼續存取部分資源';

  @override
  String get accessiblePathName => '可存取的資源';
}
