class Coordinates {
  float x, y;

  // Costruttore
  Coordinates(float x, float y) {
    this.x = x;
    this.y = y;
  }

  // Metodo per aggiornare le coordinate
  void set(float newX, float newY) {
    this.x = newX;
    this.y = newY;
  }

  // Metodo per ottenere la distanza tra due coordinate
  float distanza(Coordinates altra) {
    return dist(this.x, this.y, altra.x, altra.y);
  }

  // Metodo per visualizzare il punto
  void display() {
    ellipse(this.x, this.y, 10, 10);
  }
}