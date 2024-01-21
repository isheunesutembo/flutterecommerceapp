
import 'package:ephamarcy/controllers/addresscontroller.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditAddressPage extends ConsumerStatefulWidget {
  const EditAddressPage({super.key});

  @override
  ConsumerState<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends ConsumerState<EditAddressPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _houseNumber = TextEditingController();
  TextEditingController _zipCode = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _city.dispose();
    _address.dispose();
    _houseNumber.dispose();
    _zipCode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final address = ref.watch(getUserAddress);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: address.when(
            data: (data) {
              _city = TextEditingController(text: data.city);
              _address = TextEditingController(text: data.address);
              _houseNumber = TextEditingController(text: data.houseNo);
              _zipCode = TextEditingController(text: data.zipCode.toString());
              return SafeArea(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _houseNumber,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _houseNumber.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'house number',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.house,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid house address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _city,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _city.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'city',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.house,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid house address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _address,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _address.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'address',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.house,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid city address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _zipCode,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _zipCode.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'zip code',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.house,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid city address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ref
                                .watch(addressContollerProvider.notifier)
                                .updateAddress(
                                    context,
                                    _address.text,
                                    _city.text,
                                    _houseNumber.text,
                                    int.parse(_zipCode.text));
                            Navigator.pop(context);
                          },
                          child: const Text("Edit Address"),
                        ))
                  ]),
                ),
              ));
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()));
  }
}
