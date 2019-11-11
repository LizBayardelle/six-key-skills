class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:index, :destroy, :archive_contact]



  def index
    @contacts = Contact.where(archived: false)
    @archived = Contact.where(archived: true)
  end




  def new
    @contact = Contact.new
  end



  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.new_contact_us(@contact).deliver
        format.html { redirect_to root_path, notice: "Your message has been sent. We'll get back to you within 24 hours." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end




  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def archive_contact
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(archived: true)
      redirect_to contacts_path, notice: "Succesfully archived!  Woohoo!"
    end
  end



  def unarchive_contact
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(archived: false)
      redirect_to contacts_path, notice: "Succesfully un-archived!  Woohoo!"
    end
  end


  def admin_only
    unless current_user && current_user.admin
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end


  private



    def set_contact
      @contact = Contact.find(params[:id])
    end


    def contact_params
      params.require(:contact).permit(
        :first_name,
        :last_name,
        :email,
        :subject,
        :message,
        :archived
      )
    end
end
