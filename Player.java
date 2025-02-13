public class Player {
    private String name;
    private int coins;
    private int life;

    public Player(String inputName, int inputStartingCoins, int inputStartingLifes) {
        this.name = inputName;
        this.coins = inputStartingCoins;
        this.life = inputStartingLifes;
    }

    // Guadagnare monete
    public void earnCoins(int quantity) {
        this.coins += quantity;
    }

  



        

}