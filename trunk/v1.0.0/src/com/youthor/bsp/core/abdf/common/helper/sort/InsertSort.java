package com.youthor.bsp.core.abdf.common.helper.sort;

public class InsertSort extends SortHelper{

    public void sort(int[] data) {
      
            for(int i=1;i<data.length;i++){
                for(int j=i;(j>0)&&(data[j]<data[j-1]);j--){
                    swap(data,j,j-1);
                }
            }        

    }

    public static void main(String args[])
    {
        SortHelper sortHelper=new InsertSort();
        int [] bb=new int[4];
        bb[0]=14;
        bb[1]=5;
        bb[2]=6;
        bb[3]=4;
        sortHelper.sort(bb);
        for(int i=0;i<bb.length;i++)
        {
            System.out.println(bb[i]);
        }
    }

}
