class PowerfulTower extends Tower {
    PowerfulTower(int x, int y) {
        super(x, y);
    }

    void attack(Enemy enemy) {
        enemy.health -= 20; // Infligge più danni
    }

    void display() {
        fill(0, 0, 255); // Blu per distinguere
        rect(x, y, 30, 30);
    }
}