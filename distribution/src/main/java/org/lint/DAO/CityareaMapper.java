package org.lint.DAO;

import java.util.List;
import org.lint.Entity.Cityarea;

public interface CityareaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cityarea
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String areaid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cityarea
     *
     * @mbg.generated
     */
    int insert(Cityarea record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cityarea
     *
     * @mbg.generated
     */
    Cityarea selectByPrimaryKey(String areaid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cityarea
     *
     * @mbg.generated
     */
    List<Cityarea> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cityarea
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Cityarea record);
}