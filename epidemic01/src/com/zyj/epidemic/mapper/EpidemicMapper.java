package com.zyj.epidemic.mapper;

import com.zyj.epidemic.beans.EpidemicDetailInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface EpidemicMapper {

    @Select(value = "SELECT e1.`province_id`,temp.province_name, " +
            "       e1.`data_year`,e1.`data_month`,e1.`data_day`, " +
            "       temp.affirmed_total, " +
            "       temp.suspected_total, " +
            "       temp.isolated_total, " +
            "       temp.cured_total, " +
            "       temp.dead_total, " +
            "       e1.`affirmed`,e1.`suspected`,e1.`isolated`,e1.`cured`,e1.`dead` " +
            "FROM epidemics e1 RIGHT OUTER JOIN (SELECT e.`province_id`,p.`province_name`,SUM(e.`affirmed`) affirmed_total, " +
            "       SUM(e.`suspected`) suspected_total, " +
            "       SUM(e.`isolated`) isolated_total,SUM(e.`cured`) cured_total,SUM(e.`dead`) dead_total " +
            "FROM epidemics e RIGHT OUTER JOIN provinces p ON e.`province_id`=p.`province_id` " +
            "GROUP BY e.`province_id`,p.`province_name`) temp ON e1.`province_id`=temp.province_id " +
            "WHERE e1.`data_year`=#{year} " +
            "AND e1.`data_month`=#{month} " +
            "AND e1.`data_day`=#{day}")
    List<EpidemicDetailInfo> findLastestData(Map<String, Short> condition);
}
