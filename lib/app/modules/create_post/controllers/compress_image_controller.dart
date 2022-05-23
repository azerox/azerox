import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_compression/image_compression.dart';

class CompressImageController extends ValueNotifier<CompressImageState> {
  CompressImageController() : super(CompressImageState.empty);

  Future<void> compressImage(Uint8List fileBytes, String filePath) async {
    try {
      _setLoading(true);
      final configuration = ImageFileConfiguration(
        input: ImageFile(rawBytes: fileBytes, filePath: filePath),
        config: const Configuration(
          pngCompression: PngCompression.defaultCompression,
          jpgQuality: 60,
        ),
      );
      var compressedImage = await compute(compress, configuration);
      final compressedFilePath = filePath;
      await File(compressedFilePath).writeAsBytes(compressedImage.rawBytes);
      value = value.copyWith(filePath: compressedFilePath, isLoading: false);
    } catch (ex, stack) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool isLoading) =>
      value = value.copyWith(isLoading: isLoading);
}

class CompressImageState {
  final String? filePath;
  final bool isLoading;

  const CompressImageState({
    required this.filePath,
    required this.isLoading,
  });

  static const empty = CompressImageState(
    filePath: null,
    isLoading: false,
  );

  CompressImageState copyWith({
    String? filePath,
    bool? isLoading,
  }) {
    return CompressImageState(
      filePath: filePath ?? this.filePath,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompressImageState &&
        other.filePath == filePath &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => filePath.hashCode ^ isLoading.hashCode;
}
