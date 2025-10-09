void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const orders = ['margherita', 'pepperoni', 'pineapple'];
 
  // Your code
  double totalPrice = 0;
    for(var order in orders){
      if(pizzaPrices.containsKey(order)){
        totalPrice += pizzaPrices[order]!;
      }else{
        print("$order is not on the menu.");
      }
    }

  print("The total price is \$ $totalPrice");
}
