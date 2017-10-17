package lv.ctco.battleship.model;

import javax.annotation.PreDestroy;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

@Named
@SessionScoped
public class PlayerManager implements Serializable {
    private static final long serialVersionUID = 1;

    @Inject
    private GameManager gameManager;

    private Player player;
    private Game game;

    public Player getPlayer() {
        return player;
    }

    public Game getGame() {
        return game;
    }

    public void registerPlayer(final Player player) {
        this.player = player;
        game = gameManager.registerPlayer(player);
    }

    @PreDestroy
    public void cancelGame() {
        game.setCanceled(true);
    }
}
