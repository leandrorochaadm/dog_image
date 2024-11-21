import 'package:dog/presenter/notifiers/dog_image_notifier.dart';
import 'package:dog/presenter/states/dog_image_state.dart';
import 'package:flutter/material.dart';

class DogImagePage extends StatelessWidget {
  const DogImagePage({super.key, required this.notifier});

  final DogImageNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: notifier,
                builder: (_, state, __) {
                  if (state.status == DogImageStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.status == DogImageStatus.error) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state.status == DogImageStatus.success) {
                    return Image.network(
                      state.imageUrl,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text(
                            'Não foi possível renderizar imagem',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Text(
                      'Nenhuma imagem disponível',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: notifier.load,
                    child: const Text('Obter nova imagem'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
