package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WaitOpponentShipsServlet",
        urlPatterns = "/wait-opponent-ships")
public class WaitOpponentShipsServlet extends HttpServlet {

    @Inject
    private PlayerManager playerManager;

    @Override
    @SuppressWarnings("MethodDoesntCallSuperMethod")
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {

        if (playerManager.getGame().shipsReady()) {
            //noinspection NestedMethodCall
            response.sendRedirect(request.getContextPath() + "/fire");
        } else {
            request.getRequestDispatcher("/WEB-INF/wait-opponent-ships.jsp")
                    .include(request, response);
        }
    }
}
