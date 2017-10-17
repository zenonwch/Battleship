package lv.ctco.battleship.filter;

import lv.ctco.battleship.model.Game;
import lv.ctco.battleship.model.Player;
import lv.ctco.battleship.model.PlayerManager;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "RegistrationFilter", urlPatterns = "/*")
public class RegistrationFilter implements Filter {

    @Inject
    private PlayerManager playerManager;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(final ServletRequest req, final ServletResponse resp,
                         final FilterChain chain) throws ServletException, IOException {
        final HttpServletRequest request = (HttpServletRequest) req;
        final HttpServletResponse response = (HttpServletResponse) resp;

        final Player player = playerManager.getPlayer();
        final Game game = playerManager.getGame();

        final String path = request.getServletPath();

        final String reqUri = request.getRequestURI();
        final String contextPath = request.getContextPath();
        if (reqUri != null && reqUri.startsWith(contextPath + "/static/")) {
            chain.doFilter(req, resp);
        }

        if (player != null || "/index.jsp".equals(path) || "/registration".equals(path)) {
            if (game != null && game.isCanceled()) {
                final String redirectUrl = "/WEB-INF/cancelled.jsp";
                request.getRequestDispatcher(redirectUrl)
                        .include(request, response);
                request.getSession().invalidate();
            } else {
                chain.doFilter(req, resp);
            }
        } else {
            final String redirectUrl = request.getContextPath() + "/index.jsp";
            response.sendRedirect(redirectUrl);
        }

    }

    @Override
    public void init(final FilterConfig config) throws ServletException {
    }

}
