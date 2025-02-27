class StandardEnemy extends Enemy {
    public StandardEnemy() {
        super();
        setAttributes();
    }

    void setAttributes() {
        maxHealth = 4;
        health = maxHealth;
        speed = 1.0 + (wave - 1) * 0.2;
        reward = 10;
    }

    void draw() {
        fill(200, 0, 0);
        stroke(0);
        rect(pos.x, pos.y, 20, 20);
        drawHealthBar();
    }

     void drawHealthBar() {
        float barWidth = 20;
        float barHeight = 4;
        float healthRatio = health / (float) maxHealth;

        fill(100);
        noStroke();
        rect(pos.x, pos.y - 15, barWidth, barHeight);

        fill(0, 255, 0);
        rect(pos.x - barWidth / 2 + (barWidth * healthRatio) / 2, pos.y - 15, barWidth * healthRatio, barHeight);
    }
}