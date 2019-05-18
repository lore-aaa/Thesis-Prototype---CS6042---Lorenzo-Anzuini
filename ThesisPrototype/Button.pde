/*
This object creates a circular button that displays texts in the middle
 The UserInt object hadles a 2D array of this objects
 when a button is clicked, it is turbed black (and the others are turned white)
 by the mousePressed() function in the main tab
 
 */

class Button {

  //Data

  //coordinates of the button
  float centreX, centreY;

  //diameter of the button
  float d;

  //text shown by the button
  String text;

  //colour of the stroke of the circle and of the internal text
  color bStroke;

  //fill colour of the circle
  color bFill;


  //Constructor
  Button(float centreX_, float centreY_, float d_, String text_, color bStroke_, color bFill_) {

    centreX = centreX_;
    centreY = centreY_;
    d = d_;
    text = text_;
    bStroke = bStroke_;
    bFill = bFill_;
  }

  //Other Functions

  /*
  This function draws a button depending on the information 
   that has been given in the constructor
   */
  void show() {
    pushStyle();

    textAlign(CENTER, CENTER);
    textSize(height/40);

    stroke(bStroke);
    fill(bFill);
    ellipse(centreX, centreY, d, d);
    fill(bStroke);
    text(text, centreX, centreY);


    popStyle();
  }
}
