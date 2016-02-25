class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :confirmed_logged_in

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    # TODO: essentially there would be one, and only one stream, per each member that would be populated with new songs each time they revistied the application.

    # Psuedo code:
    # if there is already a stream created for the logged in member, and it's populated with songs, then continue on.
    # if !@stream.save do
      # create a new stream,
      # @stream = Stream.new

      # associate it with a member,
      # @stream.member = self

      # populate it with a randomized list of songs
      # @stream.songs = Song.randomized_queue

      # start using that stream as it's queue for listening.
      # @stream.save
      # return @stream

    # elsif @stream.songs.empty? do
      # return @stream.songs = Song.randomized_queue
    # end
    # @stream
    # TODO: reset to Song.find_by_id(params[:id])
    @song = Song.find_by_id(1)
    @song
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    # add new song in Song db
    @song = Song.new(song_params)
    member = @song
    # determine current member adding song
    # append new song to the current members songs list. (member.songs << @song)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      # TODO: reset to Song.find_by_id(params[:id])
      @song = Song.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:artist, :title, :url, :duration, :format, :is_playing)
    end
end
