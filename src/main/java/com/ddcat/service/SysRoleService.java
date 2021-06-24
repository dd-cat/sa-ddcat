package com.ddcat.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.role.RolePageDTO;
import com.ddcat.entity.role.RoleSaveDTO;
import com.ddcat.entity.role.SysRole;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysRoleService extends BaseService<SysRole> {

    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    IPage<SysRole> page(RolePageDTO dto);

    /**
     * 保存or修改
     *
     * @param dto -
     */
    void saveOrUpdate(RoleSaveDTO dto);

    /**
     * 删除
     *
     * @param id -
     * @return -
     */
    void removeById(long id);

    /**
     * 通过用户ID，查询角色信息
     *
     * @param userId 用户id
     * @return -
     */
    List<SysRole> findRolesByUserId(Long userId);
}
