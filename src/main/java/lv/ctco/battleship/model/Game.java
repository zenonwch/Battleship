package lv.ctco.battleship.model;

import java.io.Serializable;

import static lv.ctco.battleship.model.CellContent.*;

public class Game implements Serializable {
    private static final long serialVersionUID = 1;

    private Player player1;
    private Player player2;
    private Player winner;
    private boolean player1Turn = true;
    private boolean canceled;

    public Player getPlayer1() {
        return player1;
    }

    void setPlayer1(final Player player1) {
        this.player1 = player1;
    }

    public Player getPlayer2() {
        return player2;
    }

    void setPlayer2(final Player player2) {
        this.player2 = player2;
    }

    public boolean isComplete() {
        return player1 != null && player2 != null;
    }

    public boolean shipsReady() {
        return player1 != null && player1.isReady()
                && player2 != null && player2.isReady();
    }

    public boolean isCanceled() {
        return canceled;
    }

    public void setCanceled(final boolean canceled) {
        this.canceled = canceled;
    }

    public Player getCurrentPlayer() {
        return player1Turn ? player1 : player2;
    }

    public Player getOppositePlayer() {
        return player1Turn ? player2 : player1;
    }

    public Player getWinner() {
        return winner;
    }

    public void setWinner(final Player winner) {
        this.winner = winner;
    }

    @Override
    public String toString() {
        return "Game{" +
                "player1=" + player1 +
                ", player2=" + player2 +
                '}';
    }

    public void fire(final String addr) {
        final Player current = getCurrentPlayer();
        final Player opposite = getOppositePlayer();
        final CellContent fired = opposite.getMyField().get(addr);

        if (SHIP == fired) {
            current.getOpponentField().set(addr, HIT);
            opposite.getMyField().set(addr, HIT);
            checkWinner();
        } else if (EMPTY == fired) {
            current.getOpponentField().set(addr, MISS);
            opposite.getMyField().set(addr, MISS);
            player1Turn = !player1Turn;
        } else {
            player1Turn = !player1Turn;
        }
    }

    private void checkWinner() {
        if (getOppositePlayer().getMyField().getContent().containsValue(SHIP)) {
            return;
        }
        winner = getCurrentPlayer();
    }
}
