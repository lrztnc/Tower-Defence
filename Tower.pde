abstract class Tower {
    int x, y, health;
    int range = 100; // Raggio di attacco della torre

    Tower(int x, int y) {
        this.x = x;
        this.y = y;
        this.health = 100;
    }

    abstract void attack(Enemy enemy);

    void attackEnemies() {
        for (int i = enemies.size() - 1; i >= 0; i--) {
            Enemy enemy = enemies.get(i);
            float distance = dist(x, y, enemy.x, enemy.y);

            if (distance < range) { // Se il nemico è nel raggio d'azione
                attack(enemy);
                if (enemy.health <= 0) {
                    enemies.remove(i); // Rimuovi nemico se la vita è zero
                }
            }
        }
    }

    void display() {
        fill(0, 0, 255);
        rect(x, y, 30, 30);
        fill(255, 0, 0);
        rect(x, y - 10, health / 2, 5);
    }
}