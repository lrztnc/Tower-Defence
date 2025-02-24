public class Main {
    public static void main(String[] args) {
        Player player = new Player("Hero", 100, 3);
        Game game = new Game(player);

        Tower tower1 = new StandardTower();
        Tower tower2 = new PowerfulTower();

        game.getBattleField().placeTower(tower1);
        game.getBattleField().placeTower(tower2);

        game.start();
    }
}