require "docking_station"

describe DockingStation do
  let(:bike) { Bike.new }

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }
  
  it 'docks bike' do
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'releases working bikes' do
    expect(bike).to be_working
  end
  
  it 'raise an error when docking_station is empty'do 
    expect{subject.release_bike}.to raise_error "No bikes available"
  end
  
  it 'raise an error when docking_station is full' do
    subject.capacity.times { subject.dock(:bike) }
    expect{ subject.dock(:bike) }.to raise_error "Docking station is full"
  end
  
  it 'has a default capacity of 20'do
  expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  
  it 'defaults capacity' do
  DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(Bike.new) }.to raise_error "Docking station is full"
  end

end