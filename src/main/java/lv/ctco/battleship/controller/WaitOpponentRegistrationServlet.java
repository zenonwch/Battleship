package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.Game;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WaitOpponentRegistrationServlet",
        urlPatterns = "/wait-opponent-registration")
public class WaitOpponentRegistrationServlet extends HttpServlet {

    @Inject
    private PlayerManager playerManager;

    @Override
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp)
            throws ServletException, IOException {
        final Game game = playerManager.getGame();

        if (game.isComplete()) {
            resp.sendRedirect(req.getContextPath() + "/placement.jsp");
        } else {
            req.getRequestDispatcher("/WEB-INF/wait-opponent-registration.jsp")
                    .include(req, resp);
        }
    }
}
