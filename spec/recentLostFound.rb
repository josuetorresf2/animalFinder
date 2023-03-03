describe DisplayMesssages do 

    # The method should be well defined with no error
    describe 'DisplayMesssages' do
    it 'should be defined' do
        expect { DisplayMesssages }.not_to raise_error
    end

    context “When testing the DisplayMesssages class” do 

        # Testing Return empty string for did not report any lost or found pet
        it "should return null message when we call the not_displaying method" do 
            displayNothing = DisplayMesssages.new 
            message = displayNothing.not_displaying 
            expect(message).to be_nil
        end
    
        # Testing return a simple recently lost pet message when call the lost method
        it "should say "Recently lost pet" when we call the display_lost method" do 
            recentLost = DisplayMesssages.new 
            message = recentLost.display_lost 
            expect(message).to eq "Recently lost pet"
        end

        # Testing return a simple recently found pet message when call the found method
        it "should say "Recently found pet" when we call the display_found method" do 
            recentFound = DisplayMesssages.new 
            message = recentFound.display_found
            expect(message).to eq "Recently found pet"
        end
        
        # Testing return a false when displaying the wrong message with wrong information
        it "should return false when displaying the wrong message" do
            recentLost = DisplayMesssages.new
            message = recentLost.display_found
            expect(message).to eq "Recently lost pet".to be false
        end
        
        # Creating pet's data
        describe DisplayMesssages.new "John", "Smith" do 
            it { is_expected.to have_attributes(first_name: "John") } 
            it { is_expected.to have_attributes(last_name: "Smith") }
        end

        # Testing name, breed and location variables
        it "getters and setters of veriables" do
            before(:each)   { @pet = DisplayMesssages.new('Rocky', 'Beagle', 'UCCS')}
            it 'should set name' do
                expect(@pet.name).to eq('Rocky')
            end
            
            it 'should set breed' do
                expect(@pet.breed).to eq('Beagle')
            end

            it 'should set location' do
                expect(@pet.location).to eq('UCCS')
            end

            it 'should be able to change name' do
                @pet.name = 'Poppy'
                expect(@pet.name).to eq('Poppy')
            end

            it 'should be able to change breed' do
                @pet.breed = 'Poodle'
                expect(@pet.breed).to eq('Poodle')
            end

            it 'should be able to change location' do
                @pet.location = 'Safeway'
                expect(@pet.location).to eq('Safeway')
            end
        end
            
      
    end
end