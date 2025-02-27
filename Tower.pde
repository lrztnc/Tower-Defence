abstract class Tower {
    PVector pos; // posizione della torre
    float range;
    int damage;
    int fireRate;
    int cooldown; // colpo da ricaricare
    PVector lastShotTarget; // lultimo shottato
    int shotEffectTimer; // tiem per leffetto del colpo

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
                if (d <= range) { // se il nemico è nel range viene sparato
                    targetEnemy = e;
                    break;
                }
                }
            }

        // 
        if (targetEnemy != null) {
            targetEnemy.health -= damage; // toglie vita 
            cooldown = fireRate; // resettar eil tempo di ricarica
            lastShotTarget = targetEnemy.pos.copy(); // salvare la posizione del bersaglio
            shotEffectTimer = 5;
        }

    }
  }

  abstract void draw(); // disegnare torre
}