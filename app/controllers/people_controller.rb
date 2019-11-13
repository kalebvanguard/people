class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create 
    @person = Person.new(person_params)
    if @person.save
      redirected_to person_path(@person.id)
      
    else render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(paramsv[:id])
    if @person.update(person_params)
      redirect_to person_path(@person.id)     
    else
    render :edit
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to person_path
  end



  private 
  def person_params
  params.require(:person).permit(:first_name, :last_name, :age, :hair_color, :eye_color, :gender,  :alive)
  end

end