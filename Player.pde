class Player {
    int money;

    Player() {
        this.money = 100;
    }

    void display() {
        fill(255);
        text("Money: " + money, 10, 20);
    }

    void placeTower(int x, int y, BattleField battlefield, String type) {
        if (type.equals("standard") && money >= 10) {
            battlefield.addTower(new StandardTower(x, y));
            money -= 10;
        } else if (type.equals("powerful") && money >= 20) {
            battlefield.addTower(new PowerfulTower(x, y));
            money -= 20;
        }
    }
}