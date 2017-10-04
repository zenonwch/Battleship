package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.Player;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WaitOpponentReadyServlet",
        urlPatterns = "/wait-opponent-ships")
public class WaitOpponentReadyServlet extends HttpServlet {

    @Inject
    private PlayerManager playerManager;

    @Override
    @SuppressWarnings("MethodDoesntCallSuperMethod")
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        final Player player1 = playerManager.getGame().getPlayer1();
        final Player player2 = playerManager.getGame().getPlayer2();

        if (player1.isReady() && player2.isReady()) {
            //noinspection NestedMethodCall
            response.sendRedirect(request.getContextPath() + "/placement.jsp");
        } else {
            request.getRequestDispatcher("/WEB-INF/wait-opponent-ships.jsp")
                    .include(request, response);
        }
    }
}
