class Studentinfo{
   String name;
   String studentID;
   double grade;

  Studentinfo(this.name, this.studentID, this.grade);

  void displayinfo(){
    print('Student Name : $name');  
    print('Student ID : $studentID');
    print('Student Grade : $grade');
  }

  bool passthegrade(){
    return grade >= 70 ;
  }
}

