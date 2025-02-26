class Player {
    int money;

    Player() {
        this.money = 250; 
    }
    
    void display() {
        fill(255);
        text("Money: " + money, 10, 20);
    
    }

    Tower placeTower(int x, int y, BattleField battlefield, String type) {
       
        if (battlefield.isValidPosition(x, y)) {
            if (type.equals("standard") && money >= 50) {
                money -= 50;
                return new StandardTower(x, y); 
            }
            else if (type.equals("powerful") && money >= 100) {
                money -= 100;
                return new PowerfulTower(x, y); 
            }
        }
        return null; 
    }

    void earnMoney(int amount) {
        money += amount;
    }
}