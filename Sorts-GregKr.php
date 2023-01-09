<?php
function BubbleSort($arr){
    $size = count($arr)-1;
    for ($hold1=0; $hold1<$size; $hold1++) {
        for ($hold2=0; $hold1<$size-$hold2; $hold1++) {
            $hold3 = $hold1+1;
            if ($arr[$hold3] < $arr[$hold1]) {
                list($arr[$hold1], $arr[$hold3]) = array($arr[$hold3], $arr[$hold1]);
            }
        }
    }
    return $arr;
}

function SelectionSort($arr){
    $size=count($arr);
    $swap=null;
    $temp=null;
 
    for($hold1=0; $hold1<$size-1; $hold1++)
    {
        $swap=$hold1;
        for($hold2=$hold1+1; $hold2<$size; $hold2++)
        {
            if($arr[$hold2]<$arr[$swap])
            {
                $swap=$hold2; 
            }
        }
        $temp=$arr[$hold1];
        $data[$hold1]=$data[$swap];
        $data[$swap]=$temp;
    }
 
    return $arr;
}


$arr = array(22,35,67,89,87,65,34,51);

print("Before sorting");
print_r($arr);

$arrBS = BubbleSort($arr);
print("After sorting with Bubble Sort");
print_r($arrBS);

$arrSS = SelectionSort($arr);
print("After sorting with Selection Sort");
print_r($arrSS);