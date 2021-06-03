package com.ddcat.entity.common;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 树基础实体
 *
 * @author dd-cat
 */
@Data
public class TreeBaseEntity extends BaseEntity {
    /**
     * 父节点ID
     */
    private Long parentId;
    /**
     * 名称
     */
    private String name;

    /**
     * 递归获取下级节点
     *
     * @param parentId -
     * @param list     -
     * @return -
     */
    public static List<TreeEntity> recursionTree(Long parentId, List<? extends TreeBaseEntity> list) {
        List<TreeEntity> tree = new ArrayList<>();
        for (TreeBaseEntity item : list) {
            if (Objects.equals(item.getParentId(), parentId)) {
                tree.add(new TreeEntity(item.getId(), item.getName()
                        , recursionTree(item.getId(), list)));
            }
        }
        return tree;
    }

    /**
     * 递归获取下级节点ID
     *
     * @param parentId -
     * @param list     -
     * @return -
     */
    public static void recursionTreeId(Long parentId, List<Long> ids, List<? extends TreeBaseEntity> list) {
        for (TreeBaseEntity item : list) {
            if (Objects.equals(item.getParentId(), parentId)) {
                ids.add(item.getId());
                recursionTreeId(item.getId(), ids, list);
            }
        }
    }
}