public class StandardTower extends Tower {
    public StandardTower() {
        super("Standard Tower", 50, 20, 5);
    }

    public void attack(Enemy enemy) {
        enemy.sufferDamage(damage);
        System.out.println(name + " attacks" + enemy.getName() + " inflicting " + damage + " of damage.");
    }
}
