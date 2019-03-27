class Obstacles {
  
  int [] spikePositions = {9};
  int [] doorPositions = {8};
  Spike [] spikes = new Spike[spikePositions.length];
  Door [] doors = new Door[doorPositions.length];
  
  Obstacles(float blockSize, Floor [] floors, Roof [] roofs) {
    for(int i = 0; i < spikes.length; i++){
      spikes[i] = new Spike(floors, spikePositions[i], spikeSize);
    }
    for(int i = 0; i < doors.length; i++) {
     doors[i] = new Door(floors, roofs, doorSpeed, doorWidth); 
    }
  }
  
  void show() {
     for(int i = 0; i < spikes.length; i++) {
       spikes[i].show();
     }
     for(int i = 0; i < doors.length; i++) {
       doors[i].show(doorPositions[i]); 
     }
  }
  
}
