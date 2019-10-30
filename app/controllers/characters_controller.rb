class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_races, only: [:show, :edit, :new]
  before_action :set_classes, only: [:show, :edit, :new]

  # GET /characters
  def index
    @characters = Character.all
  end

  # GET /characters/:id
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/:id/edit
  def edit
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /characters/:id
  def update
    if @character.update(character_params)
      redirect_to @character, notice: 'Character was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /characters/:id
  def destroy
    @character.destroy
    redirect_to characters_url, notice: 'Character was successfully destroyed.'
  end

  private

  def character_params
    params.require(:character).permit(:name, :character_race_id, :character_class_id)
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def set_races
    @races = CharacterRace.all.sort_by(&:name).map { |n| [n.name, n.id] }
  end

  def set_classes
    @classes = CharacterClass.all.sort_by(&:name).map { |n| [n.name, n.id] }
  end
end
