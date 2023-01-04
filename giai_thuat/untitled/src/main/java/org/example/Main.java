package org.example;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
//parent =[1,4,5,2,3,2,3,1] child=[1,2,3] => return 2;//xuất hiện 2 lần

    int solution(int[] parent, int[] child) {
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < child.length; i++) {
            int count = 0;
            for (int j = 0; j < parent.length; j++) {
                if(child[i] == parent[j]){
                    count++;
                }
            }
            list.add(count);
        }

        boolean flag = true;
        int min = list.get(0);
        for (Integer value : list) {
            if (value < 0) {
                flag = false;
                break;
            }
        }

        for (Integer integer : list) {
            if (integer < min) {
                min = integer;
            }
        }
        if(flag){
            return min;
        }
        return 0;


//        boolean flag = true;
//        for (int i = 0; i < list.size()-1; i++) {
//                if(list.get(i) != list.get(i+1)){
//                    flag = false;
//                    break;
//            }
//        }
//        if(flag && list.get(0) >0){
//            return list.get(0);
//        }
//        return 0;
    }

}