abstract class Tower {
    int x, y, health;
    int range = 100;
    color towerColor;

    Tower(int x, int y, color towerColor) {
        this.x = x;
        this.y = y;
        this.health = 100;
        this.towerColor = towerColor;
    }

    abstract void attack(Enemy enemy);

    void attackEnemies() {
        for (int i = enemies.size() - 1; i >= 0; i--) {
            Enemy enemy = enemies.get(i);
            float distance = dist(x, y, enemy.x, enemy.y);

            if (distance < range) {
                attack(enemy);
                if (enemy.health <= 0) {
                    enemies.remove(i);
                }
            }
        }
    }

    void display() {
        fill(towerColor);
        rect(x, y, 30, 30);
        fill(255, 0, 0);
        rect(x, y - 10, health / 2, 5);
    }
}