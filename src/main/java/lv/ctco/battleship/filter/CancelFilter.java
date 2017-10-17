package lv.ctco.battleship.filter;

import lv.ctco.battleship.model.Game;
import lv.ctco.battleship.model.Player;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "CancelFilter", urlPatterns = "/*")
@MultipartConfig
public class CancelFilter implements Filter {

    @Inject
    private PlayerManager playerManager;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(final ServletRequest req, final ServletResponse resp,
                         final FilterChain chain) throws ServletException, IOException {

        final HttpServletRequest request = (HttpServletRequest) req;
        final String cancel = request.getParameter("cancel");

        if ("yes".equals(cancel)) {
            final Game game = playerManager.getGame();

            if (game != null) {
                game.setCanceled(true);

                final Player opponent = game.getOppositePlayer();
                game.setWinner(opponent);
            }

            request.getRequestDispatcher("/WEB-INF/goodbye.jsp")
                    .include(request, resp);
            request.getSession().invalidate();
        } else {
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void init(final FilterConfig config) throws ServletException {

    }

}
