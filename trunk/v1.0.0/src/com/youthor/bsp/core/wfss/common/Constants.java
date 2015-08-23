package com.youthor.bsp.core.wfss.common;

public class Constants {
    
    public static final String WF_DB="DB"; //待办标示
    public static final String WF_YB="YB";//已办标示
    public static final String WF_DD="DD";//顺序会签中的待办
    public static final String WF_DDQR="DDQR";//等待确认
    public static final String WF_LZ="LZ";//流转中
    public static final String WF_CG="CG";//草稿
    public static final String WF_JS="JS";//结束
    public static final String WF_CANCEL="CANCEL";//取消
    public static final String WF_HANG="HANG";//挂起
    public static final String WF_DDJH="DDJH";//待办激活
    public static final String WF_TRDB="TRDB";//他人代办
    public static final String WF_TLZ="TLZ";//停留在
    public static final String WF_GTRQL="GTRQL";//转他人处理
    public static final String WF_JH="JH";//激活
    public static final String WF_operateMode_LOOP="LOOP";//环节操作类型--顺序会签
    public static final String WF_operateMode_XOR="XOR";//环节操作类型--单人处理 
    public static final String WF_operateMode_OR="OR";//环节操作类型--多个消息一人处理
    public static final String WF_operateMode_AND="AND";//环节操作类型--并行会签
    
    public static final String WF_SUBMIT_STATES_TJ="TJ";//环节实例中的提交状态：提交
    public static final String WF_SUBMIT_STATES_TZ="TZ";//环节实例中的提交状态：通知
    public static final String WF_SUBMIT_STATES_JUMP="JUMP";//
    
    public static final String WF_SHDB="SHDB";//收回待办
}
