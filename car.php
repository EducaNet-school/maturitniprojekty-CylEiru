<?php
class Car{
    private $type;
    private $brand;
    
    public function __construct($type, $brand){
        $this->type = $type;
        $this->brand = $brand;
    }
    
    public function returnInfo(){
        print "<br>".$this->type.", ";
        print $this->brand;
    }
}

class Truck extends Car{
    private $capacity;
    
    public function __construct($type, $brand, $capacity){
        parent::__construct($type, $brand);
        $this->capacity = $capacity;
    }
    
    public function returnInfo(){
        parent::returnInfo();
        print ", ".$this->capacity;
    }
}

class EleCar extends Car{
    private $nyoom;
    
    public function __construct($type, $brand, $nyoom){
        parent::__construct($type, $brand);
        $this->nyoom = $nyoom;
    }
    
    public function returnInfo(){
        parent::returnInfo();
        print ", ".$this->nyoom;
    }
}

$beeper = new Car("Car", "Fornda");
$beeper->returnInfo();
$booper = new Truck("Truck", "Skord", "Thicc");
$booper->returnInfo();
$snooper = new EleCar("EleCar", "Myoba", "Fastt");
$snooper->returnInfo();