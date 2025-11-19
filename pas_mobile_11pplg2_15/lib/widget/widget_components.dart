import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final String input;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumberOnly;
  const CustomInput({super.key, required this.input, required this.controller, required this.isPassword, this.isNumberOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        keyboardType: isNumberOnly ? TextInputType.number : TextInputType.text,
        textAlign: TextAlign.start,
        inputFormatters: isNumberOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: input,
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const CustomButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
          )),
      ),
    );
  }
}

class ShowCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onBookmark;

  const ShowCard({
    super.key,
    required this.title,
    required this.image,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: ListTile(
          leading: Image.network(image, height: 100, width: 70, fit: BoxFit.cover,),
          title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: IconButton(
            icon: Icon(Icons.bookmark_add, color: Colors.deepPurple),
            onPressed: onBookmark,
        ),
      ),
      )
      
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Map item;
  final VoidCallback onDelete;

  const FavoriteCard({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        leading: Image.network(
          item['image'] ?? "https://via.placeholder.com/60", 
          width: 60,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),),
        title: Text(item['title'] ?? "No title"),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

