abstract class Tower {
    int x, y, health;
    int range;
    color towerColor;

    Tower(int x, int y, color towerColor, int range) {
        this.x = x;
        this.y = y;
        this.health = 100;
        this.towerColor = towerColor;
        this.range = range;
    }

    abstract void attack(Enemy enemy);

    void attackEnemies() {
        Enemy closestEnemy = null;
        float closestDistance = range;

        for (Enemy enemy : enemies) {
            float distance = dist(x, y, enemy.x, enemy.y);
            if (distance < closestDistance) {
                closestDistance = distance;
                closestEnemy = enemy;
            }
        }

        if (closestEnemy != null) {
            attack(closestEnemy);
            if (closestEnemy.health <= 0) {
                enemies.remove(closestEnemy);
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