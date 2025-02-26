// Tower.pde - Definizione della classe torre

class Tower {
  PVector pos;      // posizione della torre
  int type;         // tipo di torre (1 o 2)
  float range;      // raggio d'azione
  int damage;       // danno per colpo
  int fireRate;     // frequenza di fuoco (in frame di cooldown)
  int cooldown;     // contatore frame rimanenti prima di poter sparare di nuovo
  PVector lastShotTarget;  // posizione bersaglio dell'ultimo colpo (per disegnare effetto)
  int shotEffectTimer;     // timer per mostrare l'effetto dello sparo (es. linea) per alcuni frame
  
  // Costruttore: inizializza la torre alla posizione (x,y) specificata con un certo tipo
  Tower(float x, float y, int type) {
    this.pos = new PVector(x, y);
    this.type = type;
    if (type == 1) {
      range = 100;
      damage = 1;
      fireRate = 20;   // può sparare ogni 20 frame (~3 al secondo)
    } else if (type == 2) {
      range = 150;
      damage = 2;
      fireRate = 50;   // può sparare ogni 50 frame (~1.2 al secondo)
    }
    cooldown = 0;
    lastShotTarget = null;
    shotEffectTimer = 0;
  }
  
  // Aggiorna la torre (chiamato ad ogni frame): controllo bersagli e cooldown
  void update(ArrayList<Enemy> enemyList) {
    if (cooldown > 0) {
      cooldown--;
    }
    if (cooldown <= 0) {
      // Cerca un nemico nel raggio d'azione
      Enemy targetEnemy = null;
      for (Enemy e : enemyList) {
        if (e.health > 0) { // considera solo nemici ancora vivi
          float d = PVector.dist(this.pos, e.pos);
          if (d <= range) {
            targetEnemy = e;
            break;  // attacca il primo nemico trovato a portata
          }
        }
      }
      if (targetEnemy != null) {
        // Spara al nemico trovato
        targetEnemy.health -= damage;
        cooldown = fireRate;  // resetta il cooldown
        // Salva la posizione del bersaglio colpito per effetto grafico
        lastShotTarget = targetEnemy.pos.copy();
        shotEffectTimer = 5;  // mostra l'effetto per 5 frame
      }
    }
    // (Nota: l'effettiva rimozione del nemico se health <= 0 avviene nel main Game.pde)
  }
  
  // Disegna la torre (e l'eventuale effetto di sparo)
  void draw() {
    // Disegna la torre stessa
    if (type == 1) {
      fill(255, 0, 255);  // colore magenta per torre tipo1
      noStroke();
      // Disegna una torre come triangolo con la punta verso l'alto
      float size = 20;
      triangle(pos.x, pos.y - size/2, pos.x - size/2, pos.y + size/2, pos.x + size/2, pos.y + size/2);
    } else if (type == 2) {
      fill(255, 255, 0);  // colore giallo per torre tipo2
      noStroke();
      rect(pos.x, pos.y, 20, 20);  // disegna un quadrato 20x20
    }
    // Effetto visivo sparo (linea verso il bersaglio colpito di recente)
    if (shotEffectTimer > 0 && lastShotTarget != null) {
      stroke(255, 255, 255);
      line(pos.x, pos.y, lastShotTarget.x, lastShotTarget.y);
      shotEffectTimer--;
    }
  }
}