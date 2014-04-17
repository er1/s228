void setup() {
  //being serial communication
  Serial.begin(9600);
  
  // initialize the inputs
  pinMode(2, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);

  //attach the interrupt
  attachInterrupt(0,checkInputs,FALLING);
  
  //notify the user
  Serial.println("Starting");
}

void loop() {
  //not doing anything regularly, so just pause the processor  
  delay(250);
}

void checkInputs() {
  
    //read all the probes when the interrupt is called
    int input0 = digitalRead(4);
    int input1 = digitalRead(5);
    int input2 = digitalRead(6);
    int input3 = digitalRead(7);
    
    //print the values out seperated by spaces
    Serial.print(input0);
    Serial.print(" ");
    Serial.print(input1);
    Serial.print(" ");
    Serial.print(input2);
    Serial.print(" ");
    Serial.println(input3); 

}
