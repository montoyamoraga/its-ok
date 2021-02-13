//its ok to die
//by aaron montoya-moraga
//april 2017
//v0.0.6

//variables for screen division
int screenDivision = 7;
int screenStart = 1;
int screenStep = 1;

//variables for current date
int currentYear, currentMonth, currentDay, currentHour, currentMinute, currentSecond;  // Values from 0 - 59
//int for leap year
int currentLeapYear = 0;

//variables for birth date
//1989, july, 3rd, 3:57pm
int birthYear = 1989;   // 2003, 2004, 2005, etc.
int birthMonth = 7;  // Values from 1 - 12
int birthDay = 3;    // Values from 1 - 31

//variable for life expectancy
int lifeExpectancy = 72;

//variables for death date
//1989, july, 3rd, 3:57pm
int deathYear = birthYear + lifeExpectancy;   // 2003, 2004, 2005, etc.
int deathMonth = 7;  // Values from 1 - 12
int deathDay = 3;    // Values from 1 - 31

//array of days for each month:
int[] monthDays = {31, 28, 31, 30, 
  31, 30, 31, 31, 
  30, 31, 30, 31};

//time left
int leftYear, leftMonth, leftDay;

void updateLeft() {

  //calculate years left
  leftYear = deathYear - currentYear;

  //calculate months left
  //if current month is greater than birth month
  if (currentMonth > birthMonth) {
    //rectify years
    leftYear = leftYear - 1;
    leftMonth = 12 - abs(birthMonth - currentMonth);
  } else {
    leftMonth = abs(birthMonth - currentMonth);
  }



  //calculate days left
  //if current day is greater than birth day
  if (currentDay > birthDay) {
    //rectify month
    leftMonth = leftMonth - 1;
    //calculate days, birthDay + remaining of current month
    leftDay = birthDay + monthDays[currentMonth-1]-currentDay + currentLeapYear;
  }
  //direct calculation of day
  else {
    leftDay =  birthDay - currentDay;
  }
}

String birthInfo = " aarón was born on 07/03/1989";
String expectancyInfo = "1989-born chilean males' life expectancy is 72 years";
String deathDate = "aarón should be dead by 07/03/2061";
String todayDate;

String remainingInfo;
//String closure = "aarón thinks this is not a big deal, it's ok to die";
String closure = "it's ok to die";

void setup() {
  fullScreen();
  //size(1000, 800);
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(26);
  noCursor();
}

void draw() {

  //reset background
  background(0);

  updateCurrentMoment();
  updateLeft();
  updateText();

  text(birthInfo, width/2, height*screenStep*1/screenDivision);
  text(expectancyInfo, width/2, height*screenStep*2/screenDivision);
  text(deathDate, width/2, height*screenStep*3/screenDivision);
  text(todayDate, width/2, height*screenStep*4/screenDivision);
  text(remainingInfo, width/2, height*screenStep*5/screenDivision);
  text(closure, width/2, height*screenStep*6/screenDivision);
}

void updateCurrentMoment() {
  //variables for current date
  currentYear = year();   // 2003, 2004, 2005, etc.
  //currentYear = 2060;   // 2003, 2004, 2005, etc.
  currentMonth = month();  // Values from 1 - 12
  //currentMonth = 6;  // Values from 1 - 12
  currentDay = day();    // Values from 1 - 31
  //currentDay = 4;    // Values from 1 - 31
  currentHour = hour();    // Values from 0 - 23
  currentMinute = minute();  // Values from 0 - 59
  currentSecond = second();  // Values from 0 - 59

  //currentLeapYear is 1 (true) or 0 (false)
  if (currentYear % 4 == 0) {
    currentLeapYear = 1;
  } else {
    currentLeapYear = 0;
  }
}

void updateText() {
  String formattedDay, formattedMonth, formattedYear;
  if (currentDay < 10) {
    formattedDay = "0" + currentDay;
  } else {
    formattedDay = String.valueOf(currentDay);
  }
  if (currentMonth < 10) {
    formattedMonth = "0" + currentMonth;
  } else {
    formattedMonth = String.valueOf(currentMonth);
  }

  formattedYear = String.valueOf(currentYear);

  todayDate = "today is " + formattedMonth + "/"  + formattedDay + "/" + formattedYear;

  if (leftYear > 0 || leftMonth > 0 || leftDay > 0) {
    remainingInfo =  "aarón has " + leftYear;

    if (leftYear > 1) {
      remainingInfo = remainingInfo + " years, ";
    } else {
      remainingInfo = remainingInfo + " year, ";
    }

    remainingInfo = remainingInfo + leftMonth;

    if (leftMonth > 1) {
      remainingInfo = remainingInfo + " months, ";
    } else {
      remainingInfo = remainingInfo + " month, ";
    }

    remainingInfo = remainingInfo + leftDay;

    if (leftDay > 1) {
      remainingInfo = remainingInfo + " days ";
    } else {
      remainingInfo = remainingInfo + " day ";
    }
    
    remainingInfo = remainingInfo + "left to live";

  } else {
    remainingInfo = "aarón should be dead by now";
  }
}