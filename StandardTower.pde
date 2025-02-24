class StandardTower extends Tower {
    StandardTower(int x, int y) {
        super(x, y);
    }

    void attack(Enemy enemy) {
        enemy.health -= 10; // Infligge meno danni rispetto alla PowerfulTower
    }

    void display() {
        fill(0, 255, 0); // Verde per distinguerla
        rect(x, y, 30, 30);
    }
}