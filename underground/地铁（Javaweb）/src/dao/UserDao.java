package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.*;

import util.DBUtil;
import java.sql.*;
public class UserDao {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1");
        return con;
    }

    /**时间复杂度比较复杂，因为换乘结点的关系导致的
     最坏情况下(每个站之间都有连线，但是地铁线路图实际上是不存在次情况的):O(2^n)
     相反
     最优情况下(之间只有唯一的连接点,次情况下也不是很现实的，有的地铁换乘是多个换乘点都在同一条线上的)
     此时用hashtable所以是:O(1)
     */
    /*private java.util.HashSet<String> GetF(java.util.HashSet<String> beginlist)
    {
        if (mainht == null || mainht.isEmpty())
        {
            return null;
        }
        returnlist = new java.util.HashSet<String>();

        if (beginlist.isEmpty())
        {
            isend = 1;
        }
        else
        {
            *//**O(n)
             *//*
            for (String strbegin : beginlist)
            {
                if (strbegin.indexOf("-") == -1 && mainht.containsKey(strbegin) == true) //have this key and first load data
                {
                    bxy = (double[])DCht.get(strbegin);
                    earry = mainht.get(strbegin).toString().split("[,]", -1);
                    for (String ar : earry)
                    {
                        exy = (double[])DCht.get(ar);
                        isadd = CK(isadd, bxy, exy);

                        if (isadd == true)
                        {
                            returnlist.add(strbegin + "-" + ar);
                            isend = 0;
                        }
                    }
                }
                else if (strbegin.indexOf("-") > -1 && mainht.containsKey(strbegin.substring(strbegin.lastIndexOf("-") + 1)) == true)
                {
                    temgstr = strbegin.substring(strbegin.lastIndexOf("-") + 1);
                    bxy = (double[])DCht.get(temgstr);
                    earry = mainht.get(temgstr).toString().split("[,]", -1); //exchange node
                    for (String ar : earry)
                    {
                        exy = (double[])DCht.get(ar);
                        isadd = CK(isadd, bxy, exy);

                        if (isadd == true)
                        {
                            if (!strbegin.contains(ar))
                            {
                                returnlist.add(strbegin + "-" + ar);
                            }
                            isend = 0;
                        }
                    }
                }

            }
        }

        earry = null;
        if (isend == 0)
        {
            return GetF(returnlist);
        }
        else
        {
            return null;
        }
    }*/



}
