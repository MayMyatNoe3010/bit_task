import 'package:bit_task/core/base_widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncDataHandler<T> extends ConsumerWidget {
  final AsyncValue<T> value;
  final Widget Function(BuildContext, T) onData;

  AsyncDataHandler({super.key, required this.value, required this.onData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: (data) => onData(context, data),
      error: (error, stackTrace) {
        return CustomErrorWidget(lbError: error.toString(), color: Colors.red);
      },
      loading: () {
        return Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Loading')
            ]
          ),
        );
      },
    );
  }
}
