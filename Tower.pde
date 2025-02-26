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

    void update(ArrayList<Enemy> enemyList) {
        if (cooldown > 0) {
            cooldown--;
        }

        if (cooldown <= 0) {
            Enemy targetEnemy = null;
            for (Enemy e : enemyList) {
                if (e.health > 0) {
                    float d = PVector.dist(this.pos, e.pos);
                if (d <= range) {
                    targetEnemy = e;
                    break;
                }
                }
            }

        if (targetEnemy != null) {
            targetEnemy.health -= damage;
            cooldown = fireRate;
            lastShotTarget = targetEnemy.pos.copy();
            shotEffectTimer = 5;
        }

    }
  }

  abstract void draw();
}