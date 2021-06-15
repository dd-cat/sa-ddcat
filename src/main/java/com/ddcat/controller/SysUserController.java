package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.vo.user.*;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 用户
 *
 * @author dd-cat
 */
@RequestMapping("user")
@RestController
@RequiredArgsConstructor
public class SysUserController {

    private final SysUserService service;

    /**
     * 分页查询
     *
     * @param r -
     */
    @Log("用户分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<UserPageResponse> page(@RequestBody UserPageRequest r) {
        return service.page(r);
    }

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
    @Log("用户根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysUser getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 保存or修改
     *
     * @param r -
     */
    @Log("用户保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:user:add", "sys:user:edit"})
    public void saveOrUpdate(@Valid @RequestBody UserSaveRequest r) {
        service.saveOrUpdate(r);
        if (r.getId() != null && StrUtil.isNotBlank(r.getPassword())) {
            //修改了密码 注销登录
            StpUtil.logoutByLoginId(r.getId());
        }
    }

    /**
     * 用户删除
     */
    @Log("用户删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:user:del")
    public void delete(@PathVariable long id) {
        SysUser entity = new SysUser();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }

    /**
     * 在线用户列表
     *
     * @param r -
     * @return -
     */
    @PostMapping("online")
    @SaCheckLogin
    public List<UserOnlineListResponse> online(@RequestBody UserOnlineListRequest r) {
        return service.online(r);

    }

}