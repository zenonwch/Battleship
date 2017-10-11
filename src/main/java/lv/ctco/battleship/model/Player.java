package lv.ctco.battleship.model;

import java.io.Serializable;

public class Player implements Serializable {
    private static final long serialVersionUID = 1;

    private final Field myField = new Field();
    private final Field opponentField = new Field();

    private String name;
    private boolean ready = false;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Field getMyField() {
        return myField;
    }

    public Field getOpponentField() {
        return opponentField;
    }

    public boolean isReady() {
        return ready;
    }

    public void setReady(final boolean ready) {
        this.ready = ready;
    }

    @Override
    public String toString() {
        return "Player{" +
                "name='" + name + '\'' +
                '}';
    }
}
