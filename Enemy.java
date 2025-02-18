public abstract class Enemy {
    protected String name;
    protected int health;
    protected int speed;

    public Enemy(String inputName, int inputHealth, int inputSpeed) {
        this.name = inputName;
        this.health = inputHealth;
        this.speed = inputSpeed;
    }

    public void sufferDamage(int damage) {
        this.health -= damage;
    }

    public boolean isAlive() {
        return this.health > 0;
    }

    public String getName() {
        return name;
    }

    public int getHealth() {
        return health;
    }

    public int getSpeed() {
        return speed;
    }
}