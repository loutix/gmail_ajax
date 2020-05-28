class EmailsController < ApplicationController
  def new
      
  end

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    
    puts "********************"
    puts @email.id
    puts @email.object
    puts @email.body
    puts "********************"
    respond_to do |format|
      format.html { redirect_to show_path(@email.id) }
      format.js { }
    end
  end

  def create 
    @email = Email.new(
      object: Faker::Book.title,
      body: Faker::Movies::Lebowski.quote)

      
      if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      #redirect_to root_path
      flash[:notice] = "Email créé"
      else
      #redirect_to root_path
      flash[:notice] = "Oups, erreur à la création"
      end
    
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy  
    #@emails = Email.all.reverse 	

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end

  end

  private

  def email_params
    params.permit(:object, :body)
  end

end
