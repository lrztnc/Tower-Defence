abstract class Enemy {
    float x, y; 
    int health;
    float speed;
    color enemyColor;

    Enemy(int x, int y, int health, float speed, color enemyColor) {
        this.x = x;
        this.y = y;
        this.health = health;
        this.speed = speed;
        this.enemyColor = enemyColor;
    }

    void move() {
        x += speed; 
    }

    void display() {
        fill(enemyColor);
        ellipse(x, y, 20, 20);
        fill(0, 255, 0);
        rect(x - 10, y - 15, health / 10, 5);
    }
}