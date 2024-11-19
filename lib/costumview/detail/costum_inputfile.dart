import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

class CostumInputFile extends StatefulWidget {
  final String label;
  final Function(File) onFilePicked;

  const CostumInputFile({
    super.key,
    required this.label,
    required this.onFilePicked,
  });

  @override
  State<CostumInputFile> createState() => _CostumInputFileState();
}

class _CostumInputFileState extends State<CostumInputFile> {
  File? _selectedFile;

  Future<void> _onFilePicked() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      withData: true,
    );

    if (result != null) {
      if (kIsWeb) {
        Uint8List? data = result.files.single.bytes;
        if (data != null) {
          print("File yang dipilih dengan bytes, size: ${data.lengthInBytes}");
        }
      } else {
        String? filePath = result.files.single.path;
        if (filePath != null) {
          setState(() {
            _selectedFile = File(filePath);
          });
          widget.onFilePicked(_selectedFile!);

          print("Nama file yang dipilih : ${_selectedFile!.path.split('/').last}");
        }
      }
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _onFilePicked,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedFile != null ? _selectedFile!.path.split('/').last : "File",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(Icons.attach_file, color: Colors.grey),
              ],
            ),
          ),
        ),
        if (_selectedFile != null) // Teks yang akan ditampilkan jika file terpilih
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Selected File: ${_selectedFile!.path.split('/').last}',
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
          ),
      ],
    );
  }
}
