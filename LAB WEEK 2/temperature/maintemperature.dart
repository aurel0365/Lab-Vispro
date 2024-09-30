class konversi {
  double Celcius;

  konversi(this.Celcius);

  double Fahrenheit() {
    return (Celcius * 9 / 5) + 32;
  }
  double Reaumur() {
    return Celcius * 0.8;
  }
  double Kelvin() {
    return Celcius + 273.15;
  }
}
