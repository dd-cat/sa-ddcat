package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.dict.SysDictItem;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * @author dd-cat
 */
public interface SysDictItemMapper extends SuperMapper<SysDictItem> {
    /**
     * 修改子集type名称
     *
     * @param id   -
     * @param type -
     */
    @Update("update dict_item set type=#{type} where dict_id=#{id}")
    void updateBatchById(@Param("id") Long id, @Param("type") String type);
}
