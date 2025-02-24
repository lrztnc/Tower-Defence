class BattleField {
    ArrayList<Tower> towers;

    BattleField() {
        towers = new ArrayList<>();
    }

    void display() {
        fill(150, 200, 150);
        rect(0, 0, width, height);

        for (Tower tower : towers) {
            tower.display();
            tower.attackEnemies();
        }
    }

    void addTower(Tower tower) {
        towers.add(tower);
    }

    boolean hasLost() {
        for (Tower tower : towers) {
            if (tower.health <= 0) {
                return true;
            }
        }
        return false;
    }
}