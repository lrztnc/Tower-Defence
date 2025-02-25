class Coordinates {
  float x, y;

  Coordinates(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void set(float newX, float newY) {
    this.x = newX;
    this.y = newY;
  }

  float distanza(Coordinates altra) {
    return dist(this.x, this.y, altra.x, altra.y);
  }

  void display() {
    ellipse(this.x, this.y, 10, 10);
  }
}