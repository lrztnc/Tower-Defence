public class Player {
    private String name;
    private int coins;
    private int life;

    public Player(String inputName, int inputStartingCoins, int inputStartingLifes) {
        this.name = inputName;
        this.coins = inputStartingCoins;
        this.life = inputStartingLifes;
    }

    public String getName() {
        return name;
    }

    public int getCoins() {
        return coins;
    }

    public int getLifes() {
        return life;
    }

    // Guadagnare monete
    public void earnCoins(int quantity) {
        this.coins += quantity;
    }

    // Spend coins
    public boolean spendCoins(int cost) {
        if (this.coins >= cost) {
            this.coins -= cost;
            return true;
        }else{
            System.out.println("You don't have enough founds!");
            return false;
        }
    }

    public void looseLife() {
        if (this.life > 0) {
            this.life--;
        }
    }

    public boolean gameOver() {
        return this.life <= 0;
    }

    
}
