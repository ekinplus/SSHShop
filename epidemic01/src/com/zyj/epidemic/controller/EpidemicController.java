package com.zyj.epidemic.controller;

import com.zyj.epidemic.beans.*;
import com.zyj.epidemic.service.EpidemicService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {

    private Logger logger = Logger.getLogger(EpidemicController.class);

    @Autowired
    private EpidemicService epidemicService;

    @GetMapping("/ajax/lastestData")
    @ResponseBody
    public AjaxResponseInfo findLastestData(){
        AjaxResponseInfo responseInfo=new AjaxResponseInfo();
        List<EpidemicDetailInfo> list=this.epidemicService.findLastestData();
        responseInfo.setData(list);
        return responseInfo;
    }
}
