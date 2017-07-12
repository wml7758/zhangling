package com.example.myapplication;

import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.ui.AbstractLayout;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.themes.Reindeer;

public class LoginView extends VerticalLayout implements View{
	private static final long serialVersionUID = 353255694576933912L;
	
	private Navigator navigator;
	
	public LoginView(Navigator navigator){
		this.navigator = navigator;
		
		AbstractLayout form = new FormLayout();
		form.addComponent(new TextField("账号"));
		form.addComponent(new TextField("密码"));
		form.addComponent(new Button("登录"));
		form.setSizeUndefined();
		
		this.addComponent(form);
		this.setSizeFull();
		this.setComponentAlignment(form, Alignment.MIDDLE_CENTER);
		this.setStyleName(Reindeer.LAYOUT_BLUE);
	}

	@Override
	public void enter(ViewChangeEvent event) {
		//this.setSizeFull();
	}
}
