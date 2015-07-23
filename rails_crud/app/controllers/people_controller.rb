class PeopleController < ApplicationController
  def index
    render json: Person.all
  end

  def show
    render json: Person.find(params[:id])
  end

  def update
    person = Person.find(params[:id])

    if person.update_attributes(person_params)
      render json: person
    else
      render json: { error: 'Person could not be updated.'}, status: 422
    end
  end

  def create
    person = Person.new(params)

    if person.save
      render json: person
    else
      render json: { error: 'Person could not be created.'}, status: 422
    end
  end

  def destroy
    person = Person.find(params[:id])

    person.destroy
    head :ok
  end

  private
  def person_params
    params.require(:person).permit([:surname, :given_name, :gender, :dob, :middle_name])
  end
end
