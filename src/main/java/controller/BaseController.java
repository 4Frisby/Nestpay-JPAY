package controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class BaseController {

    private static int counter = 0;
    private static final String Model3D = "3DModel";
    private static final String odemesayfasi = "odemesayfasi";
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

    @RequestMapping(value = "/Model3D", method = RequestMethod.GET)
    public String welcome(ModelMap model) {
        

        logger.debug("[Model3D]");
        return Model3D;

    }


}