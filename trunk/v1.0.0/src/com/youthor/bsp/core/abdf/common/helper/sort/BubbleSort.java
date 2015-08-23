package com.youthor.bsp.core.abdf.common.helper.sort;

public class BubbleSort extends SortHelper{

    public void sort(int[] data) {
      
        for(int i=0;i<data.length;i++){
            for(int j=data.length-1;j>i;j--){
                if(data[j]<data[j-1]){
                    swap(data,j,j-1);
                }
            }
        }
    }

    public static void main(String args[])
    {
        SortHelper sortHelper=new BubbleSort();
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
