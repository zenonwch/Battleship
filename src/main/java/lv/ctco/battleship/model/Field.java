package lv.ctco.battleship.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Field implements Serializable {
    private static final long serialVersionUID = 1;

    private final Map<String, CellContent> content = new HashMap<>();

    public Map<String, CellContent> getContent() {
        return content;
    }

    public CellContent get(final String addr) {
        return content.getOrDefault(addr, CellContent.EMPTY);
    }

    public void set(final String addr, final CellContent cc) {
        content.put(addr, cc);
    }
}
