package lv.ctco.battleship.controller;

import lv.ctco.battleship.model.CellContent;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

import static lv.ctco.battleship.util.GameHelper.AJAX_REDIRECT_HEADER;

@WebServlet(name = "PlacementServlet", urlPatterns = "/placement")
public class PlacementServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(PlacementServlet.class.getName());
    private static final int NUMBER_OF_SHIP_PARTS = 1;

    @Inject
    private PlayerManager playerManager;

    @Override
    @SuppressWarnings("MethodDoesntCallSuperMethod")
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        final String[] addresses = request.getParameterValues("cell");
        logger.log(Level.FINER, () -> "Placement request received " + Arrays.toString(addresses));

        boolean error = true;
        if (addresses == null || addresses.length < NUMBER_OF_SHIP_PARTS) {
            request.setAttribute("errorNotEnough", true);
        } else if (addresses.length > NUMBER_OF_SHIP_PARTS) {
            request.setAttribute("errorTooMany", true);
        } else {
            error = false;
        }
        playerManager.getPlayer().getMyField().getContent().clear();

        if (addresses != null) {
            for (final String addr : addresses) {
                playerManager.getPlayer().getMyField().set(addr, CellContent.SHIP);
            }
        }

        if (error) {
            request.getRequestDispatcher("/placement.jsp").include(request, response);
        } else {
            playerManager.getPlayer().setReady(true);
            response.sendRedirect(request.getContextPath() + "/wait-opponent-ships");
        }
    }

}
