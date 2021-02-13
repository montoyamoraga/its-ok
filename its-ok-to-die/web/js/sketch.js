//its ok to die
//by aaron montoya-moraga
//march 2018
//v1.0.1

//variables for screen division
let screenDivision = 7;
let screenStart = 1;
let screenStep = 1;

//variables for current date
let currentYear
let currentMonth
let currentDay;
let currentHour;
let currentMinute;
let currentSecond;  // Values from 0 - 59
//variable for leap year
let currentLeapYear = 0;

//variables for birth date
//1989, july, 3rd, 3:57pm
let birthYear = 1989;   // 2003, 2004, 2005, etc.
let birthMonth = 7;  // Values from 1 - 12
let birthDay = 3;    // Values from 1 - 31

//variable for life expectancy
//current version just adds up years, because its easier
//TODO: use decimals to calculate death day and death month
let lifeExpectancy = 72.23;
let lifeExpectancyYears = Math.floor(lifeExpectancy);
// let lifeExpectancyMonths = Math.floor(lifeExpectancy-lifeExpectancyYears);
// let lifeExpectancyDays = Math.floor(lifeExpectancy-lifeExpectancyYears - lifeExpectancyMonths);

//variables for death date
let deathYear = birthYear + lifeExpectancyYears;   // 2003, 2004, 2005, etc.
let deathMonth = birthMonth;  // Values from 1 - 12
let deathDay = birthDay;    // Values from 1 - 31

//array of days for each month:
let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

//time left
let leftYear, leftMonth, leftDay;

function updateLeft() {

  //calculate years left
  leftYear = deathYear - currentYear;

  //calculate months left
  //if current month is greater than or equal to birth month
  if (currentMonth >= birthMonth) {
    //rectify years
    leftYear = leftYear - 1;
    leftMonth = 12 - Math.abs(birthMonth - currentMonth);
  } else {
    leftMonth = Math.abs(birthMonth - currentMonth);
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

let birthInfo = " aarón was born on 07/03/1989 in chile";
let expectancyInfo = "1989-born chileans' life expectancy is 72 years";
let deathDate = "aarón should be dead by 07/03/2061";
let todayDate;

let remainingInfo;
//let closure = "aarón thinks this is not a big deal, it's ok to die";
let closure = "it's ok to die";

function setup() {
  // put setup code here
  createCanvas(windowWidth, windowHeight);
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(26);
  noCursor();
}

function draw() {
  // put drawing code here

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

function updateCurrentMoment() {
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

function updateText() {
  let formattedDay, formattedMonth, formattedYear;
  if (currentDay < 10) {
    formattedDay = "0" + currentDay;
  } else {
    formattedDay = String(currentDay);
  }
  if (currentMonth < 10) {
    formattedMonth = "0" + currentMonth;
  } else {
    formattedMonth = String(currentMonth);
  }

  formattedYear = String(currentYear);

  todayDate = "right now is " + formattedMonth + "/"  + formattedDay + "/" + formattedYear + " " + currentHour + ":" + currentMinute + ":" + currentSecond;

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

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
