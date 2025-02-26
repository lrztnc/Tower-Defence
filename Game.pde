import java.util.ArrayList;

ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
int lives = 3;
int coins = 100;
int wave = 1;

int enemiesToSpawn;
int enemiesSpawned = 0;
int spawnInterval = 60;
int spawnTimer = 0;

int currentTowerType = 1;
int costTower1 = 10;
int costTower2 = 15;

float pathWidth = 40;
PVector[] pathPoints;

int buttonX, buttonY, buttonWidth, buttonHeight;

void setup() {
    size(600, 600);
    rectMode(CENTER);
    ellipseMode(CENTER);
    textAlign(LEFT, TOP);
    textSize(14);

    enemies = new ArrayList<>();
    towers = new ArrayList<>();

    float margin = 80;
    float midY = height / 2;
    pathPoints = new PVector[]{
        new PVector(margin, margin),
        new PVector(width - margin, margin),
        new PVector(width - margin, midY),
        new PVector(margin, midY),
        new PVector(margin, height - margin),
        new PVector(width - margin, height - margin)
    };

    // Imposta la posizione del pulsante "Ricomincia"
    buttonWidth = 180;
    buttonHeight = 40;
    buttonX = width / 2;
    buttonY = height / 2 + 50;

    startWave(1);
}

void draw() {
    background(100, 200, 100);

    fill(150, 100, 50);
    noStroke();
    for (int i = 0; i < pathPoints.length - 1; i++) {
        PVector a = pathPoints[i];
        PVector b = pathPoints[i + 1];
        if (abs(a.y - b.y) < 1) {
            float y = a.y;
            float xStart = min(a.x, b.x);
            float xEnd = max(a.x, b.x);
            rect((xStart + xEnd) / 2, y, (xEnd - xStart) + pathWidth, pathWidth);
        } else if (abs(a.x - b.x) < 1) {
            float x = a.x;
            float yStart = min(a.y, b.y);
            float yEnd = max(a.y, b.y);
            rect(x, (yStart + yEnd) / 2, pathWidth, (yEnd - yStart) + pathWidth);
        }
    }

    if (!gameOver() && enemiesSpawned < enemiesToSpawn) {
        if (frameCount % spawnInterval == 0) {
            spawnEnemy();
        }
    }

    for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        e.move();
        if (e.isAtEnd()) {
            enemies.remove(i);
            lives--;
            if (lives <= 0) {
                lives = 0;
            }
            continue;
        }
    }

    for (Tower t : towers) {
        t.update(enemies);
    }

    for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        if (e.health <= 0) {
            coins += e.reward;
            enemies.remove(i);
        }
    }

    for (Tower t : towers) {
        t.draw();
    }
    for (Enemy e : enemies) {
        e.draw();
    }

    fill(0);
    text("Vite: " + lives, 10, 10);
    text("Monete: " + coins, 10, 30);
    text("Ondata: " + wave, 10, 50);
    String towerName = (currentTowerType == 1) ? "Torre Tipo1" : "Torre Tipo2";
    text("Torre selezionata: " + towerName, 10, 70);

    if (gameOver()) {
        fill(0, 150);
        rect(width / 2, height / 2, width, height);

        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(32);
        text("GAME OVER", width / 2, height / 2 - 40);

        fill(200, 50, 50);
        rect(buttonX, buttonY, buttonWidth, buttonHeight, 10);
        fill(255);
        textSize(20);
        text("Ricomincia", buttonX, buttonY);
        textAlign(LEFT, TOP);
        textSize(14);
    } else if (enemies.size() == 0 && enemiesSpawned >= enemiesToSpawn) {
        startWave(wave + 1);
    }
  }

  void startWave(int waveNumber) {
      wave = waveNumber;
      enemiesSpawned = 0;
      enemiesToSpawn = 4 + waveNumber;
  }

  void spawnEnemy() {
      Enemy newEnemy = (random(1) < 0.5) ? new EnemyType1() : new EnemyType2();
      enemies.add(newEnemy);
      enemiesSpawned++;
  }

  boolean gameOver() {
      return lives <= 0;
  }

  void mousePressed() {
      if (gameOver()) {
          if (mouseX > buttonX - buttonWidth / 2 && mouseX < buttonX + buttonWidth / 2 &&
              mouseY > buttonY - buttonHeight / 2 && mouseY < buttonY + buttonHeight / 2) {
              restartGame();
          }
          return;
      }
  }

  void keyPressed() {
      if (key == '1' && coins >= costTower1 && !isOnPath(mouseX, mouseY)) {
          towers.add(new TowerType1(mouseX, mouseY));
          coins -= costTower1;
      } else if (key == '2' && coins >= costTower2 && !isOnPath(mouseX, mouseY)) {
          towers.add(new TowerType2(mouseX, mouseY));
          coins -= costTower2;
      }
  }

  void restartGame() {
      lives = 3;
      coins = 20;
      wave = 1;
      enemies.clear();
      towers.clear();
      enemiesSpawned = 0;
      startWave(1);
  }

  boolean isOnPath(int x, int y) {
      for (int i = 0; i < pathPoints.length - 1; i++) {
          PVector a = pathPoints[i];
          PVector b = pathPoints[i + 1];
          if (abs(a.y - b.y) < 1 && abs(y - a.y) < pathWidth / 2 && x >= min(a.x, b.x) - pathWidth / 2 && x <= max(a.x, b.x) + pathWidth / 2) {
              return true;
          } else if (abs(a.x - b.x) < 1 && abs(x - a.x) < pathWidth / 2 && y >= min(a.y, b.y) - pathWidth / 2 && y <= max(a.y, b.y) + pathWidth / 2) {
              return true;
          }
      }
      return false;
}
