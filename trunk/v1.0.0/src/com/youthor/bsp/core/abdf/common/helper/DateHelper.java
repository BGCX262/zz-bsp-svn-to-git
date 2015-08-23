package com.youthor.bsp.core.abdf.common.helper;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class DateHelper {
    
//     每月天数(非润年)
    static int daysInMonth[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

    // 闰年的特殊月份
    static final int MONTH_FEBRUARY = 2;

    public static final int PRECISE_YEAR = 1;

    public static final int PRECISE_MONTH = 2;

    public static final int PRECISE_DAY = 3;

    public static final int PRECISE_HOUR = 4;

    public static final int PRECISE_MINUTE = 5;

    public static final int PRECISE_SECOND = 6;

    public static final int PRECISE_MilliSECOND = 7;

    /**
     * 获得当天日期
     * 
     * @return yyyy-mm-dd
     */
    public static String getCurrentDateStr() {
        String curDateStr = "";
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        curDateStr = String.valueOf(year) + "-";
        curDateStr += ((month < 10) ? "0" + String.valueOf(month) : String
                .valueOf(month))
                + "-";
        curDateStr += ((day < 10) ? "0" + String.valueOf(day) : String
                .valueOf(day));
        return curDateStr;
    }

    /**
     * 获得当天日期
     * 
     * @return yymmdd 如040529
     */
    public static String getCurrentDateStrNoDiv() {
        String curDateStr = "";
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        curDateStr = String.valueOf(year).substring(2, 4) + "";
        curDateStr += ((month < 10) ? "0" + String.valueOf(month) : String
                .valueOf(month))
                + "";
        curDateStr += ((day < 10) ? "0" + String.valueOf(day) : String
                .valueOf(day));
        return curDateStr;
    }

    // 日期格式为2005-12-31
    public static Calendar ConvertStrToCalendar(String time) {
        int year = 0, month = 0, date = 0;
        if ((time != null) && (time.trim().length() == 0)) {
            year = 1900;
            month = 1;
            date = 1;
        } else {
            year = Integer.parseInt(time.substring(0, 4));
            month = Integer.parseInt(time.substring(5, 7)) - 1;
            date = Integer.parseInt(time.substring(8));
        }
        Calendar calendar = new GregorianCalendar(year, month, date);
        return calendar;
    }

    /**
     * 获得当前时间，精度到毫秒
     * 
     * @return hh:mm:ss.XXX
     */
    public static String getCurrentTimeStr() {
        String curTimeSr = "";
        Calendar cal = Calendar.getInstance();
        int hour = cal.get(Calendar.HOUR_OF_DAY);
        int minute = cal.get(Calendar.MINUTE);
        int second = cal.get(Calendar.SECOND);
        int milliSecond = cal.get(Calendar.MILLISECOND);
        curTimeSr = ((hour < 10) ? "0" + String.valueOf(hour) : String
                .valueOf(hour))
                + ":";
        curTimeSr += ((minute < 10) ? "0" + String.valueOf(minute) : String
                .valueOf(minute))
                + ":";
        curTimeSr += ((second < 10) ? "0" + String.valueOf(second) : String
                .valueOf(second));
        curTimeSr += "." + String.valueOf(milliSecond);
        return curTimeSr;
    }

    /**
     * 获得当天时间，精度到毫秒
     * 
     * @return yyyy-mm-dd hh-mm-ss.XXX
     */
    public static String getCurrentDateTimeStr() {
        String curDateTimeStr = "";
        curDateTimeStr = getCurrentDateStr() + " " + getCurrentTimeStr();
        return curDateTimeStr;
    }

    /**
     * 获得当前年份
     * 
     * @return yyyy
     */
    public static int getCurrentYear() {
        return Calendar.getInstance().get(Calendar.YEAR);
    }

    /**
     * 获取当前月份
     * 
     * @return
     */
    public static int getCurrentMonth() {
        return Calendar.getInstance().get(Calendar.MONTH) + 1;
    }

    /**
     * 获取当前日
     * 
     * @return
     */
    public static String getCurrentDay() {
        String str = null;
        int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
        if (day < 10) {
            str = "0" + day;
        } else {
            str = String.valueOf(day);
        }
        return str;
    }

    /**
     * 判断是否闰月，用于计算当前时间加上分钟后的时间
     * 
     * @param year
     *            年份
     * @return
     */
    public static boolean isLeapYear(int year) {
        // 能被100整除, 不能被400整除的年份, 不是闰年.
        // 能被100整除, 也能被400整除的年份, 是闰年.
        if ((year % 100) == 0) {
            return ((year % 400) == 0);
        } else // 不能被100整除, 能被4整除的年份是闰年.
        {
            return ((year % 4) == 0);
        }
    }

    /**
     * 计算当前时间加上秒钟后的时间,建议方法名换为increaseCurDateTime
     * 
     * @param addedSecond
     *            在当前时间上要加的秒数，注意输入的秒钟数不能大于一个月
     * @return yyyy-mm-dd hh-mm-ss.XXXX
     */
    public static String calDateTime(int addedSecond) {
        // 若要限制输入的秒钟数不能大于一个月，则应在此加以判断
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int hour = cal.get(Calendar.HOUR_OF_DAY);
        int minute = cal.get(Calendar.MINUTE);
        int second = cal.get(Calendar.SECOND);
        int millisecond = cal.get(Calendar.MILLISECOND);
        // 获取当前月含有的天数, 如果是闰年的二月, 加一天.
        int daysInCurMonth = daysInMonth[month - 1];
        if (isLeapYear(year) && (month == MONTH_FEBRUARY)) {
            daysInCurMonth += 1;
        }
        addedSecond += second;
        second = addedSecond % 60;
        // 输入的分钟数不能大于一个月 ？？？ pay attention to here
        minute = minute + addedSecond / 60;
        // 总的小时数
        hour = hour + minute / 60;
        // 分钟数
        minute = minute % 60;
        // 总的天数
        day = day + hour / 24;
        // 小时数
        hour = hour % 24;
        if (day > daysInCurMonth) {
            // 总的月份数,限制输入的秒钟数不能大于一个月的原因在此
            month = month + day / daysInCurMonth;
            // 天数
            day = day % daysInCurMonth;
        }
        if (month > 12) {
            // 总的年数
            year = year + month / 12;
            // 月份数
            month = month % 12;
        }
        String dateTimeStr = "1900-01-01";
        dateTimeStr = String.valueOf(year) + "-";
        dateTimeStr += ((month < 10) ? "0" + String.valueOf(month) : String
                .valueOf(month))
                + "-";
        dateTimeStr += ((day < 10) ? "0" + String.valueOf(day) : String
                .valueOf(day))
                + " ";
        dateTimeStr += ((hour < 10) ? "0" + String.valueOf(hour) : String
                .valueOf(hour))
                + ":";
        dateTimeStr += ((minute < 10) ? "0" + String.valueOf(minute) : String
                .valueOf(minute))
                + ":";
        dateTimeStr += ((second < 10) ? "0" + String.valueOf(second) : String
                .valueOf(second));
        dateTimeStr += "." + String.valueOf(millisecond);
        return dateTimeStr;
    }

    /**
     * 计算两个时间之间的时间差
     * 
     * @param strDateTime1
     *            减数，格式为yyyy-mm-dd hh-mm-ss
     * @param strDateTime2
     *            被减数，格式为yyyy-mm-dd hh-mm-ss
     * @return strDateTime1 - strDateTime2的时间差，单位为毫秒
     */
    public static long computeInterval(String strDateTime1, String strDateTime2) {
        long interval = 0;
        Timestamp date1 = convertStrToDate(strDateTime1);
        Timestamp date2 = convertStrToDate(strDateTime2);
        interval = date1.getTime() - date2.getTime();
        return interval;
    }

    /**
     * 得到指定精度的时间字符串
     * 
     * @param dateTimeString
     *            原始时间字符串，格式为yyyy-mm-dd hh:mm:ss
     * @param precise
     *            指定的精度
     * @return
     */
    public static String customDateTimeStr(String dateTimeString, int precise) {
        if (dateTimeString == null) {
            dateTimeString = "";
            return dateTimeString;
        }
        if (dateTimeString.trim().length() == 0) {
            return dateTimeString;
        }
        if (dateTimeString.startsWith("1900")) {
            dateTimeString = "";
            return dateTimeString;
        }
        if (precise == PRECISE_YEAR) {
            dateTimeString = dateTimeString.substring(0, 4);
        }
        if (precise == PRECISE_MONTH) {
            dateTimeString = dateTimeString.substring(0, 7);
        }
        if (precise == PRECISE_DAY) {
            dateTimeString = dateTimeString.substring(0, 10);
        }
        if (precise == PRECISE_HOUR) {
            dateTimeString = dateTimeString.substring(0, 13);
        }
        if (precise == PRECISE_MINUTE) {
            dateTimeString = dateTimeString.substring(0, 16);
        }
        return dateTimeString;
    }

    public static String convertDateToStr(Timestamp date) {
        String result = "1900-01-01 00:00:00.000";
        if (date != null) {
            result = date.toString();
        }
        return result;
    }

    public static Timestamp convertStrToDate(String strDate) {
        if (strDate == null) {
            strDate = "1900-01-01 00:00:00.000";
        } else {
            if (strDate.trim().length() == 0) {
                strDate = "1900-01-01 00:00:00.000";
            } else if (strDate.trim().length() == 10) // 传入的日期不包含时间
            {
                strDate += " 00:00:00.000";
            } else if (strDate.trim().length() == 16) // 传入的日期包含时间到分钟位,如2000-01-01
                                                        // 10:10
            {
                strDate += ":00.000";
            }
        }
        return Timestamp.valueOf(strDate);
    }

    public static Date getDateByNeedDays(int days) {
        java.util.Calendar   rightNow   =   Calendar.getInstance();   
          rightNow.add(Calendar.DATE,   days);
          return rightNow.getTime();
    }
    /**
     * 把日历类型转换成短日期
     * 
     * @param cal
     * @return
     */
    public static String convertCalToStr(Calendar cal) {
        if (cal == null) {
            return "";
        }
        String curDateStr = "";
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        curDateStr = String.valueOf(year) + "-";
        curDateStr += ((month < 10) ? "0" + String.valueOf(month) : String
                .valueOf(month))
                + "-";
        curDateStr += ((day < 10) ? "0" + String.valueOf(day) : String
                .valueOf(day));
        if (curDateStr != null && curDateStr.indexOf("1900") >= 0) {
            curDateStr = "";
        }
        return curDateStr;
    }

    /**
     * 将传入的string转换成calendar
     * 
     * @param dateTime
     *            ("2004-01-18 10:50:30")
     * @return true or false
     */
    public static Calendar converStrToCalendar(String dateTime) {
        if (dateTime == null) {
            return null;
        }
        if (dateTime.length() == 0) {
            return null;
        }
        Calendar cal = Calendar.getInstance(); // 取当前时间
        Timestamp timestamp = convertStrToDate(dateTime);
        String getYearString = dateTime.substring(0, 4);
        int year = Integer.parseInt(getYearString);
        Date toDate = (Date) timestamp;
        int month = toDate.getMonth();
        int date = toDate.getDate();
        int hour = toDate.getHours();
        int minute = toDate.getMinutes();
        int second = toDate.getSeconds();
        cal.set(year, month, date, hour, minute, second);
        return cal;
    }

    /**
     * 将string to date
     * aly.luo 2007-06-11
     * @param date
     * @param length
     * @return
     */
    public static Date converStrToDate(String date) {
        
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (date != null) {
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    return sdf.parse(date);
                } catch (ParseException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    return null;
                }
                // TODO Auto-generated catch block
                //e.printStackTrace();
            }
        } else {
            return null;
        }
    }
    
    public static String converDateToStr(Date date, int length) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String reStr = "";
        if (date != null) {
            reStr = sdf.format(date);
        } else {
            return "";
        }
        if (reStr.length() >= length) {
            return reStr.substring(0, length);
        }
        return reStr;
    }
    
    public static String converDateToLongStr(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String reStr = "";
        if (date != null) {
            reStr = sdf.format(date);
        } else {
            return "";
        }
        
        return reStr;
    }
    
    public static String converDateToShortStr(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String reStr = "";
        if (date != null) {
            reStr = sdf.format(date);
        } else {
            return "";
        }
        
        return reStr;
    }
    
    public static String converDateToUppercase(String date) {
        if(date==null || date.length()<10){
            return "";
        }
        String returnStr = "";
        String tmp = date.substring(0,4);
        StringBuffer yearbuf = new StringBuffer();
        for(int i=0; i<tmp.length(); i++) {
            yearbuf.append(converToChinese(tmp.substring(i,i+1),true));
        }
        returnStr = yearbuf.toString()+"年";
        tmp = date.substring(5,7);
        returnStr = returnStr + converToChinese(tmp) + "月";
        
        tmp = date.substring(8,10);
        returnStr = returnStr + converToChinese(tmp) + "日";
        
        return returnStr;
    }
    
    public static String converToChinese(String str){
        if(str==null || str.length()<2){
            return "";
        }
        StringBuffer buff = new StringBuffer();
        if(str.equals("10")){
            buff.append("十");
        }else if(str.substring(0,1).equals("0")){
            buff.append(converToChinese(str.substring(1,2),false));
        }else {
            buff.append(converToChinese(str.substring(0,1),false)).append("十")
            .append(converToChinese(str.substring(1,2),false));
        }
        return buff.toString();
    }
    
    public static String converToChinese(String str,boolean isyear){
        if(str==null) {
            return "";
        }
        if(str.equals("1")){
            return "一";
        }
        if(str.equals("2")){
            return "二";
        }
        if(str.equals("3")){
            return "三";
        }
        if(str.equals("4")){
            return "四";
        }
        if(str.equals("5")){
            return "五";
        }
        if(str.equals("6")){
            return "六";
        }
        if(str.equals("7")){
            return "七";
        }
        if(str.equals("8")){
            return "八";
        }
        if(str.equals("9")){
            return "九";
        }
        if(isyear){
            if(str.equals("0")){
                return "零";
            }
        }
        return "";
    }
    
    /**增加天数
     * @param date
     * @param n
     * @return
     */
    public static Date addDay(Date date, int n) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DAY_OF_MONTH, n);
            return cal.getTime();
     }
    
    /**
     * 根据给定的月份返回
     * @param months
     * @return
     */
    public static String converMonthToYear(int months){
        int year = months/12;
        int month = months%12;
        String returnValue = year+"年"+month+"个月";
        return returnValue;
    }
    
    
    public static int convertYearToMonth(String year){
        int yIndex = year.indexOf("年");
        int mIndex = year.indexOf("个月");
        String yearStr = year.substring(0,yIndex); 
        String monthStr = year.substring(yIndex+1,mIndex);
        int value = Integer.parseInt(yearStr)*12+Integer.parseInt(monthStr);
        return value;
    }
   
    /**
     * 获得当天日期精确到秒
     * 
     * @return yyyymmddhhss
     */
    public static String getCurrentDateToStr() {
        String curDateStr = "";
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int hour= cal.get(Calendar.HOUR);
        int min=cal.get(Calendar.MINUTE);
        int second=cal.get(Calendar.SECOND);
        curDateStr = String.valueOf(year);
        curDateStr += ((month < 10) ? "0" + String.valueOf(month) : String
                .valueOf(month));
        curDateStr += ((day < 10) ? "0" + String.valueOf(day) : String
                .valueOf(day));
        curDateStr += ((hour < 10) ? "0" + String.valueOf(hour) : String
                .valueOf(hour));
        curDateStr += ((min < 10) ? "0" + String.valueOf(min) : String
                .valueOf(min));
        curDateStr += ((second < 10) ? "0" + String.valueOf(second) : String
                .valueOf(second));
        return curDateStr;
    }
    
    public static void main(String[] args)
    {
       while(true){
        
        System.out.println(getCurrentDateToStr());
        try{
        Thread.sleep(1000);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       }
        //convertYearToMonth("6年10个月");
    }

}
