package lv.ctco.battleship.model;

import javax.enterprise.context.ApplicationScoped;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;

@ApplicationScoped
public class GameManager implements Serializable {
    private static final Logger logger = Logger.getLogger(GameManager.class.getName());
    private static final long serialVersionUID = 1;

    private Game incompleteGame;

    synchronized Game registerPlayer(final Player player) {
        if (incompleteGame == null) {
            incompleteGame = new Game();
            logger.log(Level.FINE, "Creating new incomplete game for user {0}", player);
            incompleteGame.setPlayer1(player);
            return incompleteGame;
        }

        incompleteGame.setPlayer2(player);
        final Game completeGame = incompleteGame;
        incompleteGame = null;
        logger.log(Level.FINE, "Complete game {0} with user {1}", new Object[] {completeGame, player});
        return completeGame;
    }
}
