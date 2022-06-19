import 'package:flutter/material.dart';
import 'package:flutter_adsmob/models/city.dart';
import 'package:flutter_adsmob/provider/citys.dart';
import 'package:provider/provider.dart';

class CityForm extends StatefulWidget {
  const CityForm({Key? key}) : super(key: key);

  @override
  State<CityForm> createState() => _CityFormState();
}

class _CityFormState extends State<CityForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(City city) {
    _formData['id'] = city.id!;
    _formData['name'] = city.name;
    _formData['state'] = city.state;
    _formData['cityUrl'] = city.cityUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final city = ModalRoute.of(context)?.settings.arguments as City;
    _loadFormData(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Municípios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<Citys>(context, listen: false).put(
                  City(
                    id: _formData['id'],
                    name: _formData['name']!,
                    state: _formData['state']!,
                    cityUrl: _formData['cityUrl']!,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['state'],
                decoration: const InputDecoration(labelText: 'Estado'),
                onSaved: (value) => _formData['state'] = value!,
              ),
              TextFormField(
                initialValue: _formData['cityUrl'],
                decoration: const InputDecoration(labelText: 'URL do gif do Município'),
                onSaved: (value) => _formData['cityUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
