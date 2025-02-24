public class Game {
 private Player player;
 private BattleField battleField;
 private int level;
 
 public Game(Player player) {
    this.player = player;
    this.battleField = new BattleField();
    this.level = 1;
 }

 public void start(){
    System.out.println("Game started");
    while (!player.gameOver()) {
        System.out.println("Level: " + level);
        Wave wave = new Wave(level + 2); 
        battleField.defend(wave);
        level++;
    }
    System.out.println("Game over");
 }
}