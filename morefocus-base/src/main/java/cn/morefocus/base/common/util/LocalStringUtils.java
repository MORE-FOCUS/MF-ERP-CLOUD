package cn.morefocus.base.common.util;


import cn.hutool.core.util.StrUtil;
import org.springframework.util.AntPathMatcher;

import java.util.*;

/**
 * 独有的字符串工具类
 *
 * @author loki
 */
public class LocalStringUtils extends StrUtil {

    // ===============split =======================

    public static Set<String> splitConvertToSet(String str, String split) {
        if (isEmpty(str)) {
            return new HashSet<String>();
        }
        String[] splitArr = str.split(split);
        HashSet<String> set = new HashSet<String>(splitArr.length);
        Collections.addAll(set, splitArr);
        return set;
    }

    public static List<String> splitConvertToList(String str, String split) {
        if (isEmpty(str)) {
            return new ArrayList<String>();
        }
        String[] splitArr = str.split(split);
        ArrayList<String> list = new ArrayList<String>(splitArr.length);
        list.addAll(Arrays.asList(splitArr));
        return list;
    }

    // ===============split Integer=======================

    public static List<Integer> splitConvertToIntList(String str, String split, int defaultVal) {
        if (isEmpty(str)) {
            return new ArrayList<Integer>();
        }
        String[] strArr = str.split(split);
        List<Integer> list = new ArrayList<Integer>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                int parseInt = Integer.parseInt(strArr[i]);
                list.add(parseInt);
            } catch (NumberFormatException e) {
                list.add(defaultVal);
                continue;
            }
        }
        return list;
    }

    public static Set<Integer> splitConvertToIntSet(String str, String split, int defaultVal) {
        if (isEmpty(str)) {
            return new HashSet<Integer>();
        }
        String[] strArr = str.split(split);
        HashSet<Integer> set = new HashSet<Integer>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                int parseInt = Integer.parseInt(strArr[i]);
                set.add(parseInt);
            } catch (NumberFormatException e) {
                set.add(defaultVal);
                continue;
            }
        }
        return set;
    }

    public static Set<Integer> splitConvertToIntSet(String str, String split) {
        return splitConvertToIntSet(str, split, 0);
    }

    public static List<Integer> splitConvertToIntList(String str, String split) {
        return splitConvertToIntList(str, split, 0);
    }

    public static int[] splitConvertToIntArray(String str, String split, int defaultVal) {
        if (isEmpty(str)) {
            return new int[0];
        }
        String[] strArr = str.split(split);
        int[] result = new int[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            try {
                result[i] = Integer.parseInt(strArr[i]);
            } catch (NumberFormatException e) {
                result[i] = defaultVal;
                continue;
            }
        }
        return result;
    }

    public static int[] splitConvertToIntArray(String str, String split) {
        return splitConvertToIntArray(str, split, 0);
    }

    // ===============split 2 Long=======================

    public static List<Long> splitConvertToLongList(String str, String split, long defaultVal) {
        if (isEmpty(str)) {
            return new ArrayList<Long>();
        }
        String[] strArr = str.split(split);
        List<Long> list = new ArrayList<Long>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                long parseLong = Long.parseLong(strArr[i]);
                list.add(parseLong);
            } catch (NumberFormatException e) {
                list.add(defaultVal);
                continue;
            }
        }
        return list;
    }

    public static List<Long> splitConvertToLongList(String str, String split) {
        return splitConvertToLongList(str, split, 0L);
    }

    public static long[] splitConvertToLongArray(String str, String split, long defaultVal) {
        if (isEmpty(str)) {
            return new long[0];
        }
        String[] strArr = str.split(split);
        long[] result = new long[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            try {
                result[i] = Long.parseLong(strArr[i]);
            } catch (NumberFormatException e) {
                result[i] = defaultVal;
                continue;
            }
        }
        return result;
    }

    public static long[] splitConvertToLongArray(String str, String split) {
        return splitConvertToLongArray(str, split, 0L);
    }

    // ===============split convert byte=======================

    public static List<Byte> splitConvertToByteList(String str, String split, byte defaultVal) {
        if (isEmpty(str)) {
            return new ArrayList<Byte>();
        }
        String[] strArr = str.split(split);
        List<Byte> list = new ArrayList<Byte>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                byte parseByte = Byte.parseByte(strArr[i]);
                list.add(parseByte);
            } catch (NumberFormatException e) {
                list.add(defaultVal);
                continue;
            }
        }
        return list;
    }

    public static List<Byte> splitConvertToByteList(String str, String split) {
        return splitConvertToByteList(str, split, (byte) 0);
    }

    public static byte[] splitConvertToByteArray(String str, String split, byte defaultVal) {
        if (isEmpty(str)) {
            return new byte[0];
        }
        String[] strArr = str.split(split);
        byte[] result = new byte[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            try {
                result[i] = Byte.parseByte(strArr[i]);
            } catch (NumberFormatException e) {
                result[i] = defaultVal;
                continue;
            }
        }
        return result;
    }

    public static byte[] splitConvertToByteArray(String str, String split) {
        return splitConvertToByteArray(str, split, (byte) 0);
    }

    // ===============split convert double=======================

    public static List<Double> splitConvertToDoubleList(String str, String split, double defaultVal) {
        if (isEmpty(str)) {
            return new ArrayList<Double>();
        }
        String[] strArr = str.split(split);
        List<Double> list = new ArrayList<Double>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                double parseByte = Double.parseDouble(strArr[i]);
                list.add(parseByte);
            } catch (NumberFormatException e) {
                list.add(defaultVal);
                continue;
            }
        }
        return list;
    }

    public static List<Double> splitConvertToDoubleList(String str, String split) {
        return splitConvertToDoubleList(str, split, 0);
    }

    public static double[] splitConvertToDoubleArray(String str, String split, double defaultVal) {
        if (isEmpty(str)) {
            return new double[0];
        }
        String[] strArr = str.split(split);
        double[] result = new double[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            try {
                result[i] = Double.parseDouble(strArr[i]);
            } catch (NumberFormatException e) {
                result[i] = defaultVal;
                continue;
            }
        }
        return result;
    }

    public static double[] splitConvertToDoubleArray(String str, String split) {
        return splitConvertToDoubleArray(str, split, 0);
    }

    // ===============split convert float=======================

    public static List<Float> splitConvertToFloatList(String str, String split, float defaultVal) {
        if (isEmpty(str)) {
            return new ArrayList<Float>();
        }
        String[] strArr = str.split(split);
        List<Float> list = new ArrayList<Float>(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            try {
                float parseByte = Float.parseFloat(strArr[i]);
                list.add(parseByte);
            } catch (NumberFormatException e) {
                list.add(defaultVal);
                continue;
            }
        }
        return list;
    }

    public static List<Float> splitConvertToFloatList(String str, String split) {
        return splitConvertToFloatList(str, split, 0f);
    }

    public static float[] splitConvertToFloatArray(String str, String split, float defaultVal) {
        if (isEmpty(str)) {
            return new float[0];
        }
        String[] strArr = str.split(split);
        float[] result = new float[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            try {
                result[i] = Float.parseFloat(strArr[i]);
            } catch (NumberFormatException e) {
                result[i] = defaultVal;
                continue;
            }
        }
        return result;
    }

    public static float[] splitConvertToFloatArray(String str, String split) {
        return splitConvertToFloatArray(str, split, 0f);
    }


    public static String upperCaseFirstChar(String str) {
        if (str != null && !str.isEmpty()) {
            char firstChar = str.charAt(0);
            if (Character.isUpperCase(firstChar)) {
                return str;
            } else {
                char[] values = str.toCharArray();
                values[0] = Character.toUpperCase(firstChar);
                return new String(values);
            }
        } else {
            return str;
        }
    }

    public static String replace(String content, int begin, int end, String newStr) {
        if (begin < content.length() && begin >= 0) {
            if (end <= content.length() && end >= 0) {
                if (begin > end) {
                    return content;
                } else {
                    StringBuilder starStr = new StringBuilder();

                    for (int i = begin; i < end; ++i) {
                        starStr.append(newStr);
                    }

                    return content.substring(0, begin) + starStr + content.substring(end);
                }
            } else {
                return content;
            }
        } else {
            return content;
        }
    }

    /**
     * 判断url是否与规则配置:
     * ? 表示单个字符;
     * * 表示一层路径内的任意字符串，不可跨层级;
     * ** 表示任意层路径;
     *
     * @param pattern 匹配规则
     * @param url     需要匹配的url
     * @return
     */
    public static boolean isMatch(String pattern, String url) {
        AntPathMatcher matcher = new AntPathMatcher();
        return matcher.match(pattern, url);
    }

    @SuppressWarnings("unchecked")
    public static <T> T cast(Object obj) {
        return (T) obj;
    }

    /**
     * 数字左边补齐0，使之达到指定长度。注意，如果数字转换为字符串后，长度大于size，则只保留 最后size个字符。
     *
     * @param num  数字对象
     * @param size 字符串指定长度
     * @return 返回数字的字符串格式，该字符串为指定长度。
     */
    public static final String padl(final Number num, final int size) {
        return padl(num.toString(), size, '0');
    }

    /**
     * 字符串左补齐。如果原始字符串s长度大于size，则只保留最后size个字符。
     *
     * @param s    原始字符串
     * @param size 字符串指定长度
     * @param c    用于补齐的字符
     * @return 返回指定长度的字符串，由原字符串左补齐或截取得到。
     */
    public static final String padl(final String s, final int size, final char c) {
        final StringBuilder sb = new StringBuilder(size);
        if (s != null) {
            final int len = s.length();
            if (s.length() <= size) {
                for (int i = size - len; i > 0; i--) {
                    sb.append(c);
                }
                sb.append(s);
            } else {
                return s.substring(len - size, len);
            }
        } else {
            for (int i = size; i > 0; i--) {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}