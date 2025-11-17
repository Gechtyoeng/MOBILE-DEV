main(){
// Define a function that takes two integers and returns their sum
int sum(int num1, int num2) =>  num1 + num2;

// Call the function and print the result
print(sum(1,2));


// Define a function that uses positional arguments
double afterDiscount(double totalPrice, double discountRate) => totalPrice * (1 - discountRate);

// Define another function that uses named arguments with the required keyword (ex: getArea with rectangle arguments)
double getArea({required double width, required double height}) => width * height;
// Call both functions with appropriate arguments
print(afterDiscount(20, 0.1));
print(getArea(height: 20, width: 30));
}