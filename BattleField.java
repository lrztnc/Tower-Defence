import java.util.ArrayList;
import java.util.List;

public class BattleField {
    private List<Tower> towers;

    public BattleField() {
        this.towers = new ArrayList<>();
    }

    public void placeTower(Tower tower) {
        towers.add(tower);
        System.out.println("Tower " + tower.getName() + " placed on the battle field.");
    }

    public void defend (Wave wave) {
        for (Tower tower : towers) {
            for (Enemy enemy : wave.getEnemies()) {
                if (enemy.isAlive()) {
                    tower.attack(enemy);
                    if (!enemy.isAlive()) {
                        System.out.println(enemy.getName() + " has been defeated");
                    }
                } 
            }
        }
    }
}
