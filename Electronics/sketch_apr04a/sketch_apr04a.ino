#define fadePin 13
char inData[4]; // Allocate some space for the string
char inChar=-1; // Where to store the character read
byte index = 0; // Index into array; where to store the character


void setup(){
  pinMode(fadePin, OUTPUT);  
  
  Serial.begin(9600);
}
void loop(){
    while (Serial.available() > 0) // Don't read unless
                                   // there you know there is data
    {
        if(index < 3) // One less than the size of the array
        {
            inChar = Serial.read(); // Read a character
            if(inChar == '\0'){continue}
            inData[index] = inChar; // Store it
            index++; // Increment where to write next
            inData[index] = '\0'; // Null terminate the string
        }
    }

}
