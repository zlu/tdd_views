require 'spec_helper'

describe ApplicationHelper do
	describe '#show_content_for' do
		context 'for HR folks' do
			it 'shows people to fire' do
				user = stub('User', :has_role? => true)
				helper.stub(:current_user).and_return(user)
				content_to_show = helper.show_content_for(:hr) { 'people to fire'}
				content_to_show.should eq 'people to fire'
			end
		end

		context 'for regular employees' do
			it 'does not show people to fire' do
				user = stub('User', :has_role => false)
				helper.stub(:current_user).and_return(user)
				content_to_show = helper.show_content_for(:hr) { 'people to fire'}
				content_to_show.should eq nil
			end
		end
	end
end