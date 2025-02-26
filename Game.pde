// Game.pde - Gestione principale del Tower Defense

// Import per utilizzare ArrayList
import java.util.ArrayList;

// Variabili globali di gioco
ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
int lives = 3;
int coins = 20;
int wave = 1;

int enemiesToSpawn;      // quanti nemici restano da generare nell'ondata corrente
int enemiesSpawned = 0;  // nemici già generati nell'ondata corrente
int spawnInterval = 60;  // intervallo di spawn in frame (60 frame ≈ 1 secondo a 60 FPS)
int spawnTimer = 0;      // contatore per generare nemici a intervalli

int currentTowerType = 1;    // tipo di torre selezionato per il posizionamento (1 o 2)
int costTower1 = 10;
int costTower2 = 20;

float pathWidth = 40;        // larghezza visiva del percorso

// Array di waypoint PVector che definiscono il percorso a "S"
PVector[] pathPoints;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(LEFT, TOP);
  textSize(14);
  
  // Inizializzazione liste
  enemies = new ArrayList<Enemy>();
  towers = new ArrayList<Tower>();
  
  // Definizione del percorso a forma di S tramite waypoint
  float margin = 80;
  float midY = height / 2;
  pathPoints = new PVector[] {
    new PVector(margin, margin),            // punto iniziale (alto sinistra)
    new PVector(width - margin, margin),    // alto destra
    new PVector(width - margin, midY),      // centro destra
    new PVector(margin, midY),             // centro sinistra
    new PVector(margin, height - margin),   // basso sinistra
    new PVector(width - margin, height - margin)  // punto finale (basso destra)
  };
  
  // Imposta la prima ondata
  startWave(1);
}

void draw() {
  // Sfondo verde prato
  background(100, 200, 100);
  
  // Disegna il percorso a S (strada) come rettangoli larghi lungo i segmenti
  fill(150, 100, 50);  // colore marrone del percorso
  noStroke();
  for (int i = 0; i < pathPoints.length - 1; i++) {
    PVector a = pathPoints[i];
    PVector b = pathPoints[i+1];
    if (abs(a.y - b.y) < 1) {
      // Segmento orizzontale
      float y = a.y;
      float xStart = min(a.x, b.x);
      float xEnd   = max(a.x, b.x);
      rect((xStart + xEnd) / 2, y, (xEnd - xStart) + pathWidth, pathWidth);
    } else if (abs(a.x - b.x) < 1) {
      // Segmento verticale
      float x = a.x;
      float yStart = min(a.y, b.y);
      float yEnd   = max(a.y, b.y);
      rect(x, (yStart + yEnd) / 2, pathWidth, (yEnd - yStart) + pathWidth);
    }
  }
  
  // Gestione spawn nemici ad intervalli
  if (!gameOver() && enemiesSpawned < enemiesToSpawn) {
    if (frameCount % spawnInterval == 0) {
      spawnEnemy();
    }
  }
  
  // Aggiorna e muovi i nemici
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.move();  // sposta il nemico lungo il percorso
    if (e.isAtEnd()) {
      // Nemico ha raggiunto la fine: rimuovi nemico e perdi una vita
      enemies.remove(i);
      lives--;
      if (lives <= 0) {
        // Game over se vite esaurite
        lives = 0;
      }
      continue;
    }
  }
  
  // Le torri attaccano i nemici (aggiornamento torri)
  for (Tower t : towers) {
    t.update(enemies);
  }
  
  // Rimuove eventuali nemici uccisi dalle torri in questo frame
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (e.health <= 0) {
      // Nemico eliminato
      coins += e.reward;
      enemies.remove(i);
    }
  }
  
  // Disegna torri ed effetti
  for (Tower t : towers) {
    t.draw();
  }
  // Disegna nemici rimanenti
  for (Enemy e : enemies) {
    e.draw();
  }
  
  // Disegna l'interfaccia (vite, monete, onda, tipo torre selezionata)
  fill(0);
  text("Vite: " + lives, 10, 10);
  text("Monete: " + coins, 10, 30);
  text("Ondata: " + wave, 10, 50);
  // Indicazione torre selezionata
  String towerName = (currentTowerType == 1) ? "Torre Tipo1" : "Torre Tipo2";
  text("Torre selezionata: " + towerName, 10, 70);
  
  // Messaggio di Game Over se vite esaurite
  if (gameOver()) {
    fill(0, 150);
    rect(width/2, height/2, width, height);  // schermo semi-trasparente
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("GAME OVER", width/2, height/2);
    textSize(14);
    textAlign(LEFT, TOP);
  }
}

