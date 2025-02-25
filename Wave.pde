class Wave {
    int numStandard, numFast;
    int spawned = 0;
    int spawnDelay = 1000;
    int lastSpawnTime;

    Wave(int numStandard, int numFast) {
        this.numStandard = numStandard;
        this.numFast = numFast;
        this.lastSpawnTime = millis();
    }

    void spawnEnemies() {
    for (int i = 0; i < numStandard; i++) {
        enemies.add(new StandardEnemy(0, (int) random(100, 400))); 
    }
    for (int i = 0; i < numFast; i++) {
        enemies.add(new FastEnemy(0, (int) random(100, 400))); 
    }
}
}