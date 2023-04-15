<?php
class Patient {
    private $name;
    private $surname;
    private $age;
    private $vaccination;

    public function __construct($name, $surname, $age, $vaccination) {
        $this->name = $name;
        $this->surname = $surname;
        $this->age = $age;
        $this->vaccination = $vaccination;
    }

    public function getName() {
        return $this->name;
    }

    public function getSurname() {
        return $this->surname;
    }

    public function getAge() {
        return $this->age;
    }

    public function isVaccinated() {
        return $this->vaccination;
    }
}

class WaitingRoom {
    private $patients = [];

    public function arrivalToWaitingRoom(Patient $patient) {
        if ($patient->isVaccinated()) {
            $index = count($this->patients);
            for ($i = 0; $i < count($this->patients); $i++) {
                if (!$this->patients[$i]->isVaccinated()) {
                    $index = $i;
                    break;
                }
            }
            array_splice($this->patients, $index, 0, [$patient]);
        } else {
            if ($patient->getAge() < 5) {
                $index = count($this->patients);
                for ($i = 0; $i < count($this->patients); $i++) {
                    if ($this->patients[$i]->getAge() >= 5 && !$this->patients[$i]->isVaccinated()) {
                        $index = $i;
                        break;
                    }
                }
                array_splice($this->patients, $index, 0, [$patient]);
            } else {
                $this->patients[] = $patient;
            }
        }

        return $patient->getName() . ' ' . $patient->getSurname();
    }

    public function arrivalToClinic() {
        if (count($this->patients) === 0) {
            return 'No patients in the waiting room.';
        }
        $patient = array_shift($this->patients);
        return $patient->getName() . ' ' . $patient->getSurname();
    }

    public function countWaitingPatients() {
        return count($this->patients);
    }
}

$patient1 = new Patient("Bobby", "One", 14, true);
$patient2 = new Patient("Jimmy", "Two", 26, false);
$patient3 = new Patient("Lilly", "Three", 3, false);
$patient4 = new Patient("Ash", "Four", 7, true);
$patient5 = new Patient("Charlie", "Five", 18, false);

$waitingRoom = new WaitingRoom();


echo "Patient arrived: " . $waitingRoom->arrivalToWaitingRoom($patient1) . "<br>";
echo "Patient arrived: " . $waitingRoom->arrivalToWaitingRoom($patient2) . "<br>";
echo "Patient arrived: " . $waitingRoom->arrivalToWaitingRoom($patient3) . "<br>";
echo "Patient arrived: " . $waitingRoom->arrivalToWaitingRoom($patient4) . "<br>";
echo "Patient arrived: " . $waitingRoom->arrivalToWaitingRoom($patient5) . "<br>";

echo "Number of waiting patients: " . $waitingRoom->countWaitingPatients() . "<br>";

echo "Patient arrived at the clinic: " . $waitingRoom->arrivalToClinic() . "<br>";
echo "Patient arrived at the clinic: " . $waitingRoom->arrivalToClinic() . "<br>";
echo "Patient arrived at the clinic: " . $waitingRoom->arrivalToClinic() . "<br>";
echo "Patient arrived at the clinic: " . $waitingRoom->arrivalToClinic() . "<br>";
echo "Patient arrived at the clinic: " . $waitingRoom->arrivalToClinic() . "<br>";

echo "Number of waiting patients: " . $waitingRoom->countWaitingPatients() . "<br>";