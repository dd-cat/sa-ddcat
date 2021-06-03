package com.ddcat.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.SysRole;
import com.ddcat.entity.vo.role.RolePageRequest;
import com.ddcat.entity.vo.role.RoleSaveRequest;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysRoleService extends BaseService<SysRole> {

    /**
     * 分页查询
     *
     * @param r -
     * @return -
     */
    IPage<SysRole> page(RolePageRequest r);

    /**
     * 保存or修改
     *
     * @param r -
     */
    void saveOrUpdate(RoleSaveRequest r);

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