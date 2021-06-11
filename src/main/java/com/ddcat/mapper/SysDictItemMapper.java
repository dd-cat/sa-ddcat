package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ddcat.entity.SysDictItem;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * @author dd-cat
 */
public interface SysDictItemMapper extends BaseMapper<SysDictItem> {
    /**
     * 修改子集type名称
     *
     * @param id   -
     * @param type -
     */
    @Update("update dict_item set type=#{type} where dict_id=#{id}")
    void updateBatchById(@Param("id") Long id, @Param("type") String type);
}