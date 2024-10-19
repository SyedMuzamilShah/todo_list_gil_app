import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/providers/task_add_provider.dart';

class ImageShow extends StatelessWidget {
  final Uint8List? imageFile;

  const ImageShow({
    super.key,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    final imageChangeFunction = context.read<TaskAddProvider>();
    // Display the image from the local file if available; otherwise, show a SizedBox image
    return imageFile != null
        ? SizedBox(
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.memory(
                    imageFile!,
                    fit: BoxFit.fill,
                  ),
                ),
                // Positioned edit icon at the top right corner
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () => imageChangeFunction.pickImageFromGallery(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
