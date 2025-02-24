abstract class Enemy {
    int x, y, health, speed;

    Enemy(int x, int y, int health, int speed) {
        this.x = x;
        this.y = y;
        this.health = health;
        this.speed = speed;
    }

    void move() {
        x += speed;
    }

    void display() {
        fill(255, 0, 0);
        ellipse(x, y, 20, 20);
    }
}