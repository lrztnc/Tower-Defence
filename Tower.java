public /*abstract*/ class Tower {
    protected String name;
    protected int cost;
    protected int damage;
    protected int radius;

    public Tower(String inpuName, int inputCost, int inputDamage, int inputRadius) {
        this.name = inpuName;
        this.cost = inputCost;
        this.damage = inputDamage;
        this.radius = inputRadius;
    }

    public String getName() {
        return name;
    }

    public int getCost() {
        return cost;
    }

    public int getDamage() {
        return damage;
    }

    public int getRadius() {
        return radius;
    }

    // public abstract void attact();
    // Inserire nemico
}
