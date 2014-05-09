class WelcomeController < ApplicationController
  def index

  end

  def load_state
    @states = State.by_country(params[:country])
    result = @states.collect do |state|
      {id: state.id, name: state.name}
    end
    render json: result
  end
end
