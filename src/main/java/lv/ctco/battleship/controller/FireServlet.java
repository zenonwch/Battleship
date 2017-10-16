package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.Game;
import lv.ctco.battleship.model.Player;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static lv.ctco.battleship.util.GameHelper.AJAX_REDIRECT_HEADER;

@WebServlet(name = "FireServlet", urlPatterns = "/fire")
@MultipartConfig
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
    }

    @Override
    protected void doGet(final HttpServletRequest request,
                         final HttpServletResponse response) throws ServletException, IOException {
        final Game game = playerManager.getGame();
        final Player currentPlayer = game.getCurrentPlayer();
        final Player sessionPlayer = playerManager.getPlayer();

        if (game.getWinner() != null) {
            final String redirectUrl = request.getContextPath() + "/eog";
            response.addHeader(AJAX_REDIRECT_HEADER, redirectUrl);
            request.getRequestDispatcher("/eog").include(request, response);
        }

        //noinspection ObjectEquality
        if (currentPlayer == sessionPlayer) {
            request.getRequestDispatcher("/WEB-INF/fire.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/wait-opponent-fire.jsp")
                    .include(request, response);
        }
    }
}
