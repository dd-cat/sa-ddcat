package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.entity.user.*;
import com.ddcat.service.SysUserService;
import com.ddcat.util.ExcelUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

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
     * 当前登录用户信息
     */
    @GetMapping("info")
    @SaCheckLogin
    public UserLoginVO info() {
        return service.info();
    }

    /**
     * 分页查询
     */
    @PostMapping("page")
    @SaCheckLogin
    public IPage<UserPageVO> page(@RequestBody UserPageDTO dto) {
        return service.page(dto);
    }

    /**
     * 根据ID查询单个
     */
    @GetMapping("{id}")
    @SaCheckLogin
    public UserVo getById(@PathVariable long id) {
        return service.selectId(id);
    }

    /**
     * 保存or修改
     */
    @PostMapping
    @SaCheckPermission({"sys:user:add", "sys:user:edit"})
    public void saveOrUpdate(@Valid @RequestBody UserDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 用户删除
     */
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:user:del")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }

    /**
     * 在线离线用户列表
     */
    @PostMapping("online")
    @SaCheckLogin
    public IPage<UserOnlineListVO> online(@RequestBody UserOnlineListDTO dto) {
        return service.online(dto);
    }

    /**
     * 导入
     */
    @PostMapping("import")
    @SaCheckPermission("sys:user:import")
    public void importData(MultipartFile file) throws IOException {
        var list = ExcelUtils.importExcel(file, 0, 1, UserImportVO.class);
        for (var vo : list) {
            var entity = new SysUser();
            BeanUtil.copyProperties(vo, entity);
            entity.setSex("0".equals(vo.getSex()));
            service.save(entity);
        }
    }

    /**
     * 修改当前登陆人密码
     */
    @PutMapping("/updatePassword")
    @SaCheckPermission("sys:user:edit")
    public void updatePassword(@RequestBody UserPasswordDTO dto) {
        service.updatePassword(dto);
    }

}
