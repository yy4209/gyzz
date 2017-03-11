package com.leoman.utils;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * serServer数据库操作工具类
 * Created by 涂奕恒 on 2017/2/7 0007.
 */
public class DbUtilsTemplate {

    private DataSource dataSource;
    private QueryRunner queryRunner;
    private static final Log LOG = LogFactory.getLog(DbUtilsTemplate.class);

    public void setDataSource(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * 执行sql语句
     *
     * @param sql sql语句
     * @return 受影响的行数
     */
    public int update(String sql) {
        return update(sql, null);
    }

    /**
     * 执行sql语句
     * <code>
     * executeUpdate("update user set username = 'kitty' where username = ?", "hello kitty");
     * </code>
     *
     * @param sql   sql语句
     * @param param 参数
     * @return 受影响的行数
     */
    public int update(String sql, Object param) {
        return update(sql, new Object[]{param});
    }

    /**
     * 执行sql语句
     *
     * @param sql    sql语句
     * @param params 参数数组
     * @return 受影响的行数
     */
    public int update(String sql, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        int affectedRows = 0;
        try {
            if (params == null) {
                affectedRows = queryRunner.update(sql);
            } else {
                affectedRows = queryRunner.update(sql, params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to update data", e);
        }
        return affectedRows;
    }

    /**
     * 执行批量sql语句
     *
     * @param sql    sql语句
     * @param params 二维参数数组
     * @return 受影响的行数的数组
     */
    public int[] batchUpdate(String sql, Object[][] params) {
        queryRunner = new QueryRunner(dataSource, true);
        int[] affectedRows = new int[0];
        try {
            affectedRows = queryRunner.batch(sql, params);
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to batch update data", e);
        }
        return affectedRows;
    }

    /**
     * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
     *
     * @param sql sql语句
     * @return 查询结果
     */
    public List<Map<String, Object>> queryForList(String sql) {
        return queryForList(sql, null);
    }

    /**
     * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
     *
     * @param sql   sql语句
     * @param param 参数
     * @return 查询结果
     */
    public List<Map<String, Object>> queryForList(String sql, Object param) {
        return queryForList(sql, new Object[]{param});
    }

    /**
     * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
     *
     * @param sql    sql语句
     * @param params 参数数组
     * @return 查询结果
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> queryForList(String sql, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        try {
            if (params == null) {
                list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
            } else {
                list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return list;
    }

    /**
     * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @return 查询结果
     */
    public <T> List<T> queryForList(Class<T> entityClass, String sql) {
        return queryForList(entityClass, sql, null);
    }

    /**
     * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @param param       参数
     * @return 查询结果
     */
    public <T> List<T> queryForList(Class<T> entityClass, String sql, Object param) {
        return queryForList(entityClass, sql, new Object[]{param});
    }

    /**
     * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @param params      参数数组
     * @return 查询结果
     */
    @SuppressWarnings("unchecked")
    public <T> List<T> queryForList(Class<T> entityClass, String sql, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        List<T> list = new ArrayList<T>();
        try {
            if (params == null) {
                list = (List<T>) queryRunner.query(sql, new BeanListHandler(entityClass));
            } else {
                list = (List<T>) queryRunner.query(sql, new BeanListHandler(entityClass), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return list;
    }

    /**
     * 查询出结果集中的第一条记录，并封装成对象
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @return 对象
     */
    public <T> T query(Class<T> entityClass, String sql) {
        return queryFirst(entityClass, sql, null);
    }

    /**
     * 查询出结果集中的第一条记录，并封装成对象
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @param param       参数
     * @return 对象
     */
    public <T> T queryFirst(Class<T> entityClass, String sql, Object param) {
        return queryFirst(entityClass, sql, new Object[]{param});
    }

    /**
     * 查询出结果集中的第一条记录，并封装成对象
     *
     * @param entityClass 类名
     * @param sql         sql语句
     * @param params      参数数组
     * @return 对象
     */
    @SuppressWarnings("unchecked")
    public <T> T queryFirst(Class<T> entityClass, String sql, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        Object object = null;
        try {
            if (params == null) {
                object = queryRunner.query(sql, new BeanHandler(entityClass));
            } else {
                object = queryRunner.query(sql, new BeanHandler(entityClass), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return (T) object;
    }

    /**
     * 查询出结果集中的第一条记录，并封装成Map对象
     *
     * @param sql sql语句
     * @return 封装为Map的对象
     */
    public Map<String, Object> queryFirst(String sql) {
        return queryFirst(sql, null);
    }

    /**
     * 查询出结果集中的第一条记录，并封装成Map对象
     *
     * @param sql   sql语句
     * @param param 参数
     * @return 封装为Map的对象
     */
    public Map<String, Object> queryFirst(String sql, Object param) {
        return queryFirst(sql, new Object[]{param});
    }

    /**
     * 查询出结果集中的第一条记录，并封装成Map对象
     *
     * @param sql    sql语句
     * @param params 参数数组
     * @return 封装为Map的对象
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> queryFirst(String sql, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        Map<String, Object> map = null;
        try {
            if (params == null) {
                map = (Map<String, Object>) queryRunner.query(sql, new MapHandler());
            } else {
                map = (Map<String, Object>) queryRunner.query(sql, new MapHandler(), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return map;
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql        sql语句
     * @param columnName 列名
     * @return 结果对象
     */
    public Object queryForObject(String sql, String columnName) {
        return queryForOjbect(sql, columnName, null);
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql        sql语句
     * @param columnName 列名
     * @param param      参数
     * @return 结果对象
     */
    public Object queryForObject(String sql, String columnName, Object param) {
        return queryForOjbect(sql, columnName, new Object[]{param});
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql        sql语句
     * @param columnName 列名
     * @param params     参数数组
     * @return 结果对象
     */
    public Object queryForOjbect(String sql, String columnName, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        Object object = null;
        try {
            if (params == null) {
                object = queryRunner.query(sql, new ScalarHandler(columnName));
            } else {
                object = queryRunner.query(sql, new ScalarHandler(columnName), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return object;
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql         sql语句
     * @param columnIndex 列索引
     * @return 结果对象
     */
    public Object queryForObject(String sql, int columnIndex) {
        return queryForObject(sql, columnIndex, null);
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql         sql语句
     * @param columnIndex 列索引
     * @param param       参数
     * @return 结果对象
     */
    public Object queryForObject(String sql, int columnIndex, Object param) {
        return queryForObject(sql, columnIndex, new Object[]{param});
    }

    /**
     * 查询某一条记录，并将指定列的数据转换为Object
     *
     * @param sql         sql语句
     * @param columnIndex 列索引
     * @param params      参数数组
     * @return 结果对象
     */
    public Object queryForObject(String sql, int columnIndex, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        Object object = null;
        try {
            if (params == null) {
                object = queryRunner.query(sql, new ScalarHandler(columnIndex));
            } else {
                object = queryRunner.query(sql, new ScalarHandler(columnIndex), params);
            }
        } catch (SQLException e) {
            LOG.error("Error occured while attempting to query data", e);
        }
        return object;
    }

    /**
     * 获取记录数
     *
     * @param sql
     * @param entityClass
     * @return 结果对象
     */
    public Object getCount(String sql, Class entityClass) {
        queryRunner = new QueryRunner(dataSource, true);
        Object i = null;
        try {
            List list = (List) queryRunner.query(sql, new BeanListHandler(entityClass));
            if (list.size() > 0) {
                i = list.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 获取记录数
     *
     * @param sql
     * @param entityClass
     * @param param
     * @return 结果对象
     */
    public Object getCount(String sql, Class entityClass, Object param) {
        return getCount(sql, entityClass, new Object[]{param});
    }

    /**
     * 获取记录数
     *
     * @param sql
     * @param entityClass
     * @param params
     * @return 结果对象
     */
    public Object getCount(String sql, Class entityClass, Object[] params) {
        queryRunner = new QueryRunner(dataSource, true);
        Object i = null;
        try {
            if (params == null) {
                i = getCount(sql, entityClass);
            } else {
                List list = (List) queryRunner.query(sql, new BeanListHandler(entityClass), params);
                if (list.size() > 0) {
                    i = list.get(0);
                }
            }
        } catch (Exception e) {
        }
        return i;
    }
}
