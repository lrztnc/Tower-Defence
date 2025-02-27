class PowerfulEnemy extends Enemy {
    public PowerfulEnemy() {
        super();
        setAttributes();
    }

    void setAttributes() {
        maxHealth = 2;
        health = maxHealth;
        speed = 1.5 + (wave - 1) * 0.2;
        reward = 20;
    }

    void draw() {
        fill(0, 0, 200);
        noStroke();
        ellipse(pos.x, pos.y, 15, 15);
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