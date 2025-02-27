abstract class Enemy {
    PVector pos; // serve per la posizione del nemico
    int health;
    int maxHealth;
    float speed;
    int reward; // monete che rilascia
    int targetIndex; // indice del prossimo punto del percorso

    public Enemy() { 
        // si inizializza il nemico al primo puntio del percorso
        this.pos = new PVector(pathPoints[0].x, pathPoints[0].y);
        this.targetIndex = 1; 
    }

    abstract void setAttributes();

    void move() {
        if (targetIndex < pathPoints.length) {
            PVector target = pathPoints[targetIndex]; // prossimo punto del percorso
            PVector dir = PVector.sub(target, pos); // la sua direzine

            float distToTarget = dir.mag(); // la sya distanza

            if (distToTarget <= speed) { 
                pos.set(target); // ragiunge il punto
                targetIndex++;
            } else {
                // oppure si muove verso quel punto
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