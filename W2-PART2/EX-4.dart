//Create shop management class
enum deliverMethod {PICKUP, DELIVER}

//class for address
class Address {
  final String _street;
  final String _city;
  final int _zipCode;

  Address(this._street, this._city, this._zipCode);
  String get street => this._street;
  String get city => this._city;
  int get zipCode => this._zipCode;
}

class Customer {
  final String name;
  final String contact;
  final Address? address;

  Customer({required this.name, required this.contact, this.address});
}

class Product {
  final String productName;
  final double price;
  int quantity;

  Product({required this.productName,required this.price,required this.quantity})
  : assert(quantity >= 0,'Quantity must be possitive.');
}

class ProductOrder {
  final Product product;
  int orderQty;

  ProductOrder({required this.product,required this.orderQty})
  : assert(orderQty > 0,'Order quantity must be atleast 1.');

  double get subTotalPrice => this.product.price * orderQty;

  @override
  String toString() {
    return '${this.product.productName}\t\t\$${this.product.price}\t\t${this.orderQty}\t\t\$${subTotalPrice}';
  }
}

//class for order of each customer
class Order {
  final Customer customer;
  final List<ProductOrder> productOrders;
  final deliverMethod method;

  //set order default to deliver method
  Order({required this.customer, required this.productOrders})
   : assert(customer.address != null,'Delivery required an address.'), this.method = deliverMethod.DELIVER;

  Order.pickUp({required this.customer, required this.productOrders}) : this.method = deliverMethod.PICKUP;

  //add product to order list 
    void addProductOrder(Product product, int qty) {
      if(qty <= product.quantity){
        this.productOrders.add(ProductOrder(product: product, orderQty: qty));
        product.quantity -= qty;
      }else{
        throw Exception('The product ${product.productName} is unavaliable.');
      }
    }
      //method to compute total amount
    double totalAmount() {
      double totalPrice = 0;
      for(var product in this.productOrders) {
        totalPrice += product.subTotalPrice;
      }
      return totalPrice;
    }

    //method to print all the order detail
    void displayOrderDetail() {
      print('================Products order Detail================');
      print('Cust name: ${customer.name}');
      print('Order products:');
      for(var po in productOrders) {
        print(po);
      }
      print('Total Price: \$${totalAmount()}');
    }
  }


void main() {
    Product p1 = Product(productName: 'apple', price: 1.5, quantity: 10);
    Product p2 = Product(productName: 'banana', price: 2.5, quantity: 10);
    Product p3 = Product(productName: 'durain', price: 5, quantity: 10);

    Customer c1 = Customer(name: 'gechty', contact: '088567890');
    Order o1 = Order(customer: c1, productOrders: []);
    o1.addProductOrder(p1, 1);
    o1.addProductOrder(p2, 2);
    o1.addProductOrder(p3, 1);

    o1.displayOrderDetail();
}

