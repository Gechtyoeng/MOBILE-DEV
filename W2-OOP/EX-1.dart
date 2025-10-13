enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills; //list of skill
  final Address _address;
  int _yearOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearOfExperience);
  
  //named consstructor for mobile developer
  Employee.mobileDev(this._name, this._baseSalary, this._address, this._yearOfExperience) 
      : _skills = [Skill.DART, Skill.FLUTTER];
  
  //getter method
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  //method for commpute the salary detail
  double computeSalary(){
    var totalSalary = baseSalary + (yearOfExperience * 2000);
    var bonus = 0;

    for(var skill in skills) {
      switch(skill) {
        case Skill.DART:
          bonus += 3000;
          break;
        case Skill.FLUTTER:
          bonus += 5000;
          break;
        case Skill.OTHER:
          bonus += 1000;
          break;
      }
    }

    totalSalary += bonus;
    return totalSalary;
  }
  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, Total salary: \$${this.computeSalary()}');
  }
}

//class for address
class Address {
  String street;
  String city;
  int zipCode;

  Address({required this.street, required this.city, required this.zipCode});

}

void main() {
  Address ad1 = Address(street: 'kaixin', zipCode: 101010, city: 'kampot');
  var emp1 = Employee('Sokea', 40000, [Skill.DART, Skill.FLUTTER], ad1, 2);
  emp1.printDetails();
  
  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();
}