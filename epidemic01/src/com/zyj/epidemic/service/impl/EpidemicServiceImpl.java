package com.zyj.epidemic.service.impl;

import com.zyj.epidemic.beans.EpidemicDetailInfo;
import com.zyj.epidemic.mapper.EpidemicMapper;
import com.zyj.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicMapper epidemicMapper;

    @Override
    public List<EpidemicDetailInfo> findLastestData() {
        //查询每个省份的累计数量和当日新增数量
        Calendar calendar = new GregorianCalendar();
        short year = 0, month = 0, day = 0;
        year = (short) calendar.get(Calendar.YEAR);
        month = (short) (calendar.get(Calendar.MONTH) + 1);
        day = (short) calendar.get(Calendar.DATE);

        Map<String, Short> condition = new HashMap<>();
        condition.put("year", year);
        condition.put("month", month);
        condition.put("day", day);
        //查询每个省份的累计数量和当日新增数量
        List<EpidemicDetailInfo> list = this.epidemicMapper.findLastestData(condition);
        return list;
    }
}
