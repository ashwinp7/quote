class NotesController < ApplicationController
  # GET /notes
  # GET /notes.xml
  def index
    @notes = Note.all

    respond_to do |format|
	    print format
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
	  
    end
  end

  # GET /notes/result
  # GET /notes/result.xml
  def result
	  print "\n\nstart:"
	  print params[:tags]
	  print ":end \n\n"
	  print Note.tagged_with(params[:tags])

    @notes = Note.tagged_with(params[:tags])

   
    respond_to do |format|
      format.html # result.html.erb
      format.xml  { render :xml => nil }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])
    @newyear = params[:year]
   # if @isclicked != 1
	@note.year  +=1
   # else 
	#@note.year = 2
#end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    @note = Note.new(params[:note])
	@note.tag_list = @note.tag_list.push(@note.author)
	@note.tag_list = @note.tag_list.push(@note.genre)
    respond_to do |format|
      if @note.save
	    print '\n\nBelow is the taglist'
		print @note.tag_list
        format.html { redirect_to(@note, :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(notes_url) }
      format.xml  { head :ok }
    end
  end
  
  def increment 
  @note = Note.find(params[:id])
  @note.year  += 1
  
      respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end

  end
  
  def rss
	@notes = Note.find :all, :limit => 5, :order => 'created_at DESC'

    respond_to do |format|
	    print format
 #response.headers['Content-Type'] = 'application/rss+xml'
 # Render the feed using an RXML template
 #render :file => 'rss.html.erb'
	format.html
	  format.rss { render :action => "feed.rxml", :layout => false }
    end
  end
  
  
end
