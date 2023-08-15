import 'package:flutter_test/flutter_test.dart';

void main() {
  test("demo", () {
    MyClass("Atom", "22").myClassDoAction();
  });
}

abstract class ClassBase {
  void doAction();
}

class MyClassA {
  String name;
  String age;

  MyClassA(this.name, this.age);

  void doMyClassA() {
    print('MyClassA.doMyClassA name:$name age:$age');
  }
}

class MyClassB {
  String classBName = "classBName";

  void doMyClassB() {
    print('MyClassB.doMyClassB');
  }
}

class MyClassC implements ClassBase {
  void doMyClassC() {
    print('MyClassC.doMyClassC');
  }

  @override
  void doAction() {
    print('MyClassC.doAction');
  }
}

class MyClassD extends ClassBase {
  void doMyClassD() {
    print('MyClassD.doMyClassD');
  }

  @override
  void doAction() {
    print('MyClassD.doAction');
  }
}

mixin MyClassE implements ClassBase {
  void doMyClassE() {
    print('MyClassA.doMyClassE');
  }
}

extension MyClassExtension on MyClass {
  void doMyClassExtension() {
    print('doMyClassExtension');
  }
}

class MyClass extends MyClassA with MyClassB, MyClassC, MyClassE {
  MyClass(String name, String age) : super(name, age);

  @override
  void doMyClassE() {
    super.doMyClassE();
    print('Rewrite MyClass.doMyClassE method.');
  }

  void myClassDoAction() {
    doMyClassA();
    doMyClassB();
    doMyClassC();
//     doMyClassD();
    doMyClassE();
    doMyClassExtension();
    doAction();
  }
}
