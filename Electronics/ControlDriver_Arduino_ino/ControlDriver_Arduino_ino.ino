
int ledPin = 13;
int aChamber = 2;
int bChamber = 3;
int cChamber = 4;
int dChamber = 5;
int eChamber = 6;
int fChamber = 7;
char chamber = 0;
int value = 0;

//Sensor infomation
int sensorPin = A0;
int sensorValue = 0;

void setup() {
	Serial.begin(9600);

	pinMode(aChamber, OUTPUT);
	pinMode(bChamber, OUTPUT);
	pinMode(cChamber, OUTPUT);
	pinMode(dChamber, OUTPUT);
	pinMode(eChamber, OUTPUT);
	pinMode(fChamber, OUTPUT);
	digitalWrite(ledPin, LOW);
	pinMode(sensorPin, INPUT);
	analogReference(DEFAULT);
}

void loop(){
//Sensing Something Voltage/Amperage/stuff.
delay(200); 
sensorValue = analogRead(sensorPin);
sensorValue= sensorValue/10.24;
Serial.print("S1 ");
Serial.println(value);

// Changing the Values on the chambers. 
	if(Serial.available() > 0) {

		chamber = Serial.read();
		if (chamber == 'S'){
			Serial.print("O");
		}else{
			value = Serial.parseFloat();

			//This helps us to know what values are going in and comming out. 
			//Serial.print(chamber);
			//Serial.println(value);

			if( chamber == 'A') {
				analogWrite(aChamber, value);
				Serial.print("Im A Im At ");
				Serial.println(value);
			}
			if (chamber == 'B'){
				analogWrite(bChamber, value);
				Serial.print("Im B Im At ");
				Serial.println(value);
			}
			if (chamber == 'C'){
				analogWrite(cChamber, value);
				Serial.print("Im C Im At ");
				Serial.println(value);
			}
			if (chamber == 'D'){
				analogWrite(dChamber, value);
				Serial.print("Im D Im At ");
				Serial.println(value);
			}
			if (chamber == 'E'){
				analogWrite(eChamber, value);
				Serial.print("Im E Im At ");
				Serial.println(value);
			}
			if (chamber == 'F'){
				analogWrite(fChamber, value);
				Serial.print("Im F Im At ");
				Serial.println(value);
			}
		}
	}
	

	
}

