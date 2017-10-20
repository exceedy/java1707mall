package com.situ.mall.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.situ.mall.service.IStaticPageService;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Service
public class StaticPageServiceImpl implements IStaticPageService,ServletContextAware {
	private ServletContext servletContext;
	
	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;
	
	public boolean productIndex(Map<String, Object> root, Integer id) {
		Configuration conf = freeMarkerConfigurer.getConfiguration();
		Writer out = null;
		try {
			Template template = conf.getTemplate("product_details.ftl");
			String path = getPath("/html/" + id +  ".html");
			File file = new File(path);
			File parentFile = file.getParentFile();
			if (!parentFile.exists()) {
				parentFile.mkdirs();
			}
			out = new OutputStreamWriter(new FileOutputStream(file),"utf-8");
			template.process(root,out);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} catch (TemplateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	private String getPath(String name) {
		return servletContext.getRealPath(name);
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}


	
}
