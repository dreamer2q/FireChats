import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({
    Key? key,
    required this.error,
    this.stackTrace,
  }) : super(key: key);

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Text('$error'),
            if (stackTrace != null) Text('$stackTrace'),
          ],
        ),
      ),
    );
  }
}

class LoadingErrorPage extends StatelessWidget {
  const LoadingErrorPage({
    Key? key,
    required this.error,
    required this.stackTrace,
  }) : super(key: key);

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$error',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            if (stackTrace != null)
              Text(
                '$stackTrace',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
