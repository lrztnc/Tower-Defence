# Tower-Defense
## Autore
Tincani Lorenzo, 4IA, "G. Bearzi"

lorenzo.tincani@allievi.bearzi.it

## Presentazione del progetto
Il progetto consiste nella realizzazione di un gioco Tower Defense in Java da eseguire in modo grafico. Il giocatore controlla un personaggio che deve piazzare torri per difendere il luogo che i nemici voglio raggiungere, ma le ondate si faranno sempre più difficili.

L'obiettivo del gioco è resistere il più possibile, gestendo risorse economiche per acquistare e potenziare torri difensive. Il gioco sfrutta concetti di programmazione orientata agli oggetti (OOP) come polimorfismo e classi astratte per una progettazione modulare e scalabile.

## Requisiti funzionali
1. **Gestione del personaggio**:
    - Il giocatore può posizionare torri.
    - È possibile guadagnare monete eliminando nemici e completanto ondante.

2. **Sistema di torri**:
    - Esistono diverse tipologie di torri con caratteristiche diverse.
    - Ogni torre ha un costo e può essere potenziata.

3. **Sistema delle ondate**:
    - Nemici generati in ondate sempre più difficili.
    - Aumento pregressivo della velocità e della resistenza dei nemici.

4. **Uso delle monete**:
    - Il giocatore puù gudagnare monete abbattendo i nemici.
    - È possibile acquistare nuove torri o potenziare quelle esistenti.

5. **Campo di gioco**:
    - C'è una mappa che rappresenta il percorso che include i nemici.
    - Le torri posso essere posizionate nei punti di questo campo.

6. **Vittoria e sconfitta**:
    - Il gioco termina con la sconfitta nel caso in cui ci siano troppi nemici nella base.
    - Il gioco prosegue fino alla fine delle vite.

## Requisiti non funzionali
- **Modularietà**: il codice deve essere suddiviso in più classi, per acquisire scalabilità.
- **Utilizzo deli OOP**: il progetto deve contenere le classi astratte e l'uso del polimorfismo.

## Struttura del codice
Il progetto è organizzato in diverse classi:
- **Game.pde**: gestisce la lgica principale del gioco.

- **Tower.pde**: è la classe che contiene le funzioni comuni a tutte le torri.

- **StandardTower.pde**: classe che gestisce la torre base.

- **PowerfulTower.pde**: classe che gestisce la torre potenziata.

- **Enemy.pde**: è la classe che contiene le funzioni comuni a tutti i nemici.

- **StandardEnemy.pde**: classe che gestisce i nemici base.

- **PowerfulEnemy.pde**: classe che gestisce i nemici potenziata.

## Scelte Progettuali
- **Sistema di ereditariertà**: per definire torri e nemici con caratteristiche specifiche.

- **Bilanciamento della difficoltà**: incremento progressivo della forza dei nemici.

- **Uso degli OOP**: per garentire flessibilità e riutilizzabilità del codice.

## Diagramma UML