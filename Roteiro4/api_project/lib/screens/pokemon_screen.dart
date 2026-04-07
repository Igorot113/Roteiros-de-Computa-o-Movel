import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});
  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _controller = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final PokemonService _pokemonService = PokemonService();
  Pokemon? pokemon;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    searchPokemon('1');
  }

  Future<void> searchPokemon(String term) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      final result = await _pokemonService.fetchPokemon(term);
      setState(() {
        pokemon = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        pokemon = null;
        isLoading = false;
        errorMessage = 'Erro ao buscar Pokémon.';
      });
    }
  }

  Future<void> playCry() async {
    if (pokemon != null && pokemon!.cryUrl.isNotEmpty) {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(pokemon!.cryUrl));
    }
  }

  String formatName(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex com API'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite o nome ou número do Pokémon',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int currentId =
                        pokemon?.id ?? int.tryParse(_controller.text) ?? 1;
                    if (currentId > 1) {
                      int newId = currentId - 1;
                      _controller.text = newId.toString();
                      searchPokemon(newId.toString());
                    }
                  },
                  child: const Text('Anterior'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      searchPokemon(_controller.text);
                    }
                  },
                  child: const Text('Buscar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int currenteId = pokemon?.id ?? int.tryParse(_controller.text) ?? 1;
                    if(currenteId != 0){
                      currenteId ++;
                      _controller.text = currenteId.toString();
                      searchPokemon(currenteId.toString());
                    }
                  },
                  child: const Text('Proximo'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(errorMessage, style: const TextStyle(fontSize: 18)),
              ),
            if (!isLoading && pokemon != null)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formatName(pokemon!.name),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Numero: ${pokemon!.id}',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    if (pokemon!.imageUrl.isNotEmpty)
                      Image.network(pokemon!.imageUrl, height: 220),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: playCry,
                      icon: const Icon(Icons.volume_up),
                      label: const Text('Tocar som'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
