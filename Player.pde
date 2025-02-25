class Player {
    int money;

    Player() {
        this.money = 50; 

    void display() {
        fill(255);
        text("Money: " + money, 10, 20);
    }

    void placeTower(int x, int y, BattleField battlefield, String type) {
        if (type.equals("standard") && money >= 15) {
            battlefield.addTower(new StandardTower(x, y));
            money -= 15;
        } else if (type.equals("powerful") && money >= 30) {
            battlefield.addTower(new PowerfulTower(x, y));
            money -= 30;
        }
    }

    void earnMoney(int amount) {
        money += amount;
    }
}