/*
This class handles and draws the User Interface
 It handles the BACK and DONE buttons
 a 2D array of Button objects
 And an array of questions asked to the user
 */

class UserInt {

  //Data

  //this variable determines what is drawn on the screen
  //it is changed by the mousePressed() function in the 
  //main tab, and it is used by the update() function
  int stage;

  //DONE and BACK buttons coordinates
  float doneButtonX, doneButtonY;
  float backButtonX, backButtonY;

  //DONE and BACK buttons diameter
  float basicD;

  //thext shown in the DONE and BACK buttons
  String done, back;

  //2D array of button objects that the users can click to
  //answer the questions asked
  Button[][] buttons;

  //used to determine where the questions will be drawn
  float questionZoneW, questionZoneH;


  //position of the buttons in the array
  float buttonsX, buttonsY;

  //diameter of the buttons in the array
  float buttonsD;

  //used to store the questions that are asked to the user at every stage
  String[] questions = {"What product are you buying?", "In what quantity?", "Connect the place it comes from \nand the place you live", "The environmental footprint \nof this product is X\nWhy not try a local one?"};

  //used to store the options tha the user can select respectively in the first and second stage
  String[] options1 = {"Potatoes", "Carrots", "Lemons", "Apples"};
  String[] options2 = {"100g", "200g", "500g", "1kg"};

  //used to store the current index position of the question that isbeing asked
  int currentQuestion;

  //used to assign the correct option to every button object
  int indexPos;


  //Constructor
  UserInt() {

    stage = 0;
    currentQuestion = 0;
    indexPos = 0;

    //calculating the position of the DONE button
    //in relation to screen size
    doneButtonX = width*2/3;
    doneButtonY = height*5/6;

    //calculating the position of the BACK button
    //in relation to screen size
    backButtonX = width/3;
    backButtonY = height*5/6;

    //calculating where the question will be shown
    //in relation to screen size
    questionZoneW = width;
    questionZoneH = height/4;


    basicD = height/10;

    done = "DONE";
    back = "BACK";

    buttonsD = height/8;

    //initializing the array of Button objects
    buttons = new Button[2][2];

    //initializing the Button object to the first stage
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {


        float buttonX = width/2-buttonsD*3/2+buttonsD*i*3;
        float buttonY = height/2-buttonsD*3/2+buttonsD*j*3/2;

        buttons[i][j] = new Button(buttonX, buttonY, buttonsD, options1[indexPos], color(0), color(255));

        indexPos++;
      }
    }
  }

  //Other Functions

  /*
  This function detrermines what will be dreawn by the show() function
   depenidng on the stage variable.
   The stage variable is constrolled by the mousePressed() function
   in the main tab, which also calls this function
   */
  void update() {
    switch(stage) {
    case 0:


      currentQuestion = 0;

      indexPos = 0;
      //assigning new values to the Button objects
      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {

          float buttonX = width/2-buttonsD*3/2+buttonsD*i*3;
          float buttonY = height/2-buttonsD*3/2+buttonsD*j*3/2;

          buttons[i][j] = new Button(buttonX, buttonY, buttonsD, options1[indexPos], color(0), color(255));

          indexPos++;
        }
      }
      break;

    case 1:
      currentQuestion = 1;

      //assigning new values to the Button objects
      indexPos = 0;
      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
          float buttonX = width/2-buttonsD*3/2+buttonsD*i*3;
          float buttonY = height/2-buttonsD*3/2+buttonsD*j*3/2;

          buttons[i][j] = new Button(buttonX, buttonY, buttonsD, options2[indexPos], color(0), color(255));
          indexPos++;
        }
      }
      break;

    case 2:
      currentQuestion = 2;

      //this stage has no buttons since it would entail a physical part of the interface
      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {

          buttons[i][j] = null;
        }
      }
      break;

    case 3:
      currentQuestion = 3;

      //this stage has no buttons 
      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {

          buttons[i][j] = null;
        }
      }
      break;
    }
  }

  /*
  This function draws the user interface
   depending on what has been determined in the update() function
   */
  void show() {

    //drawing the BACK and DONE buttons
    pushStyle();

    textAlign(CENTER, CENTER);
    textSize(height/40);

    stroke(255, 0, 0);
    fill(255, 200, 200);
    ellipse(backButtonX, backButtonY, basicD, basicD);
    fill(0);
    text(back, backButtonX, backButtonY);

    stroke(0, 255, 0);
    fill(200, 255, 200);
    ellipse(doneButtonX, doneButtonY, basicD, basicD);
    fill(0);
    text(done, doneButtonX, doneButtonY);

    popStyle();


    //drawing the Button objects in the array
    pushStyle();

    textAlign(CENTER, CENTER);
    textSize(height/20);

    fill(0);
    text(questions[currentQuestion], questionZoneW/2, questionZoneH/2);

    popStyle();

    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        if (buttons[i][j] != null) {
          buttons[i][j].show();
        }
      }
    }
  }
}
