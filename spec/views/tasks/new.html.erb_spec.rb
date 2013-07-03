require 'spec_helper'

describe 'tasks/new.html.erb' do
	let(:task) { mock_model('Task', name: 'buy milk').as_new_record }

	before do
		assign(:task, task)
		render
	end

	it 'displays New Task' do				
		rendered.should contain 'New Task'
	end

	it 'displays a create task form' do
		rendered.should have_selector('form', method: 'post', action: tasks_path) do |form|
			form.should have_selector('input', type: 'submit')
		end
	end

	it 'displays task name field' do
		rendered.should have_selector('form', method: 'post', action: tasks_path) do |form|
			form.should have_selector('input', id: 'task_name', name: 'task[name]', type: 'text')
		end
	end
end