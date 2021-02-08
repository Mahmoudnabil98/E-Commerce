

class CartProductModel {
  
  String name,price,image;
  int quantity;

  CartProductModel({this.name,this.price,this.image,this.quantity});

  CartProductModel.formJson(Map<dynamic,dynamic> map){
    if(map == null){
      return ;
    }
    name= map['name'];
    price =map['price'];
    image =map['image'];
    quantity =map['quantity'];

  }

  toJson(){
   return {
     'name' : name, 
     'image' : image,
      'price': price,
       'quantity' : quantity,


    };
  }
}