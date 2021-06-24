package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.user.*;
import com.ddcat.exception.BusinessException;
import com.ddcat.menu.ResultEnum;
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
    @Log("当前登录用户信息")
    @GetMapping("info")
    @SaCheckLogin
    public UserLoginVO info() {
        return service.info();
    }

    /**
     * 分页查询
     *
     * @param dto -
     */
    @Log("用户分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<UserPageVO> page(@RequestBody UserPageDTO dto) {
        return service.page(dto);
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
     * @param dto -
     */
    @Log("用户保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:user:add", "sys:user:edit"})
    public void saveOrUpdate(@Valid @RequestBody UserSaveDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 用户删除
     */
    @Log("用户删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:user:del")
    public void delete(@PathVariable long id) {
        var loginId = StpUtil.getLoginIdAsLong();
        if (id == loginId) {
            throw new BusinessException(ResultEnum.B000002);
        }
        var entity = new SysUser();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }

    /**
     * 在线离线用户列表
     *
     * @param dto -
     * @return -
     */
    @PostMapping("online")
    @SaCheckLogin
    public IPage<UserOnlineListVO> online(@RequestBody UserOnlineListDTO dto) {
        return service.online(dto);
    }

    /**
     * 导入
     *
     * @param file excel文件
     */
    @PostMapping("import")
    public void importData(MultipartFile file) throws IOException {
        var list = ExcelUtils.importExcel(file, 0, 1, UserImportVO.class);
        for (var vo : list) {
            var entity = new SysUser();
            BeanUtil.copyProperties(vo, entity);
            entity.setSex(Byte.valueOf(vo.getSex()));
            service.save(entity);
        }
    }

    /**
     * 修改当前登陆人密码
     *
     * @param dto -
     */
    @PutMapping("/updatePassword")
    public void updatePassword(@RequestBody UserPasswordDTO dto) {
        service.updatePassword(dto);
    }

}