// Funzione per avviare una nuova ondata di nemici
void startWave(int waveNumber) {
  wave = waveNumber;
  enemiesSpawned = 0;
  // Possiamo aumentare il numero di nemici ad ogni ondata, ad es:
  enemiesToSpawn = 4 + waveNumber;   // numero di nemici nell'ondata
  // Aumenta leggermente la velocità base dei nemici per questa ondata
  // (Questo fattore sarà applicato in spawnEnemy in base al wave corrente)
}

// Genera un nuovo nemico all'inizio del percorso
void spawnEnemy() {
  // Determina il tipo di nemico in modo casuale (1 o 2)
  int type = (random(1) < 0.5) ? 1 : 2;
  Enemy newEnemy = new Enemy(type);
  enemies.add(newEnemy);
  enemiesSpawned++;
  // Se abbiamo generato tutti i nemici di questa ondata e l'ondata corrente è finita (nessun nemico vivo)
  // possiamo preparare la prossima ondata
  if (enemiesSpawned >= enemiesToSpawn) {
    // Attendi che tutti i nemici dell'ondata siano stati gestiti prima di lanciare la prossima ondata
    // (La logica di controllo per nuova ondata è gestita nel draw quando lista nemici è vuota)
  }
}

// Verifica se il gioco è terminato
boolean gameOver() {
  return lives <= 0;
}

// Controlla se una data posizione (x,y) è sul percorso 
// (usato per evitare di posizionare torri sul tracciato)
boolean isOnPath(float x, float y) {
  // Controlla vicinanza a ciascun segmento del percorso
  for (int i = 0; i < pathPoints.length - 1; i++) {
    PVector a = pathPoints[i];
    PVector b = pathPoints[i+1];
    if (abs(a.y - b.y) < 1) {
      // segmento orizzontale: controlla distanza verticale e proiezione orizzontale
      if (abs(y - a.y) < pathWidth/2 && x >= min(a.x, b.x) - pathWidth/2 && x <= max(a.x, b.x) + pathWidth/2) {
        return true;
      }
    } else if (abs(a.x - b.x) < 1) {
      // segmento verticale
      if (abs(x - a.x) < pathWidth/2 && y >= min(a.y, b.y) - pathWidth/2 && y <= max(a.y, b.y) + pathWidth/2) {
        return true;
      }
    }
  }
  return false;
}

// Eventi di input mouse per posizionare torri
void mousePressed() {
  if (gameOver()) return;  // niente input se gioco finito
  if (mouseButton == LEFT) {
    // Clic sinistro: prova a piazzare una torre del tipo selezionato
    if (!isOnPath(mouseX, mouseY)) {  // consenti posizionamento solo se fuori dal percorso
      if (currentTowerType == 1 && coins >= costTower1) {
        towers.add(new Tower(mouseX, mouseY, 1));
        coins -= costTower1;
      } else if (currentTowerType == 2 && coins >= costTower2) {
        towers.add(new Tower(mouseX, mouseY, 2));
        coins -= costTower2;
      }
    }
  }
}

// Eventi di input tastiera per selezionare il tipo di torre
void keyPressed() {
  if (key == '1') {
    currentTowerType = 1;
  } else if (key == '2') {
    currentTowerType = 2;
  }
}