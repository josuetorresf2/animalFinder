#Animal data base test will be added here
describe 'it should store lost animals' do
    expect(animal).to be_present
end

describe 'it should save dogs information' do
    expect(species).to be_present(dog)
end

describe 'it should save cats information' do
    expect(species).to be_present(cat)
end

describe 'it should save the animal name' do
    expect(id_to?['doggo']).to be true
end
