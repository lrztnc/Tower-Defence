BattleField battlefield;
Player player;
ArrayList<Enemy> enemies;

void setup() {
    size(800, 600);
    battlefield = new BattleField();
    player = new Player();
    enemies = new ArrayList<>();
    spawnEnemies();
}

void draw() {
    background(200);
    battlefield.display();
    player.display();

    for (Enemy enemy : enemies) {
        enemy.move();
        enemy.display();
    }

    checkGameOver();
}

void mousePressed() {
    player.placeTower(mouseX, mouseY, battlefield);
}

void spawnEnemies() {
    for (int i = 0; i < 5; i++) {
        enemies.add(new StandardEnemy(i * 50, 50));
    }
    for (int i = 0; i < 3; i++) {
        enemies.add(new FastEnemy(i * 70, 70));
    }
}

void checkGameOver() {
    if (battlefield.hasLost()) {
        println("Game Over");
        noLoop();
    }
}