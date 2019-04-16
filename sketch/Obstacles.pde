class Obstacles {

  Spike [] spikes = new Spike[spikePositions.size()];
  Door [] doors = new Door[doorPositions.size()];
  
  Obstacles(Floor [] floors, Roof [] roofs) {
    for(int i = 0; i < spikePositions.size(); i++){
      spikes[i] = new Spike(floors, spikePositions.getInt(str(i)), spikeSize);
    }
    for(int i = 0; i < doorPositions.size(); i++) {
      doorSpeed = random(1, 5);
      doors[i] = new Door(floors, roofs, doorSpeed, doorWidth, doorPositions.getInt(str(i))); 
    }
  }
  
  void show() {
     for(int i = 0; i < spikes.length; i++) {
        spikes[i].show();
     }
     for(int i = 0; i < doors.length; i++) {
        doors[i].show(); 
     }
  }
}
