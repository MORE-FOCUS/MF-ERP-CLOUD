package cn.morefocus.admin.constant;

import cn.morefocus.base.constant.CacheKeyConst;

/**
 * 缓存 key
 */
public class AdminCacheConst extends CacheKeyConst {

    public static class Department {

        /**
         * 部门列表
         */
        public static final String DEPARTMENT_LIST_CACHE = "department_list_cache";

        /**
         * 部门map
         */
        public static final String DEPARTMENT_MAP_CACHE = "department_map_cache";

        /**
         * 部门树
         */
        public static final String DEPARTMENT_TREE_CACHE = "department_tree_cache";

        /**
         * 某个部门以及下级的id列表
         */
        public static final String DEPARTMENT_SELF_CHILDREN_CACHE = "department_self_children_cache";

        /**
         * 部门路径 缓存
         */
        public static final String DEPARTMENT_PATH_CACHE = "department_path_cache";

    }

    /**
     * 分类相关缓存
     */
    public static class Category {

        public static final String CATEGORY_ENTITY = "category_cache";

        public static final String CATEGORY_SUB = "category_sub_cache";

        public static final String CATEGORY_TREE = "category_tree_cache";

        public static final String CATEGORY_LIST = "category_list_cache";
    }

    /**
     * 单位相关缓存
     */
    public static class Unit {

        public static final String UNIT_ENTITY = "unit_cache";

        public static final String UNIT_LIST = "unit_list_cache";
    }

    /**
     * 单位相关缓存
     */
    public static class Attrs {
        public static final String ATTRS_ENTITY = "attrs_cache";
        public static final String ATTRS_LIST = "attrs_list_cache";
    }

    /**
     * 商品条形码
     */
    public static class BARCODE {
        public static final String SPU_BARCODE = "spu_barcode";
    }
}
