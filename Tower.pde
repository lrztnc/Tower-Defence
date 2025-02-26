abstract class Tower {
    PVector pos;
    float range;
    int damage;
    int fireRate;
    int cooldown;
    PVector lastShotTarget;
    int shotEffectTimer;

    public Tower(float x, float y) {
        this.pos = new PVector(x, y);
        this.cooldown = 0;
        this.lastShotTarget = null;
        this.shotEffectTimer = 0;
    }

    abstract void setAttributes();