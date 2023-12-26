import 'package:flutter/material.dart';

import '../models/CountryModel.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key, this.setCountryData}):super(key: key);
  final Function? setCountryData;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel>countries=[

    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),

    CountryModel(name: "France", code: "+33", flag: "🇫🇷"),
    CountryModel(name: "Germany", code: "+49", flag: "🇩🇪"),
    CountryModel(name: "Spain", code: "+34", flag: "🇪🇸"),
    CountryModel(name: "Japan", code: "+81", flag: "🇯🇵"),
    CountryModel(name: "Australia", code: "+61", flag: "🇦🇺"),
    CountryModel(name: "Brazil", code: "+55", flag: "🇧🇷"),
    CountryModel(name: "Canada", code: "+1", flag: "🇨🇦"),
    CountryModel(name: "China", code: "+86", flag: "🇨🇳"),
    CountryModel(name: "Mexico", code: "+52", flag: "🇲🇽"),
    CountryModel(name: "Netherlands", code: "+31", flag: "🇳🇱"),
    CountryModel(name: "Russia", code: "+7", flag: "🇷🇺"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          color: Colors.blue,
          ),
        ),
        title: Text('Select Country',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          wordSpacing: 1,
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.blue,
            ),onPressed:(){} ,
          ),
        ],

      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder:(context,index)=>
      card(countries[index])),
    );
  }

  Widget card(CountryModel country) {
    return InkWell(
      onTap: (){
        widget.setCountryData!(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Row(
            children: [
              Text(country.flag!),
              SizedBox(
                width: 15,
              ),
              Text(country.name!),
              Expanded(
                child: Container(
                    width:150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(country.code!),
                      ],
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
