BattleField battlefield;
Player player;
ArrayList<Enemy> enemies;
ArrayList<Wave> waves;
int currentWaveIndex = 0;
boolean waveActive = false;
int waveDelay = 3000;
int lastWaveTime;

void setup() {
    size(800, 600);
    battlefield = new BattleField();
    player = new Player();
    enemies = new ArrayList<>();
    waves = new ArrayList<>();

    // Creiamo più ondate con diversi tipi di nemici
    waves.add(new Wave(5, 2));  
    waves.add(new Wave(7, 4));  
    waves.add(new Wave(10, 6)); 
    lastWaveTime = millis();
}

void draw() {
    background(200);
    battlefield.display();
    player.display();

    for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        e.move();
        e.display();
        if (e.health <= 0) {
            enemies.remove(i);
        }
    }

    if (waveActive && enemies.isEmpty()) {
        waveActive = false;
        lastWaveTime = millis();
        currentWaveIndex++;
        if (currentWaveIndex >= waves.size()) {
            println("Hai vinto!");
            noLoop();
        }
    }

    if (!waveActive && millis() - lastWaveTime > waveDelay && currentWaveIndex < waves.size()) {
        waves.get(currentWaveIndex).spawnEnemies();
        waveActive = true;
    }

    checkGameOver();
}

void checkGameOver() {
    if (battlefield.hasLost()) {
        println("Game Over!");
        noLoop();
    }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        player.placeTower(mouseX, mouseY, battlefield, "standard");
    } else if (mouseButton == RIGHT) {
        player.placeTower(mouseX, mouseY, battlefield, "powerful");
    }
}