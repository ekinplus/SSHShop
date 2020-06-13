package com.zyj.epidemic.service;

import com.zyj.epidemic.beans.EpidemicDetailInfo;

import java.util.List;

public interface EpidemicService {
    List<EpidemicDetailInfo> findLastestData();
}
