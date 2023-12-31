import 'package:shared_preferences/shared_preferences.dart';

const String agreementCollectedPersonalInformationText =
    '본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법] 제15조 및 제17조에 따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.□ 개인정보의 수집 및 이용에 관한 사항\n- 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호,주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 外 이력서 기재 내용일체- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.□ 개인정보의 보관 및 이용 기간- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우[개인정보 보호법] 제21조에 따라 처리합니다.';

class LocalMamanger {
  static Future<void> saveStringData(String? key, String? value) async {
    if (key == null) throw 'NullKey';
    final storage = await SharedPreferences.getInstance();
    await storage.setString(key, value ?? '');
  }

  static Future<String?> getStringData(String? key) async {
    if (key == null) throw 'NullKey';
    final storage = await SharedPreferences.getInstance();
    return storage.getString(key);
  }

  static Future<void> removeData(String? key) async {
    if (key == null) throw 'NullKey';
    final storage = await SharedPreferences.getInstance();
    await storage.remove(key);
  }
}
