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

@WebServlet(name = "RegistrationServlet", urlPatterns = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Inject
    private PlayerManager playerManager;

    @Override
    @SuppressWarnings("MethodDoesntCallSuperMethod")
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        final String userName = request.getParameter("username");
        final Player player = new Player();
        player.setName(userName);
        playerManager.registerPlayer(player);
        response.sendRedirect(request.getContextPath() + "/wait-opponent-registration");
    }

}