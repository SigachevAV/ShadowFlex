
import 'package:flutter_test/flutter_test.dart';

import 'package:shadow_flex/models/info_models/matrix.dart';
import 'package:shadow_flex/models/info_models/spell.dart';

void main() {
  test("matrixInfoMapFromJson", () {
    var actual = matrixInfoMapFromJson("{\"MAJOR\":[{\"id\":2,\"name\":\"Войти через бэкдор\"},{\"id\":4,\"name\":\"1\"}],\"MINOR\":[{\"id\":3,\"name\":\"Переключить режим интерфейса\"}]}");
  });

  test("spellInfoMapFromJson", () {
    spellInfoMapFromJson("{\"ILL\":[{\"id\":5,\"name\":\"2\"}],\"DET\":[{\"id\":3,\"name\":\"Анализ магии\"},{\"id\":4,\"name\":\"1\"}],\"COM\":[{\"id\":2,\"name\":\"Кислотный поток\"}]}");
  });
}