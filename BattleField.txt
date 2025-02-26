import processing.core.*;

class BattleField {
    ArrayList<Tower> towers;

    BattleField() {
        towers = new ArrayList<>();
    }

    void display() {
        fill(150, 200, 150);
        rect(0, 0, width, height);

        for (Tower tower : towers) {
            tower.display();
            tower.attackEnemies();
        }
    }

    void addTower(Tower tower) {
        towers.add(tower);
    }
    
    boolean isValidPosition(int x, int y) {
    
    if (x < 0 || x > width || y < 0 || y > height) return false;
    
    
    for (Tower t : towers) {
        if (dist(x, y, t.x, t.y) < 30) return false; 
    }
    
    return true;
}  

    boolean hasLost() {
        for (Tower tower : towers) {
            if (tower.health <= 0) {
                return true;
            }
        }
        return false;
    }
}