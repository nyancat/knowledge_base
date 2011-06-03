class FactsController < ApplicationController
  def index
    @facts = Fact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facts }
    end
  end

  def show
    @fact = Fact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fact }
    end
  end

  def new
    @fact = Fact.new
    @tags = Tag.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fact }
    end
  end

  def edit
    @fact = Fact.find(params[:id])
    @tags = Tag.all
  end

  def create
    @fact = Fact.new(params[:fact])
    @fact.user = current_user
    @tags = Tag.all

    respond_to do |format|
      if @fact.save
        format.html { redirect_to(@fact, :notice => 'Fact was successfully created.') }
        format.xml  { render :xml => @fact, :status => :created, :location => @fact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @fact = Fact.find(params[:id])

    respond_to do |format|
      if @fact.update_attributes(params[:fact])
        format.html { redirect_to(@fact, :notice => 'Fact was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    if @fact.user = current_user
      @fact.destroy
    end

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end
