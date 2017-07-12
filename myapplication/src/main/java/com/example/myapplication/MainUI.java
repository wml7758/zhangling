package com.example.myapplication;

import com.vaadin.annotations.Theme;
import com.vaadin.navigator.Navigator;
import com.vaadin.server.VaadinRequest;
import com.vaadin.ui.UI;

@Theme("mytheme")
public class MainUI extends UI {
	private static final long serialVersionUID = 2123628334309501295L;

	public static final String WIN_LOGIN = "win_login";
	public static final String WIN_STUDENT = "win_student";
	public static final String WIN_TEACHER = "win_teacher";
	public static final String WIN_ADMIN = "win_admin";
	
	@Override
	protected void init(VaadinRequest vaadinRequest) {
		
		new Navigator(this, this);
		getNavigator().addView("", new LoginView(getNavigator()));
		getNavigator().addView("login", new MainView(getNavigator()));
		
		/*final VerticalLayout layout = new VerticalLayout();

		final TextField name = new TextField();
		name.setCaption("输入名字:");
		Button button = new Button("点击");

		Notification notif = new Notification("Warning", "<br/>Area of reindeer husbandry", Type.ERROR_MESSAGE);
		notif.setDelayMsec(20000);
		notif.setPosition(Position.TOP_CENTER);
		notif.setStyleName("mystyle");
		notif.setIcon(new ThemeResource("img/test.png"));

		button.addClickListener(e -> {
			layout.addComponent(new Label("Thanks " + name.getValue() + ", it works!"));
			Notification.show("afsdasd", Type.ERROR_MESSAGE);
			notif.show(Page.getCurrent());
		});
		layout.addComponents(name, button);

		Panel panel = new Panel("登录");
		panel.addStyleName(Reindeer.PANEL_LIGHT);
		panel.setSizeUndefined(); // Shrink to fit content
		layout.addComponent(panel);
		
		FormLayout form = new FormLayout();
		form.addComponent(new TextField("账号"));
		form.addComponent(new TextField("密码"));
		form.setMargin(true);
		panel.setContent(form);
		
		String basepath = VaadinService.getCurrent().getBaseDirectory().getAbsolutePath();
		FileResource resource = new FileResource(new File(basepath + "/images/test.png"));
		Image image = new Image("Image from file", resource);
		layout.addComponent(image);

		layout.setMargin(true);
		layout.setSpacing(true);
		setContent(layout);

		VaadinSession.getCurrent();
		UI.getCurrent().getSession().setAttribute("type", "0");
		UI.getCurrent().getPage().setTitle("王明亮");
		Page.getCurrent().setTitle("王明亮");*/

	}

	/*@WebServlet(urlPatterns = "/*", name = "MyUIServlet", asyncSupported = true)
	@VaadinServletConfiguration(ui = MainUI.class, productionMode = false)
	public static class MyUIServlet extends VaadinServlet {

	}*/
}
