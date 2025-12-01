import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';

class GlobalErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;
  final bool withScaffold;

  const GlobalErrorWidget({
    super.key,
    required this.details,
    this.withScaffold = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              details.exceptionAsString(),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );

    if (withScaffold) {
      return CustomScaffold(title: 'Error', child: content);
    }

    return content;
  }
}
