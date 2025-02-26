class StandardTower extends Tower {
    public StandardTower(float x, float y) {
        super(x, y);
        setAttributes();
    }

    void setAttributes() {
        range = 100;
        damage = 1;
        fireRate = 90;
    }

    void draw() {
        fill(255, 0, 255);
        noStroke();
        float size = 20;
        triangle(pos.x, pos.y - size / 2, pos.x - size / 2, pos.y + size / 2, pos.x + size / 2, pos.y + size / 2);
    
        if (shotEffectTimer > 0 && lastShotTarget != null) {
            stroke(255, 255, 255);
            line(pos.x, pos.y, lastShotTarget.x, lastShotTarget.y);
            shotEffectTimer--;
        }
    }
}