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

@WebServlet(name = "FireServlet", urlPatterns = "/fire")
@SuppressWarnings("MethodDoesntCallSuperMethod")
public class FireServlet extends HttpServlet {

    @Inject
    private PlayerManager playerManager;

    @Override
    protected void doPost(final HttpServletRequest request,
                          final HttpServletResponse response) throws ServletException, IOException {
        final String addr = request.getParameter("addr");
        final Game game = playerManager.getGame();
        game.fire(addr);

        response.sendRedirect(request.getContextPath() + "/fire");
    }

    @Override
    protected void doGet(final HttpServletRequest request,
                         final HttpServletResponse response) throws ServletException, IOException {
        final Game game = playerManager.getGame();
        final Player currentPlayer = game.getCurrentPlayer();
        final Player sessionPlayer = playerManager.getPlayer();

        if (game.getWinner() != null) {
            response.sendRedirect(request.getContextPath() + "/eog");
        }
        else  //noinspection ObjectEquality
            if (currentPlayer == sessionPlayer) {
            request.getRequestDispatcher("/WEB-INF/fire.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/wait-opponent-fire.jsp")
                    .include(request, response);
        }
    }
}
