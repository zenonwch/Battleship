package lv.ctco.battleship.model;

import java.io.Serializable;

public class Game implements Serializable {
    private static final long serialVersionUID = 1;

    private Player player1;
    private Player player2;

    public Player getPlayer1() {
        return player1;
    }

    public void setPlayer1(final Player player1) {
        this.player1 = player1;
    }

    public Player getPlayer2() {
        return player2;
    }

    public void setPlayer2(final Player player2) {
        this.player2 = player2;
    }

    public boolean isComplete() {
        return player1 != null && player2 != null;
    }

    @Override
    public String toString() {
        return "Game{" +
                "player1=" + player1 +
                ", player2=" + player2 +
                '}';
    }
}
