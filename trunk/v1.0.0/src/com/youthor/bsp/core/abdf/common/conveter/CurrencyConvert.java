package com.youthor.bsp.core.abdf.common.conveter;

import java.text.DecimalFormat;
import java.text.ParseException;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.lang.StringUtils;


public class CurrencyConvert implements Converter {
    protected final DecimalFormat formatter = new DecimalFormat("###,###.00");

    /**
     * 将一个字符串转换成为Double或将一个Double转换成为String
     *
     * @param type the class type to output
     * @param value the object to convert
     * @return object the converted object (Double or String)
     */
    public final Object convert(final Class type, final Object value) {
     
        if (value == null) {
            return null;
        } else {
            if (value instanceof String) {
                try {
                    if (StringUtils.isEmpty(String.valueOf(value))) {
                        return null;
                    }

                    Number num = formatter.parse(String.valueOf(value));

                    return new Double(num.doubleValue());
                } catch (ParseException pe) {
                    pe.printStackTrace();
                }
            } else if (value instanceof Double) {
                return formatter.format(value);
            }
        }

        throw new ConversionException("无法转换值: " + value + " to " + type.getName() + "!");
    }
}
