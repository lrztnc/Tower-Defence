abstract class Enemy {
    PVector pos;
    int health;
    int maxHealth;
    float speed;
    int reward;
    int targetIndex;

    public Enemy() {
      this.pos = new PVector(pathPoints[0].x, pathPoints[0].y);
      this.targetIndex = 1;
    }

    abstract void setAttributes();

    void move() {
      if (targetIndex < pathPoints.length) {
        PVector target = pathPoints[targetIndex];
        PVector dir = PVector.sub(target, pos);
        
        float distToTarget = dir.mag();
        
        if (distToTarget <= speed) {
          pos.set(target);
          targetIndex++;
        } else {
          dir.normalize();
          dir.mult(speed);
          pos.add(dir);
        }
      }
    }

    boolean isAtEnd() {
      return targetIndex >= pathPoints.length;
    }

    abstract void draw();
}