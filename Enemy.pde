// Enemy.pde - Definizione della classe nemico

class Enemy {
  PVector pos;    // posizione corrente del nemico
  int type;       // tipo di nemico (1 o 2)
  int health;     // salute corrente
  int maxHealth;  // salute massima (per calcolo barra HP)
  float speed;    // velocità di movimento (pixel per frame)
  int reward;     // monete ottenute quando viene eliminato
  int targetIndex;  // indice dell'attuale waypoint di destinazione nel percorso
  
  // Costruttore: inizializza un nemico di un certo tipo all'inizio del percorso
  Enemy(int type) {
    this.type = type;
    // Imposta attributi in base al tipo
    if (type == 1) {
      maxHealth = 4;
      speed = 1.0;
      reward = 2;
    } else if (type == 2) {
      maxHealth = 2;
      speed = 1.5;
      reward = 1;
    }
    health = maxHealth;
    // Aumenta la velocità in base all'onda corrente (più avanti = più veloce)
    speed += (wave - 1) * 0.2;
    // Posizione iniziale: primo punto del percorso
    pos = new PVector(pathPoints[0].x, pathPoints[0].y);
    targetIndex = 1;  // prossimo waypoint da raggiungere
  }
  
  // Movimento del nemico verso il waypoint corrente
  void move() {
    if (targetIndex < pathPoints.length) {
      PVector target = pathPoints[targetIndex];
      // Calcola vettore direzione verso il punto target
      PVector dir = PVector.sub(target, pos);
      float distToTarget = dir.mag();
      if (distToTarget <= speed) {
        // Raggiunge (o supera) il waypoint in questo frame
        pos.set(target);
        targetIndex++;
      } else {
        // Muovi di 'speed' nella direzione normalizzata
        dir.normalize();
        dir.mult(speed);
        pos.add(dir);
      }
    }
    // Se targetIndex >= pathPoints.length, il nemico ha raggiunto la fine (gestito esternamente)
  }
  
  // Verifica se il nemico ha raggiunto la fine del percorso
  boolean isAtEnd() {
    return targetIndex >= pathPoints.length;
  }
  
  // Disegna il nemico sullo schermo
  void draw() {
    // Scegli colore e forma in base al tipo
    if (type == 1) {
      fill(200, 0, 0);    // rosso scuro per tipo1
      stroke(0);
      rect(pos.x, pos.y, 20, 20);  // disegna un quadrato (20x20) centrato sulla posizione
    } else if (type == 2) {
      fill(0, 0, 200);    // blu scuro per tipo2
      noStroke();
      ellipse(pos.x, pos.y, 15, 15); // disegna un cerchio (diametro 15)
    }
    // Disegna barra di salute sopra il nemico
    float barWidth = 20;
    float barHeight = 4;
    float healthRatio = health / float(maxHealth);
    // Sfondo barra (rosso o grigio scuro)
    fill(100);
    noStroke();
    rect(pos.x, pos.y - 15, barWidth, barHeight);
    // Salute rimanente (verde)
    fill(0, 255, 0);
    rect(pos.x - barWidth/2 + (barWidth * healthRatio)/2, pos.y - 15, barWidth * healthRatio, barHeight);
    // Nota: la barra verde viene disegnata centrata sulla sinistra del fondo, poi traslata a metà della sua lunghezza per allinearla al centro.
  }
}