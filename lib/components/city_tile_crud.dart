import 'package:flutter/material.dart';
import 'package:flutter_adsmob/models/city.dart';
import 'package:flutter_adsmob/provider/citys.dart';
import 'package:flutter_adsmob/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CityTile extends StatelessWidget {
  final City? city;

  const CityTile(
    this.city, {
    Key? key,
  }) : super(key: key);
  
  get child => null;

  @override
  Widget build(BuildContext context) {
    final group = city!.cityUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.add_location_alt_sharp))
        : CircleAvatar(backgroundImage: NetworkImage(city!.cityUrl));
    return ListTile(
      leading: group,
      title: Text(city!.name),
      subtitle: Text(city!.state),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.cityForm,
                  arguments: city,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Município'),
                    content: const Text('Tem certeza???'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Citys>(context, listen: false).remove(city!);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
