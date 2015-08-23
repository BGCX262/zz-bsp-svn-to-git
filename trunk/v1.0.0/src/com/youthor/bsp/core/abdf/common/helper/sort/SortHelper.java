package com.youthor.bsp.core.abdf.common.helper.sort;

public abstract class SortHelper {
    public void swap(int [] data,int i,int j)
    {
        int temp=data[i];
        data[i]=data[j];
        data[j]=temp;
    }
    abstract public  void sort(int[] data);
}
