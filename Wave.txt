import java.util.ArrayList;
import java.util.List;

public class Wave {
    private List<Enemy> enemies;

    public Wave(int numberOfEnemies) {
        enemies = new ArrayList<>();
        for (int i = 0; i < numberOfEnemies; i++) {
            enemies.add(new StandardEnemy());
        }
    }

    public List<Enemy> getEnemies() {
        return enemies;
    }
}
