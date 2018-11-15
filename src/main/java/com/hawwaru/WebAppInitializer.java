package com.hawwaru;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    //middle tier services, datasources
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }
    //place for controllers, view resolverrs, web-related beans
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] {WebConfig.class};
    }

    protected String[] getServletMappings() {
        return new String[] {"/"};
    }
}
