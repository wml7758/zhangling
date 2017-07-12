import javax.servlet.annotation.WebServlet;

import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.VaadinServlet;

import login.MainUI;

@WebServlet(urlPatterns = "/*", name = "MyUIServlet", asyncSupported = true)
@VaadinServletConfiguration(ui = com.example.myapplication.MainUI.class, productionMode = false)
public class MyUIServlet extends VaadinServlet {

	private static final long serialVersionUID = 4049754701548057623L;

}