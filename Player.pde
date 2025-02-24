class Player {
    int money;

    Player() {
        this.money = 100;
    }

    void display() {
        fill(255);
        text("Money: " + money, 10, 20);
    }

    void placeTower(int x, int y, BattleField battlefield) {
        if (money >= 20) {
            battlefield.addTower(new PowerfulTower(x, y));
            money -= 20;
        }
    }
}
