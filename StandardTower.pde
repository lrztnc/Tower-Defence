class StandardTower extends Tower {
    StandardTower(int x, int y) {
        super(x, y, color(0, 255, 0)); // Verde
    }

    void attack(Enemy enemy) {
        enemy.health -= 10;
    }
}