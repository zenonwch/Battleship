package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.Game;
import lv.ctco.battleship.model.Player;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EndOfGameServlet", urlPatterns = "/eog")
@SuppressWarnings("MethodDoesntCallSuperMethod")
public class EndOfGameServlet extends HttpServlet {

    @Inject
    private PlayerManager playerManager;

    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        final Game game = playerManager.getGame();
        final Player currentPlayer = playerManager.getPlayer();
        final Player winner = game.getWinner();

        if (winner == null) {
            request.getRequestDispatcher("WEB-INF/fire.jsp").include(request, response);
        } else //noinspection ObjectEquality
            if (winner == currentPlayer) {
                request.getRequestDispatcher("/WEB-INF/winner.jsp").include(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/lose.jsp").include(request, response);
            }
    }
}
