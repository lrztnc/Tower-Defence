BattleField battlefield;
Player player;
ArrayList<Enemy> enemies;
ArrayList<Wave> waves;
int currentWaveIndex = 0;
boolean waveActive = false;
int waveDelay = 3000;
int lastWaveTime;
boolean gameOver = false;
String message = "";

void setup() {
    size(800, 600);
    restartGame();
}

void draw() {
    if (gameOver) {
        showGameOverScreen();
        return;
    }

    background(200);
    battlefield.display();
    player.display();

    for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        e.move();
        e.display();

        if (e.health <= 0) {
            enemies.remove(i);
            player.earnMoney(5); 
        }

        if (e.x > width) { 
            gameOver = true;
        }
    }

    if (waveActive && enemies.isEmpty()) {
        waveActive = false;
        lastWaveTime = millis();
        currentWaveIndex++;

        if (currentWaveIndex >= waves.size()) {
            message = "You won!";
            println(message);
            noLoop();
        } else {
            message = "Next wave incoming!";
            println(message);
        }
    }

    if (!waveActive && millis() - lastWaveTime > waveDelay && currentWaveIndex < waves.size()) {
        waves.get(currentWaveIndex).spawnEnemies();
        waveActive = true;
    }

    checkGameOver();

    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(message, width / 2, 50);
}

void checkGameOver() {
    if (battlefield.hasLost()) {
        println("Game Over!");
        gameOver = true;
    }
}

void showGameOverScreen() {
    background(0);
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 3);

    fill(255);
    rect(width / 2 - 75, height / 2, 150, 50);
    fill(0);
    textSize(20);
    text("Restart", width / 2, height / 2 + 25);
}

void mousePressed() {
    if (gameOver) {
        if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
            mouseY > height / 2 && mouseY < height / 2 + 50) {
            restartGame();
        }
        return;
    }

    if (mouseButton == LEFT) {
        player.placeTower(mouseX, mouseY, battlefield, "standard");
    } else if (mouseButton == RIGHT) {
        player.placeTower(mouseX, mouseY, battlefield, "powerful");
    }
}

void restartGame() {
    gameOver = false;
    battlefield = new BattleField();
    player = new Player();
    enemies = new ArrayList<>();
    waves = new ArrayList<>();
    currentWaveIndex = 0;
    waveActive = false;
    lastWaveTime = millis();

    for (int i = 1; i <= 9; i++) {
        waves.add(new Wave(3 * i, (int)(1.5 * i))); 
    }

    loop();
}