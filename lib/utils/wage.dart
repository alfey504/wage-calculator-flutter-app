class Wage {
  double basePay = 0.0;
  double overtimePay = 0.0;
  double totalPay = 0.0;
  double tax = 0.0;

  Wage() {
    basePay = 0.0;
    overtimePay = 0.0;
    totalPay = 0.0;
    tax = 0.0;
  }
  void reset() {
    basePay = 0.0;
    overtimePay = 0.0;
    totalPay = 0.0;
    tax = 0.0;
  }

  void setWage(String wagePerHour, String hours) {
    reset();
    double tempWagePerHour = double.parse(wagePerHour);
    double tempHours = double.parse(hours);

    if (tempHours > 40.0) {
      overtimePay = (tempHours - 40.0) * (tempWagePerHour * 1.5);
      basePay = (40.0 * tempWagePerHour);
    } else {
      basePay = tempWagePerHour * tempHours;
    }

    totalPay = basePay + overtimePay;
    tax = totalPay * 0.18;
  }

  static bool isNumber(String string) {
    if (string == "") {
      return (true);
    }

    try {
      double.parse(string);
    } catch (e) {
      return (false);
    }

    return (true);
  }
}
