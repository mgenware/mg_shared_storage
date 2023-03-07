import '../channels.dart';
import 'document_file.dart';

/// Helper method to invoke a native SAF method and return a document file
/// if not null, shouldn't be called directly from non-package code
Future<DocumentFile?> invokeMapMethod(
  String method,
  Map<String, dynamic> args,
) async {
  final Map<String, dynamic>? documentMap =
      await kDocumentFileChannel.invokeMapMethod<String, dynamic>(method, args);

  if (documentMap == null) return null;

  return DocumentFile.fromMap(documentMap);
}

Future<List<DocumentFile>?> invokeListMethod(
  String method,
  Map<String, dynamic> args,
) async {
  final List<Map<dynamic, dynamic>?>? documentList = await kDocumentFileChannel
      .invokeListMethod<Map<dynamic, dynamic>?>(method, args);

  if (documentList == null) return null;

  final List<DocumentFile> res = [];
  for (final Map<dynamic, dynamic>? map in documentList) {
    if (map != null) {
      res.add(DocumentFile.fromMap(map));
    }
  }

  return res;
}
