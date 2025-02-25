class PowerfulTower extends Tower {
    PowerfulTower(int x, int y) {
        super(x, y, color(0, 0, 255)); // Blu
    }

    void attack(Enemy enemy) {
        enemy.health -= 20;
    }
}