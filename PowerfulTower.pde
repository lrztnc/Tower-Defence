class PowerfulTower extends Tower {
    public PowerfulTower(float x, float y) {
        super(x, y);
        setAttributes();
    }

    void setAttributes() {
        range = 150;
        damage = 2;
        fireRate = 180;
    }

    void draw() {
        fill(255, 255, 0);
        noStroke();
        rect(pos.x, pos.y, 20, 20);
        
        if (shotEffectTimer > 0 && lastShotTarget != null) {
            stroke(255, 255, 255);
            line(pos.x, pos.y, lastShotTarget.x, lastShotTarget.y);
            shotEffectTimer--;
        }
    }
}