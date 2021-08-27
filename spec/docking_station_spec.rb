require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }
   
  
  it "return bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike 
  end

  it 'docks bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end
  
  it 'raise an error when docking_station is empty'do 
    expect{subject.release_bike}.to raise_error "No bikes available"
  end

  it 'raise an error when docking_station is full' do
    subject.dock(Bike.new)
    expect{ subject.dock(Bike.new) }.to raise_error "Docking station is full"
  end
  
end