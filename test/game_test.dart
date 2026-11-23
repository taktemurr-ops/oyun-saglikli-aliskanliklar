import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_saglikli_aliskanliklar/oyun_saglikli_aliskanliklar.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(saglikliConfig.title.length, 33);
    expect(saglikliConfig.tagline.length, 33);
    for (final s in saglikliConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(saglikliConfig.gameId, saglikliId);
    expect(saglikliRules.gameId, saglikliId);
    expect(saglikliConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(saglikliRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: saglikliId, optionalMechanics: saglikliRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(saglikliRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
