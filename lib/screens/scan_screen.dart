
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();

  final List<XFile> _selectedImages = [];

  // TAKE PHOTO USING CAMERA
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85,
      );

      if (!mounted || image == null) return;

      setState(() {
        _selectedImages.add(image);
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error taking photo: $e'),
        ),
      );
    }
  }

  // SELECT MULTIPLE IMAGES FROM GALLERY
  Future<void> _pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
      );

      if (!mounted || images.isEmpty) return;

      setState(() {
        _selectedImages.addAll(images);
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting images: $e'),
        ),
      );
    }
  }

  // REMOVE A SELECTED IMAGE
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF256B45);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Rice Plant'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Upload Rice Plant Images',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Take photos of your rice plant or select '
                    'multiple images from your gallery.',
              ),

              const SizedBox(height: 12),

              Text(
                'Selected Images: ${_selectedImages.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryGreen,
                ),
              ),

              const SizedBox(height: 16),

              // MULTIPLE IMAGE PREVIEW
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF4EC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: _selectedImages.isEmpty
                      ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 80,
                          color: primaryGreen,
                        ),
                        SizedBox(height: 12),
                        Text('No Images Selected'),
                      ],
                    ),
                  )
                      : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _selectedImages.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(_selectedImages[index].path),
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton.filled(
                              onPressed: () => _removeImage(index),
                              icon: const Icon(
                                Icons.close,
                                size: 18,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CAMERA BUTTON
              OutlinedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo'),
              ),

              const SizedBox(height: 12),

              // MULTIPLE GALLERY SELECTION
              OutlinedButton.icon(
                onPressed: _pickMultipleImages,
                icon: const Icon(Icons.photo_library),
                label: const Text('Choose from Gallery'),
              ),

              const SizedBox(height: 12),

              // ANALYZE BUTTON
              FilledButton.icon(
                onPressed: _selectedImages.isEmpty
                    ? null
                    : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'AI model not yet integrated.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.analytics),
                label: const Text('Analyze Images'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
