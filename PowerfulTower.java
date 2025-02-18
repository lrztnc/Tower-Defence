public class PowerfulTower extends Tower {
    public PowerfulTower() {
        super("Powerful Tower", 100, 50, 7);
    }

    public void attack(Enemy enemy) {
        System.out.println(name + " attacks" + enemy.getName() + " inflicting " + damage + " of damage.");
        enemy.sufferDamage(damage);
    }
}
