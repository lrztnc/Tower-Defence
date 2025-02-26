abstract class Enemy {
    float x, y; 
    int health;
    float speed;
    color enemyColor;
    int damage; 
    float attackRange; 

    Enemy(int x, int y, int health, float speed, color enemyColor, int damage, float attackRange) {
        this.x = x;
        this.y = y;
        this.health = health;
        this.speed = speed;
        this.enemyColor = enemyColor;
        this.damage = damage;
        this.attackRange = attackRange;
    }

    void move() {
        x += speed;
        
        for (Tower tower : towers) {
            float distance = dist(x, y, tower.x, tower.y);
            if (distance < attackRange) {
                tower.health -= damage;
            }
        }
    }

    void display() {
        fill(enemyColor);
        ellipse(x, y, 20, 20);
        fill(0, 255, 0);
        rect(x - 10, y - 15, health / 10, 5);
    }
}