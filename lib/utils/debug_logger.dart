class DebugLogger {
  static final DebugLogger _instance = DebugLogger._internal();
  DateTime? _lastCallTime; // Время последнего вызова
  int _callCount = 0;      // Счетчик вызовов

  // Закрытый конструктор
  DebugLogger._internal();

  // Фабричный конструктор для предоставления единственного экземпляра
  factory DebugLogger() => _instance;

  /// Логирует текст и время, прошедшее с последнего вызова
  void log([String? text]) {
    DateTime now = DateTime.now();

    // Вычисляем прошедшее время
    int elapsedMilliseconds = _lastCallTime != null
        ? now.difference(_lastCallTime!).inMilliseconds
        : 0;

    // Обновляем время последнего вызова
    _lastCallTime = now;

    // Увеличиваем счетчик вызовов
    _callCount++;

    // Выводим в консоль
    String output = text ?? "Call #$_callCount";
    print("$output (Elapsed time: ${elapsedMilliseconds}ms)");
  }
}
