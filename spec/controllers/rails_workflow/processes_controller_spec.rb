# frozen_string_literal: true

require 'rails_helper'

module RailsWorkflow
  RSpec.describe ProcessesController, type: :controller do
    routes { RailsWorkflow::Engine.routes }

    before :each do
      @template = create :process_template
    end

    let(:valid_attributes) do
      {
        title: 'First Test project',
        template_id: @template.id
      }
    end

    let(:invalid_attributes) do
      skip('Add a hash of attributes invalid for your model')
    end

    describe 'GET index' do
      it 'assigns all processes as @processes' do
        process = RailsWorkflow::Process.create! valid_attributes
        get :index
        expect(assigns(:processes)).to eq([process])
      end
    end

    describe 'GET show' do
      it 'assigns the requested process as @process' do
        process = RailsWorkflow::Process.create! valid_attributes
        get :show, params: { id: process.to_param }
        expect(assigns(:process)).to eq(process)
      end
    end

    describe 'GET new' do
      it 'assigns a new process as @process' do
        get :new
        expect(assigns(:process)).to be_a_new(Process)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested process as @process' do
        process = RailsWorkflow::Process.create! valid_attributes
        get :edit, params: { id: process.to_param }
        expect(assigns(:process)).to eq(process)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new WfProcess' do
          expect do
            post :create, params: { process: valid_attributes }
          end.to change(RailsWorkflow::Process, :count).by(1)
        end

        it 'assigns a newly created process as @process' do
          post :create, params: { process: valid_attributes }
          expect(assigns(:process)).to be_a(Process)
          expect(assigns(:process)).to be_persisted
        end

        it 'redirects to the created process' do
          post :create, params: { process: valid_attributes }
          expect(response).to redirect_to(Process.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved process as @process' do
          post :create, params: { process: invalid_attributes }
          expect(assigns(:process)).to be_a_new(Process)
        end

        it "re-renders the 'new' template" do
          post :create, params: { process: invalid_attributes }
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          skip('Add a hash of attributes valid for your model')
        end

        it 'updates the requested process' do
          process = Process.create! valid_attributes
          put :update, params: { id: process.to_param, process: new_attributes }
          process.reload
          skip('Add assertions for updated state')
        end

        it 'assigns the requested process as @process' do
          process = Process.create! valid_attributes
          put :update, params: {
            id: process.to_param,
            process: valid_attributes
          }
          expect(assigns(:process)).to eq(process)
        end

        it 'redirects to the process' do
          process = Process.create! valid_attributes
          put :update, params: {
            id: process.to_param,
            process: valid_attributes
          }
          expect(response).to redirect_to(processes_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns the process as @process' do
          process = Process.create! valid_attributes
          put :update, params: {
            id: process.to_param,
            process: invalid_attributes
          }
          expect(assigns(:process)).to eq(process)
        end

        it "re-renders the 'edit' template" do
          process = Process.create! valid_attributes
          put :update, params: {
            id: process.to_param,
            process: invalid_attributes
          }
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested process' do
        # process = Process.create! valid_attributes
        # expect {
        #   delete :destroy, {:id => process.to_param}, valid_session
        # }.to change(Process, :count).by(-1)
      end

      it 'redirects to the processes list' do
        # process = Process.create! valid_attributes
        # delete :destroy, {:id => process.to_param}, valid_session
        # expect(response).to redirect_to(processes_path)
      end
    end
  end
end
