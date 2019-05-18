/*
Lorenzo Anzuini
 14/05/2019
 Thesis Prototype
 
 This sketch is an initial prototype of the interface
 that the screen based part of my thesis project might have.
 
 It draws a basic user interface that the users can navigate through
 by clicking buttons. The buttons can be used to answer questions 
 that the program asks.
 
 The second to last stage of the process has no buttons because it 
 would entail the use of of a physical part of the interface.
 The last stage of the process has no buttons because it gives the user information.
 
 The data gathered through the buttons would be used to calculate the information
 given to the user in the last stage of the process.
 
 The Button tab creates the basic button object that the user can click
 The UserInt tab creates the DONE and BACK buttons used to navigate
 through the stages of the process, the questions being asked to the user,
 and handles an array of Button objects to give the user divverent options.
 
 
 v1.0
 */

//Data

//initializing the User Interface object
UserInt ui;

void setup() {
  size(600, 600);  

  ui = new UserInt();
}

void draw() {
  background(255);


  ui.show();
}


//Other Functions

/*
This function controls the stage variable of the
 UserInt object, determing what is being drawn
 and turns the last button that has been clicked black
 and the other ones white
 */
void mousePressed() {

  //when the BACK button is clicked the previous stage is drawn
  if (dist(ui.backButtonX, ui.backButtonY, mouseX, mouseY) < ui.basicD && ui.stage >0) {
    ui.stage--;
    ui.update();
  }

  //when the DONE button is clicked the next stage is drawn
  if (dist(ui.doneButtonX, ui.doneButtonY, mouseX, mouseY) < ui.basicD && ui.stage <4) {
    ui.stage++;
    ui.update();
  }

  //when the DONE button is clicked at the last stage
  //the program resets to the first stege
  if (dist(ui.doneButtonX, ui.doneButtonY, mouseX, mouseY) < ui.basicD && ui.stage >=4) {
    ui.stage = 0;
    ui.update();
  }

  //variables to chek which button has been clicked
  int selectedIndexPos = 0;
  int indexPos = 0;

  //when a button is clicked it turns black
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      if (ui.buttons[i][j] != null) {
        if (dist(ui.buttons[i][j].centreX, ui.buttons[i][j].centreY, mouseX, mouseY) < ui.buttonsD) {
          ui.buttons[i][j].bStroke = 255;
          ui.buttons[i][j].bFill = 0;
          selectedIndexPos = indexPos;
        }
      }
      indexPos++;
    }
  }
  //the other buttons turn white
  indexPos = 0;
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      if (ui.buttons[i][j] != null) {
        if (indexPos != selectedIndexPos) {
          ui.buttons[i][j].bStroke = 0;
          ui.buttons[i][j].bFill = 255;
        }
      }
      indexPos++;
    }
  }
}
